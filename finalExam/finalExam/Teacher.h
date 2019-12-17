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
        NSString *teach_id;
    }
    @property NSString *teach_id;
        -(void)showAllTeacherInfo;
@end

@implementation Teacher
    @synthesize teach_id;
    -(void)showAllTeacherInfo {
        [Utilities terminalPristine];
        NSLog(@" ----- TEACHER INFO -----");
        NSLog(@" Teacher ID = %@", teach_id);
        NSLog(@"  Full Name = %@", fullName);
        NSLog(@"     Gender = %@", gender);
        NSLog(@"        Age = %@", [@(age) stringValue]);
        NSLog(@"-------------------------");
    }
@end

#endif /* teacher_h */

