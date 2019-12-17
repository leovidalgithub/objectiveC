//  teacher.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#ifndef teacher_h
#define teacher_h

@interface Teacher : Person {
    @public
        NSString *teacherID;
    }
    @property NSString *teacherID;
        -(void)showAllTeacherInfo;
@end

@implementation Teacher
    @synthesize teacherID;
    -(void)showAllTeacherInfo {
        [Utilities terminalPristine];
        NSLog(@" Teacher ID = %@", teacherID);
        NSLog(@"  Full Name = %@", fullName);
        NSLog(@"     Gender = %@", gender);
        NSLog(@"        Age = %@", [@(age) stringValue]);
    }
@end

#endif /* teacher_h */

