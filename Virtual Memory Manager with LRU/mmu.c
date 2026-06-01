#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <limits.h>


#define FRAME_SIZE 256
#define NUM_PAGES 256
#define TLB_SIZE 16


//Hit rate variables
float tlb_miss = 0;
float page_fault = 0;
int numberOfAddresses = 0;

typedef struct {
    int page_number;
    int frame_number;
} TLB_Entry;


int page_table[NUM_PAGES];
int next_free_frame = 0;

TLB_Entry tlb[TLB_SIZE];
int tlb_count = 0; //current number of entries
int next_tlb_entry = 0;


int search_TLB(int page_number) {
    for (int i = 0; i < tlb_count; i++) {
        if (tlb[i].page_number == page_number) {
            //Frame found in TLB
            //printf("TLB Hit: Page %d -> Frame %d\n", page_number, tlb[i].frame_number);
            return tlb[i].frame_number;
        }
    }

    //Update miss counter
    tlb_miss++;

    //printf("TLB Miss: Page %d\n", page_number);
    return -1; //Page not found
}

void update_TLB(int page_number, int frame_number) {
    //printf("Updating TLB: Page %d -> Frame %d (Replacing Page %d)\n", page_number, frame_number, tlb[next_tlb_entry].page_number);
    tlb[next_tlb_entry].page_number = page_number;
    tlb[next_tlb_entry].frame_number = frame_number;

    //Move pointer circularly
    next_tlb_entry = (next_tlb_entry + 1) % TLB_SIZE;
    //printf("TLB pointer moved to: %d\n", next_tlb_entry);

    //If TLB not full, increase count
    if (tlb_count < TLB_SIZE) {
        tlb_count++;
    }
}



int handle_page_fault(int page_number, signed char physical_memory[],FILE *backingStore, int frame_table[]) {
    //printf("Handling page fault for page: %d\n", page_number);
    //Seek correct page in backing store
    fseek(backingStore, page_number * FRAME_SIZE, SEEK_SET);

    //Read page into next available frame
    fread(&physical_memory[next_free_frame * FRAME_SIZE], sizeof(signed char), FRAME_SIZE, backingStore);

    //printf("Storing page %d into frame %d\n", page_number, next_free_frame);

    //Clear previous page table entry
    if (frame_table[next_free_frame] != -1) {
        page_table[frame_table[next_free_frame]] = -1;
        //printf("Evicting old page %d from frame %d\n", frame_table[next_free_frame], next_free_frame);
    }

    //Update page table
    page_table[page_number] = next_free_frame;

    //Update frame table
    frame_table[next_free_frame] = page_number;

    //Update TLB
    update_TLB(page_number, next_free_frame);

    //Update page fault counter
    page_fault++;

    //return frame number and update
    return next_free_frame;

}

//Find a free frame or select using LRU
int find_next_frame(bool frame_used[], clock_t frame_last_used[], int numberOfMemoryFrames) {
    for (int i = 0; i < numberOfMemoryFrames; i++) {
        if (!frame_used[i]) {
            //Empty frame found
            frame_used[i] = true;
            //printf("Using free frame: %d\n", i);
            return i;
        }
    }

    //No empty frames found
    int lru_index = -1;
    clock_t oldest = LONG_MAX;
    for (int i = 0; i < numberOfMemoryFrames; i++) {
        if (frame_last_used[i] < oldest) {
            oldest = frame_last_used[i];
            lru_index = i;
        }
    }

    //printf("LRU frame selected for replacement: %d (last used: %ld)\n", lru_index, oldest);
    return lru_index;
}

int main(int argc, char *argv[]) {

    //Opening files
    FILE *in;
    FILE *backingStore;
    FILE *outputCSV;


    in = fopen(argv[3], "r");
    backingStore = fopen(argv[2], "rb");


    //Initialize page table to -1 (empty)
    for (int i = 0; i < NUM_PAGES; i++) {
        page_table[i] = -1;
    }


    //Creating physical memory
    int numberOfMemoryFrames = atoi(argv[1]);
    signed char physical_memory[numberOfMemoryFrames * FRAME_SIZE];


    //Generate CSV filename
    char outputFilename[50];
    sprintf(outputFilename, "output%d.csv", numberOfMemoryFrames);

    outputCSV = fopen(outputFilename, "w");


    unsigned int logical_address;


    //Record of frames used
    bool frame_used[numberOfMemoryFrames];

    //Record of last used times
    clock_t frame_last_used[numberOfMemoryFrames];

    //Relate frames back to pages for invalidating page_table
    int frame_table[numberOfMemoryFrames];

    //Initialize values
    for (int i = 0; i < numberOfMemoryFrames; i++) {
        frame_used[i] = false;
        frame_last_used[i] = LONG_MAX;
        frame_table[i] = -1;
    }


    //Scan through all addresses
    while (fscanf(in, "%u", &logical_address) == 1) {
        numberOfAddresses++;
        //Extract page number and offset
        int offset = logical_address & 0xFF;
        int page_number = (logical_address >> 8) & 0xFF;

        int frame_number = search_TLB(page_number);

        //Find frame
        if (frame_number == -1) {
            //TLB miss; check page table
            if (page_table[page_number] == -1) {
                //Page fault; Load from backing store
                next_free_frame = find_next_frame(frame_used, frame_last_used, numberOfMemoryFrames);
                frame_number = handle_page_fault(page_number, physical_memory, backingStore, frame_table);
            }
            else {
                //Page found in page table
                frame_number = page_table[page_number];
                update_TLB(page_number, frame_number);
                
            }
        }

        //Update last used
        frame_last_used[frame_number] = clock();

        //Calculate physical address
        int physical_address = (frame_number * FRAME_SIZE) + offset;

        //Get signed byte from memory
        signed char value = physical_memory[physical_address];



        //Debugging
        //printf("%u,%u,%d\n", logical_address, physical_address, value);
        //printf("Logical Addr: %u | Page: %d | Offset: %d | Frame: %d | Physical Addr: %d | Value: %d\n", logical_address, page_number, offset, frame_number, physical_address, value);
     
        fprintf(outputCSV, "%u,%u,%d\n", logical_address, physical_address, value);

        //Ensure enough time to output to CSV
        fflush(outputCSV);
    }

    //Print tlb misses and page faults
    //printf("Page Faults Rate,%0.2f%%,\nTLB Hits Rate,%0.2f%%,\n", (page_fault/numberOfAddresses)*100, (1-tlb_miss/numberOfAddresses)*100);
    fprintf(outputCSV, "Page Faults Rate,%0.2f%%,\nTLB Hits Rate,%0.2f%%,", (page_fault/numberOfAddresses)*100, (1-tlb_miss/numberOfAddresses)*100);

    //Ensure enough time to output to CSV
    fflush(outputCSV);

    //Cleanup
    fclose(in);
    fclose(backingStore);

}