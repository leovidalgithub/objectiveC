/*
     Lesson 2 excersise
     Leonardo Rodriguez Vidal - 1811229
     Sep 19th 2019
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    int Age;
}
    -(void)setAge:(int)age;
    -(int)getAge;
    -(void)printAge:(NSString *)personName;
@end

@implementation Person
    -(int)getAge {
        return Age;
    }
    -(void)setAge:(int)age {
        Age = age;
    }
    -(void)printAge:(NSString *)personName {
        NSLog(@"\n\nPerson %@ Age is %d", personName, Age);
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *myPerson1 = [[Person alloc] init];
        [myPerson1 setAge: 33];

        Person *myPerson2 = [[Person alloc] init];
        [myPerson2 setAge: 27];

        NSLog(@"\n\nPerson Dan Age is %d", [myPerson1 getAge]);
        [myPerson2 printAge:@"Leo"];
    }
    return 0;
}
