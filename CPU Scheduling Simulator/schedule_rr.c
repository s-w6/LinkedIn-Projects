#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "task.h"
#include "list.h"
#include "schedulers.h"
#include "cpu.h"

struct node *tasks = NULL;
int totalTasks = 0;

void add(char *name, int priority, int burst) {
    Task *newTask = malloc(sizeof(Task));
    newTask->name = strdup(name);
    newTask->priority = priority;
    newTask->burst = burst;
    newTask->tid = totalTasks;

    if (tasks == NULL) {
        insert(&tasks,newTask);
    }
    else {
        insertEnd(&tasks,newTask);
    }
    totalTasks++;
    
}

void schedule() {
    struct node *currentTask = tasks;
    int currentTime = 0;
    int totalWaitingTime = 0;
    int totalTurnaroundTime = 0;
    int totalResponseTime = 0;

    int responseTime[totalTasks];
    int completionTime[totalTasks];
    int totalBurst[totalTasks];

    memset(responseTime,-1,totalTasks*sizeof(int));
    memset(completionTime,-1,totalTasks*sizeof(int));
    memset(totalBurst,-1,totalTasks*sizeof(int));

    //Record initial burst times
    struct node *temp = tasks;
    int tempCounter = 0;
    while (temp != NULL) {
        totalBurst[tempCounter] = temp->task->burst;
        tempCounter++;
        temp = temp->next;
    }

    while (currentTask != NULL) {
        int slice = (currentTask->task->burst < 10) ? currentTask->task->burst : 10;

        int index = currentTask->task->tid;
        if (responseTime[index] == -1) {
            responseTime[index] = currentTime;
        }

        run(currentTask->task, slice);
        currentTask->task->burst -= slice;
        currentTime += slice;

        struct node *temp = currentTask;

        if (currentTask->task->burst > 0) {
            currentTask = currentTask->next;
            insertEnd(&tasks,temp->task);
        }
        else {
            completionTime[index] = currentTime;
            currentTask = currentTask->next;
            delete(&tasks,temp->task);
        }


    }

    //calculate times
    for (int i = 0; i < totalTasks; i++) {
        totalWaitingTime += completionTime[i] - totalBurst[i];
        totalResponseTime += responseTime[i];
        totalTurnaroundTime += completionTime[i];
    }

    printf("\nAverage waiting time = %.2f\n", (float)totalWaitingTime / totalTasks);
    printf("Average turnaround time = %.2f\n", (float)totalTurnaroundTime / totalTasks);
    printf("Average response time = %.2f\n", (float)totalResponseTime / totalTasks);
}

