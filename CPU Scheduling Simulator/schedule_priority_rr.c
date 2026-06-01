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

    if (tasks == NULL || tasks->task->priority < newTask->priority) {
        insert(&tasks,newTask);
    }
    else {
        struct node *currentCompare = tasks;
        //find correct position for next task
        while (currentCompare->next != NULL && currentCompare->next->task->priority >= newTask->priority) {
            currentCompare = currentCompare->next;
        }
        //insert task at desired location
        insert(&currentCompare->next,newTask);
    }
    totalTasks++;
    
}


void schedule() {
    int currentPriority = 10;
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


    while (currentPriority >= 0) {
        struct node *currentTask = tasks;

        //used to remember where we were
        struct node *previousTask = NULL;

        //Keeps track of number of tasks for when there is only a single task left
        int taskCount = 0;

        struct node *taskCountingTask = tasks;


        //Used to count the number of tasks at a specific priority
        while (taskCountingTask != NULL) {
            if (taskCountingTask->task->priority == currentPriority) {
                taskCount++;
            }
            taskCountingTask = taskCountingTask->next;
        }

        while (currentTask != NULL) {
            int index = currentTask->task->tid;

            if (currentTask->task->priority == currentPriority) {
                int slice = (taskCount == 1) ? currentTask->task->burst : ((currentTask->task->burst < 10) ? currentTask->task->burst : 10);

                if (responseTime[index] == -1) {
                    responseTime[index] = currentTime;
                }

                run(currentTask->task, slice);
                currentTask->task->burst -= slice;
                currentTime += slice;

                //Task not completed
                if (currentTask->task->burst > 0) {
                    insertEnd(&tasks, currentTask->task);
                    // Add to task counter since we added a new task to list
                    taskCount++;
                }
                else {
                    completionTime[index] = currentTime;
                }

                struct node *temp = currentTask;
                currentTask = currentTask->next;

                if (previousTask == NULL) {
                    tasks = currentTask;
                }
                else {
                    previousTask->next = currentTask;
                }

                free(temp);
                taskCount--;
            }
            else {
                previousTask = currentTask;
                currentTask = currentTask->next;
            }

        }
        currentPriority--;
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

