//  student.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#import "Grade.h"

#ifndef student_h
#define student_h

@interface Student : Person {
    @public
        NSString *stud_id;
        NSString *email;
        NSString *password;
        Grade *grades;
    }
    @property NSString *stud_id;
    @property NSString *email;
    @property NSString *password;
    @property Grade *grades;
    -(void)showAllStudentInfo;
//    +(Customer*)getCustomerFromArray:(NSString *)_studentID :(NSMutableArray *)_customersArray;
//    -(BOOL)customerHasReservation;
@end

@implementation Student
    @synthesize stud_id;
    @synthesize email;
    @synthesize password;
    @synthesize grades;
    -(void)showAllStudentInfo {
        [Utilities terminalPristine];
        NSLog(@" ----- STUDENT INFO -----");
        NSLog(@" Student ID = %@", stud_id);
        NSLog(@"  Full Name = %@", fullName);
        NSLog(@"     Gender = %@", gender);
        NSLog(@"        Age = %@", [@(age) stringValue]);
        NSLog(@"      email = %@", email);
        NSLog(@"   Password = %@", password);
        NSLog(@"-------------------------");
        [grades showGrades];
    }
    //+(Customer*)getCustomerFromArray:(NSString *)_studentID :(NSMutableArray *)_customersArray {
    //    for (Customer* customer in _customersArray){
    //        if([customer.studentID isEqualToString:_studentID])
    //            return customer;
    //    }
    //    [Utilities displayTitle:@"-" :[NSString stringWithFormat:@"Sorry! Customer ID %@ not exist!", _studentID] :NO];
    //    return nil;
    //}
    //-(BOOL)customerHasReservation {
    //    if (reservation) {
    //        [Utilities displayTitle:@"-" :[NSString stringWithFormat:@"Sorry! Customer %@ has already a Reservation : %@", fullName, reservation.resID] :NO];
    //        return YES;
    //    }
    //    return NO;
    //}
@end

#endif /* student_h */
