//
//  main.m
//  finalExam
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
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
        NSMutableArray *teachersObjArray = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size
        NSMutableArray *coursesObjArray  = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size

        // ------------------- ------------------- ------------------- MAIN MENU ------------------- -------------------
        [Utilities clearScreen];
        int mainMenuOption = 0; // mainMenu variable for Do-While - user choice
        do {
            [Utilities displayTitle:@"*" :@"Welcome to Final Exam Course Application" :YES];
            NSLog(@"\t\t------------ STUDENTS ------------");
            NSLog(@"\t\t--- 1. Create New Stdent");
            NSLog(@"\t\t--- 2. List all Students");
            NSLog(@"\t\t--- ---------- TEACHERS -----------");
            NSLog(@"\t\t--- 3. Create New Teacher");
            NSLog(@"\t\t--- 4. List all Teachers");
            NSLog(@"\t\t--- ---------- COURSES ------------");
            NSLog(@"\t\t--- 5. Create New Course");
            NSLog(@"\t\t--- 6. List all Course");
            NSLog(@"\t\t--- --------- ---------- ---------");
            NSLog(@"\t\t--- 9. Exit");
            NSLog(@"\t\t--- --------- ---------- ---------");
            printf("\n\t\tEnter an Option : ");
            scanf("%d", &mainMenuOption);
            [Utilities clearScreen];
            
            if (mainMenuOption == 1) { // OPTION 1 - CREATE A NEW STUDENT
                [Utilities displayTitle:@"=" :@"CREATING A NEW STUDENT" :YES];
                
                NSString *_stud_id = [Utilities getRandomStringCode:5];
                NSLog(@"\n New Student ID = %@\n", _stud_id);
                
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
                
                char email[25] = {0};
                printf("\n   Enter email : ");
                scanf("%s", email);
                NSString *_email = [NSString stringWithUTF8String:email];

                char password[25] = {0};
                printf("\n Enter password : ");
                scanf("%s", password);
                NSString *_password = [NSString stringWithUTF8String:password];
                
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
                NSLog(@"   Student ID = %@", _stud_id);
                NSLog(@"   First Name = %@", _fname);
                NSLog(@"    Last Name = %@", _lname);
                NSLog(@"       Gender = %@", _gender);
                NSLog(@"          Age = %d", _age);
                NSLog(@"        email = %@", _email);
                NSLog(@"     Password = %@", _password);
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
                    student.stud_id = _stud_id;
                    student.gender = _gender;
                    student.age = _age;
                    student.email = _email;
                    student.password = _password;

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
                
            } else if(mainMenuOption == 2) { // OPTION 2 - LISTING STUDENTS
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
                
            } else if(mainMenuOption == 3) { // OPTION 3 - CREATING TEACHER
                [Utilities displayTitle:@"=" :@"CREATING A NEW TEACHER" :YES];
                
                NSString *_teacherID = [Utilities getRandomStringCode:4];
                NSLog(@"\n New Teacher ID = %@\n", _teacherID);
                
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
               
                // After having introduced new Teacher info, we verify if it is correct to proceed to store into teachersObjArray
                [Utilities clearScreen];
                
                [Utilities displayTitle:@"=" :@"CREATING A NEW TEACHER" :YES];
                NSLog(@"-------------------------------");
                NSLog(@"   Teacher ID = %@", _teacherID);
                NSLog(@"   First Name = %@", _fname);
                NSLog(@"    Last Name = %@", _lname);
                NSLog(@"       Gender = %@", _gender);
                NSLog(@"          Age = %d", _age);
                NSLog(@"----------------------------\n");
                
                NSLog(@"Is this info correct?");
                NSLog(@"\n1. Yes");
                NSLog(@"2. No");
                printf("\nEnter an Option : ");
                fflush(stdin);
                int option = 0;
                scanf("%d", &option);
                if(option == 1) {
                    
                    Teacher *teacher = [[Teacher alloc] initWithfname:_fname lname:_lname]; // Teacher - Super class custom Constructor
                    teacher.teach_id = _teacherID;
                    teacher.gender = _gender;
                    teacher.age = _age;
                    
                    [teachersObjArray addObject:teacher];
                    NSLog(@"\n----------------------------");
                    NSLog(@"New Teacher added corretly!");
                    NSLog(@"----------------------------");
                } else {
                    [Utilities displayTitle:@"-" :@"Operation cancelled by the user" :NO];
                }
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 4) { // OPTION 4 - LISTING TEACHERS
                [Utilities displayTitle:@"=" :@"TEACHERS LISTING" :YES];
                if ([teachersObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Teachers being displayed = %lu", (unsigned long)[teachersObjArray count]);
                    NSLog(@"-----------------------------------------");
                    [NSThread sleepForTimeInterval:1];
                    
                    for (int i=0; i < [teachersObjArray count]; i++) {
                        NSLog(@"\nTeacher # %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [[teachersObjArray objectAtIndex:i] showAllTeacherInfo];
                        NSLog(@"*****************************************");
                    }
                } else {
                    NSLog(@"\n\nSorry!\nThere are no Teachers to show\nTry to add at least one Teacher.")
                }
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 5) { // OPTION 5 - CREATING A COURSE
                [Utilities displayTitle:@"=" :@"CREATING NEW COURSE" :YES];
                if ([teachersObjArray count] > 0 ) {
                    char course_code[25] = {0};
                    printf("\n        Enter Course Code : ");
                    scanf("%s", course_code);
                    NSString *_course_id = [NSString stringWithUTF8String:course_code];
                    
                    char course_name[25] = {0};
                    printf("\n        Enter Course Name : ");
                    scanf("%s", course_name);
                    NSString *_course_name = [NSString stringWithUTF8String:course_name];
                    
                    char number_students[5] = {0};
                    printf("\n Enter Number of Students : ");
                    scanf("%s", number_students);
                    int _number_students = [[NSString stringWithUTF8String:number_students] intValue];
                    
                    NSLog(@"\n----- Available Teachers for this Course -----\n");
                    NSMutableArray *_teachersIndexs = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size
                    for (int i=0; i < [teachersObjArray count]; i++) {
                        [_teachersIndexs addObject:[@(i + 1) stringValue]];
                        NSLog(@"-----------------------------------------");
                        NSLog(@"%i. Teacher = %@", i + 1, [[teachersObjArray objectAtIndex:i] getFullName]);
                        NSLog(@"-----------------------------------------");
                    }
                    NSLog(@"Choose a Tecaher from the above List");
                    char teacherOption[5] = {0};
                    printf("\nTeacher : ");
                    scanf("%s", teacherOption);
                    NSString *_teacherOption = [NSString stringWithUTF8String:teacherOption];
                    
                    if ([_teachersIndexs indexOfObject: _teacherOption] != NSNotFound) { // teacher correct and available
                        Course *course = [[Course alloc] init]; // Course default Constructor
                        course.course_code = _course_id;
                        course.course_name = _course_name;
                        course.number_students = _number_students;
                        course.teacher = [teachersObjArray objectAtIndex: ([_teacherOption intValue]-1)];

                        [coursesObjArray addObject:course];
                        NSLog(@"\n----------------------------");
                        NSLog(@"New Course added corretly!");
                        NSLog(@"----------------------------");
                    } else {
                        [Utilities displayTitle:@"-" :@"The chosen Teacher is not available or not exists." :NO];
                    }
                } else {
                    NSLog(@"\n\nSorry!\nBut you need at least 1 Teacher.\nCreate a New Teacher first.")
                }
                [Utilities pressAnyKey];
                
            } else if(mainMenuOption == 6) { // OPTION 6 - COURSE LISTING
                [Utilities displayTitle:@"=" :@"COURSE LISTING" :YES];
                if ([coursesObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Courses being displayed = %lu", (unsigned long)[coursesObjArray count]);
                    NSLog(@"-----------------------------------------");
                    [NSThread sleepForTimeInterval:1];
                    
                    for (int i=0; i < [coursesObjArray count]; i++) {
                        NSLog(@"\nCourse # %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [[coursesObjArray objectAtIndex:i] showAllCourseInfo];
                        NSLog(@"*****************************************");
                    }
                } else {
                    NSLog(@"\n\nSorry!\nThere are no Courses to show\nTry to add at least one Course.")
                }
                [Utilities pressAnyKey];
            }
        } while (mainMenuOption != 9); // main Do While (exit on mainMenuOption == 9 )
        
        // exit program
        [Utilities clearScreen];
        [Utilities displayTitle:@"+" :@"Thanks for using Final Exam Course Application!" :YES];
    }
    return 0;
}
