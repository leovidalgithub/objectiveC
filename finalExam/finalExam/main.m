//
//  main.m
//  finalExam
//
//  Created by Leonardo on 2019-12-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#include <stdlib.h>
#import <Foundation/Foundation.h>
#import "Utilities.h"
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
#import "Course.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // GLOBAL VARIABLES AND CONSTANTS
        NSMutableArray *studentsObjArray = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size
        
        // ------------------- ------------------- ------------------- MAIN MENU ------------------- -------------------
        [Utilities clearScreen];
        int mainMenuOption = 0; // mainMenu variable for Do-While - user choice
        do {
            [Utilities displayTitle:@"*" :@"Welcome to Final Exam Course Application" :YES];
            NSLog(@"\t\t------------ CUSTOMERS -----------");
            NSLog(@"\t\t--- 1. Create New Stdent");
            NSLog(@"\t\t--- 2. List all Students");
//            NSLog(@"\t\t--- 3. Remove a Customer");
//            NSLog(@"\t\t--- ---------- ROOMS -------------");
//            NSLog(@"\t\t--- 4. List all Rooms");
//            NSLog(@"\t\t--- ------- RESERVATIONS ---------");
//            NSLog(@"\t\t--- 5. List all Reservations");
//            NSLog(@"\t\t--- 6. Make a New Reservation");
//            NSLog(@"\t\t--- ------- WAITING LIST ---------");
//            NSLog(@"\t\t--- 7. List Customers Waiting List");
//            NSLog(@"\t\t--- --------- ---------- ---------");
            NSLog(@"\t\t--- 9. Finish");
            NSLog(@"\t\t--- --------- ---------- ---------");
            printf("\n\t\tEnter an Option : ");
            scanf("%d", &mainMenuOption);
            [Utilities clearScreen];
            
            if (mainMenuOption == 1) { // OPTION 1 - CREATE A NEW STUDENT
                [Utilities displayTitle:@"=" :@"CREATING A NEW STUDENT" :YES];
                
                NSString *_studentID = [Utilities getRandomStringCode:5];
                NSLog(@"\n New Student ID = %@\n", _studentID);
                
                char fname[25] = {0};
                printf("\nEnter First Name : ");
                scanf("%s", fname);
                NSString *_fname = [NSString stringWithUTF8String:fname];
                
                char lname[25] = {0};
                printf("\nEnter Last Name : ");
                scanf("%s", lname);
                NSString *_lname = [NSString stringWithUTF8String:lname];
                
                char gender[10] = {0};
                printf("\n   Enter Gender : ");
                scanf("%s", gender);
                NSString *_gender = [NSString stringWithUTF8String:gender];
                
                char age[5] = {0};
                printf("\n  Enter the Age : ");
                scanf("%s", age);
                int _age = [[NSString stringWithUTF8String:age] intValue];
                
                NSLog(@"\n ----- Please, introduce Student's grades -----\n");

                char midTerm[6] = {0};
                printf("\n  midTerm Exam grade : ");
                scanf("%s", midTerm);
                float _midTerm = [[NSString stringWithUTF8String:midTerm] floatValue];

                char project[6] = {0};
                printf("\n       Project grade : ");
                scanf("%s", project);
                float _project = [[NSString stringWithUTF8String:project] floatValue];

                char finalExam[6] = {0};
                printf("\n    Final Exam grade : ");
                scanf("%s", finalExam);
                float _finalExam = [[NSString stringWithUTF8String:finalExam] floatValue];
                
                // After having introduced new Student info, we verify if it is correct to proceed to store into studentsObjArray
                [Utilities clearScreen];
                
                [Utilities displayTitle:@"=" :@"CREATING A NEW STUDENT" :YES];
                NSLog(@"-------------------------------");
                NSLog(@"   Student ID = %@", _studentID);
                NSLog(@"   First Name = %@", _fname);
                NSLog(@"    Last Name = %@", _lname);
                NSLog(@"       Gender = %@", _gender);
                NSLog(@"          Age = %d", _age);
                NSLog(@"\n------ GRADES ---------------\n");
                NSLog(@" MidTerm Exam = %.2f", _midTerm);
                NSLog(@"      Project = %.2f", _project);
                NSLog(@"   Final Exam = %.2f", _finalExam);
                NSLog(@"----------------------------\n");
                
                NSLog(@"Is this info correct?");
                NSLog(@"\n1. Yes");
                NSLog(@"2. No");
                printf("\nEnter an Option : ");
                fflush(stdin);
                int option = 0;
                scanf("%d", &option);
                if(option == 1) {

                    Student *student = [[Student alloc] initWithfname:_fname lname:_lname]; // Student custom Constructor
                    student.studentID = _studentID;
                    student.gender = _gender;
                    student.age = _age;

                    Grade *grades = [[Grade alloc] init];
                    grades.midTermExam = _midTerm;
                    grades.project = _project;
                    grades.finalExam = _finalExam;
                    
                    student.grades = grades;
                    [studentsObjArray addObject:student];
                    NSLog(@"\n----------------------------");
                    NSLog(@"New Student added corretly!");
                    NSLog(@"----------------------------");
                } else {
                    [Utilities displayTitle:@"-" :@"Operation cancelled by the user" :NO];
                }
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 2) { // OPTION 2 - LISTING CUSTOMERS
                [Utilities displayTitle:@"=" :@"STUDENTS LISTING" :YES];
                if ([studentsObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Students being displayed = %lu", (unsigned long)[studentsObjArray count]);
                    NSLog(@"-----------------------------------------");
                    [NSThread sleepForTimeInterval:1];
                    
                    for (int i=0; i < [studentsObjArray count]; i++) {
                        NSLog(@"\nStudent # %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [[studentsObjArray objectAtIndex:i] showAllStudentInfo];
                        NSLog(@"*****************************************");
                    }
                } else {
                    NSLog(@"\n\nSorry!\nThere are no Students to show\nTry to add at least one Student.")
                }
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 4) { // OPTION 4 - LISTING ROOMS
                [Utilities displayTitle:@"=" :@"ROOMS LISTING" :YES];
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 5) { // OPTION 5 - LISTING RESERVATIONS
                [Utilities displayTitle:@"=" :@"RESERVATIONS LISTING" :YES];
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 3) { // OPTION 3 - REMOVE A CUSTOMER
                [Utilities displayTitle:@"=" :@"REMOVE A CUSTOMER" :YES];
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 7) { // OPTION 7 - CUSTOMERS WAITING LIST LISTING
                [Utilities displayTitle:@"=" :@"WAITING LIST LISTING" :YES];
                
            } else if(mainMenuOption == 6) { // OPTION 6 - MAKE A NEW RESERVATION
                [Utilities clearScreen];
                [Utilities pressAnyKey];
            }
        } while (mainMenuOption != 9); // main Do While (exit on mainMenuOption == 9 )

        
        // exit program
        [Utilities clearScreen];
        [Utilities displayTitle:@"+" :@"Thanks for using Final Exam Course Application!" :YES];
    }
    return 0;
}
