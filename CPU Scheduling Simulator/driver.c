/**
 * Driver.c
 *
 * Schedule is in the format
 *
 *  [name] [priority] [CPU burst]
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "task.h"
#include "list.h"
#include "schedulers.h"

#define SIZE    100

int main(int argc, char *argv[])
{
    FILE *in;
    char *temp;
    char task[SIZE];

    char *name;
    int priority;
    int burst;

    FILE *tempPointer;
    long size;

    in = fopen(argv[1],"r");

    tempPointer = fopen(argv[1],"r");

    //Check if file is empty
    if (tempPointer) {
        fseek (tempPointer, 0, SEEK_END);
        size = ftell(tempPointer);
        if (size == 0) {
            fprintf(stderr, "Invalid Tasks in Input File\n");
            exit(EXIT_FAILURE);
        }
    }
    
    while (fgets(task,SIZE,in) != NULL) {
        temp = strdup(task);
        name = strsep(&temp,",");
        priority = atoi(strsep(&temp,","));
        burst = atoi(strsep(&temp,","));



        //Error Checking
        if (priority > 10 || priority < 1 || burst < 0) {
            fprintf(stderr, "Invalid Tasks in Input File\n");
            exit(EXIT_FAILURE);
        }

        // add the task to the scheduler's list of tasks
        add(name,priority,burst);

        free(temp);
    }

    fclose(in);

    // invoke the scheduler
    schedule();

    return 0;
}
