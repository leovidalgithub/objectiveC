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
        NSString *c_code;
        NSString *c_name;
        NSInteger h_per_week;
        Teacher *teacher;
    }
    @property NSString *c_code;
    @property NSString *c_name;
    @property NSInteger h_per_week;
    @property Teacher *teacher;
    -(void)showAllCourseInfo;
@end

@implementation Course
    @synthesize c_code;
    @synthesize c_name;
    @synthesize h_per_week;
    @synthesize teacher;
    -(void)showAllCourseInfo {
        [Utilities terminalPristine];
        NSLog(@"    Course Code = %@", c_code);
        NSLog(@"           Name = %@", c_name);
        NSLog(@" Hours per week = %@", [@(h_per_week) stringValue]);
        NSLog(@"Assigned Teacher");
        NSLog(@"----------------");
        [teacher showAllTeacherInfo];
    }
@end

#endif /* course_h */

