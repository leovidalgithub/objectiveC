//
//  Leonardo Rodriguez Vidal
//  1811229
//  midTermPreparation
//
//  Created by english on Octuber 03 2019
//

#import <Foundation/Foundation.h>
//code, number of hours per week, number of weeks per session, and number of
//students per class.

@interface Course : NSObject {
    NSString *code;
    int numberHoursPerWeek;
    int numberHoursPerSession;
    int numberStudents;
    }
    -(NSString *)getCourseCode;
    -(int)getHoursPerWeek;
    -(int)getHoursPerSession;
    -(int)getNumberStudents;
    -(void)setCourseData:(NSString *)code :(int)weekHours :(int)sessionHours :(int)numberStudents;
@end

@implementation Course
    -(NSString *)getCourseCode {
        return code;
    }
    -(int)getHoursPerWeek {
        return numberHoursPerWeek;
    }
    -(int)getHoursPerSession {
        return numberHoursPerSession;
    }
    -(int)getNumberStudents {
        return numberStudents;
    }
    -(void)setCourseData:(NSString *)_code :(int)weekHours :(int)sessionHours :(int)_numberStudents {
        code = _code;
        numberHoursPerWeek = weekHours;
        numberHoursPerSession = sessionHours;
        numberStudents = _numberStudents;
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

        int opt = 0;
        NSMutableArray *courseArray = [[NSMutableArray alloc] initWithCapacity:40];
        Course *course;
        
        do {
            NSLog(@"1. Enter a new Course");
            NSLog(@"2. Finish");
            printf("\nEnter an Option : ");
            scanf("%i", &opt);

            if (opt == 1) {
                char code[12];
                printf("\nEnter Course Code : ");
                scanf("%s", code);
                NSString *_code = [NSString stringWithFormat:@"%s", code];

                int weekHours;
                printf("\nEnter Number Hours by Week : ");
                scanf("%i", &weekHours);

                int sessionHours;
                printf("\nEnter Number Hours by Session : ");
                scanf("%i", &sessionHours);

                int numberStudents;
                printf("\nEnter Number of Students : ");
                scanf("%i", &numberStudents);
                
                course = [[Course alloc] init];
                [course setCourseData:_code :weekHours :sessionHours :numberStudents];
                
                [courseArray addObject:course];
            }
            
        } while (opt != 2);
        
        NSLog(@"\nNumber of Courses introcued = %lu", (unsigned long)[courseArray count]);
        NSLog(@"-----------------------------------------");

        for (int i=0; i < [courseArray count]; i++) {
            NSLog(@"\nCourse number %i", i + 1);
            NSLog(@"Course Code = %@", [courseArray[i] getCourseCode]);
            NSLog(@"Hours per Week = %i", [courseArray[i] getHoursPerWeek]);
            NSLog(@"Hours per Session = %i", [courseArray[i] getHoursPerSession]);
            NSLog(@"Number of Students = %i", [courseArray[i] getNumberStudents]);
            NSLog(@"-----------------------------------------");
        }
    }
    return 0;
}
