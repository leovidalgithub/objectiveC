/*
 Lesson 2.2 excersise
 Leonardo Rodriguez Vidal - 1811229
 Sep 26th 2019
 */

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    int Age;
    NSMutableString *firstName;
    NSMutableString *lastName;
}
    -(void)setAge:(int)age;
    -(int)getAge;
    -(void)setName:(NSString *)fname;
    -(void)setName:(NSString *)fname and:(NSString *)lname;
    -(void)printFullName;
@end

@implementation Person
    -(int)getAge {
        return Age;
    }
    -(void)setAge:(int)age {
        Age = age;
    }
    -(void)printFullName {
        NSString *str = [NSString stringWithFormat: @"%@ %@", firstName, lastName];
        NSLog(@"\n\nYour fullName is %@", str);
    }
    -(void)setName:(NSString *)fname {
        firstName = fname;
    }
    -(void)setName:(NSString *)fname and:(NSString *)lname {
        firstName = fname;
        lastName = lname;
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);
        
        Person *myPerson = [[Person alloc] init];

        int age;
        printf("\nEnter your age: ");
        scanf("%i", &age);
        [myPerson setAge: age];

        char name[50];
        printf("Enter your firstName: ");
        scanf("%s", name);
        NSString *first = [NSString stringWithCString: name encoding: NSASCIIStringEncoding];
        [myPerson setName:first];

        char lastName[50];
        printf("Enter your lastName: ");
        scanf("%s", lastName);
        NSString *last = [NSString stringWithCString: lastName encoding: NSASCIIStringEncoding];
        [myPerson setName:first and:last];

        NSLog(@"Your age is %i", [myPerson getAge]);
        [myPerson printFullName];
    }
    return 0;
}
