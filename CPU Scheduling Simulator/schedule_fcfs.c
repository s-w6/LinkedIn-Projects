#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "task.h"
#include "list.h"
#include "schedulers.h"
#include "cpu.h"

struct node *tasks = NULL;

void add(char *name, int priority, int burst) {
    Task *newTask = malloc(sizeof(Task));
    newTask->name = strdup(name);
    newTask->priority = priority;
    newTask->burst = burst;

    if (tasks == NULL) {
        insert(&tasks,newTask);
    }
    else {
        insertEnd(&tasks,newTask);
    }
    
}


void schedule() {
    struct node *currentTask = tasks;
    int completionTime = 0;
    int totalWaitingTime = 0;
    int totalTurnaroundTime = 0;
    int totalTasks = 0;

    while (currentTask != NULL) {
        totalWaitingTime += completionTime;
        run(currentTask->task, currentTask->task->burst);
        completionTime += currentTask->task->burst;
        totalTurnaroundTime += completionTime;

        currentTask = currentTask->next;
        totalTasks++;
    }

    printf("\nAverage waiting time = %.2f\n", (float)totalWaitingTime / totalTasks);
    printf("Average turnaround time = %.2f\n", (float)totalTurnaroundTime / totalTasks);
    printf("Average response time = %.2f\n", (float)totalWaitingTime / totalTasks);
}

