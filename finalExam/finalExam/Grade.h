//  grade.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#ifndef grade_h
#define grade_h

@interface Grade : NSObject {
    @public
        float midTermExam;
        float project;
        float finalExam;
    }
    @property float midTermExam;;
    @property float project;
    @property float finalExam;
    -(void)showGrades;
    -(NSString *)calculateFinalGrade;
@end

@implementation Grade
    @synthesize midTermExam;
    @synthesize project;
    @synthesize finalExam;
    -(NSString *)calculateFinalGrade {
        float total = (midTermExam + project + finalExam) / 3;
        if (total >= 90) {
            return @"A";
        } else if (total >= 80) {
            return @"B";
        } else if (total >= 70) {
            return @"C";
        } else if (total >= 60) {
            return @"D";
        }
        return @"F";
    }
    -(void)showGrades {
        [Utilities terminalPristine];
        NSLog(@"  - - G R A D E S - - ");
        NSLog(@"----------------------");
        NSLog(@" MidTermExam = %.2f", midTermExam);
        NSLog(@"    Project  = %.2f", project);
        NSLog(@"  Final Exam = %.2f", finalExam);
        NSLog(@"------ --------- -----");
        NSLog(@"FINAL GRADE = %@", self.calculateFinalGrade);
    }
@end

#endif /* grade_h */


