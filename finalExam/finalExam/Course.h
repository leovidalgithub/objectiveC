//  course.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#ifndef course_h
#define course_h

@interface Course : NSObject {
    @public
        NSString *course_code;
        NSString *course_name;
        int number_students;
        Teacher *teacher;
    }
    @property NSString *course_code;
    @property NSString *course_name;
    @property int number_students;
    @property Teacher *teacher;
    -(void)showAllCourseInfo;
@end

@implementation Course
    @synthesize course_code;
    @synthesize course_name;
    @synthesize number_students;
    @synthesize teacher;
    -(void)showAllCourseInfo {
        [Utilities terminalPristine];
        NSLog(@"        Course Code = %@", course_code);
        NSLog(@"        Course Name = %@", course_name);
        NSLog(@" Number of Students = %@", [@(number_students) stringValue]);
        NSLog(@"-----------------------------");
        NSLog(@" Assigned Teacher");
        NSLog(@"-----------------------------");
        [teacher showAllTeacherInfo];
    }
@end

#endif /* course_h */

