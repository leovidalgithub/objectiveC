// main.m
// ClassPerson
// Created by Mihai on 2019-10-03.
// Copyright © 2019 english. All rights reserved.
#import <Foundation/Foundation.h>
    @interface Person : NSObject{
        NSString *name;
        int age;
    }
    -(void)printData;
    -(void)printData:(NSString *)s :(int)n;
    -(void)printData:(NSString *)s1 :(NSString *)s2 :(int)n;
    -(NSString *)getName;
    -(int)getAge;
    -(void)setName:(NSString *)n;
    -(void)setAge:(int)a;
@end

@implementation Person
    -(void)printData {
        NSLog(@"\nPerson name: %@ and age: %i",name,age);
    }
    -(void)printData:(NSString *)s :(int)n {
        NSLog(@"\nPerson name: %@ and age: %i",s,n);
    }
    -(void)printData:(NSString *)s1 :(NSString *)s2 :(int)n {
        NSLog(@"\nPerson name: %@ %@ and age: %i",s1,s2,n);
    }
    -(NSString *)getName {
        return name;
    }
    -(int)getAge {
        return age;
    }
    -(void)setName:(NSString *)n {
        name = n;
    }
    -(void)setAge:(int)a {
        age = a;
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

        // creating the object of Person class
        Person *p1 = [[Person alloc] init];

        [p1 printData];
        [p1 setName: @"MyName"];
        [p1 setAge: 33];
        [p1 printData];
        
        NSLog(@"\nName: %@ and Age: %i", [p1 getName],[p1 getAge]);
        //**********************************************************
        //Ask the user for data
        char enteredName[50];
        NSLog(@"\nEnter a name:");
        scanf("%s", enteredName);
        
        int enteredAge;
        NSLog(@"\nEnter an age:");
        scanf("%i", &enteredAge);
        NSLog(@"\nEntered name: %s and entered age: %i", enteredName, enteredAge);

        //**********************************************************
        //Formating the array of char to string
        NSString *str1;
        str1 = [NSString stringWithCString:enteredName encoding:1];
        [p1 setName:str1];
        [p1 setAge:555];
        [p1 printData];
        //**********************************************************
        //Another way of formating the array of char to string
        NSString *str2;
        str2 = [NSString stringWithFormat:@"%s",enteredName];
        [p1 setName:str2];
        [p1 setAge:enteredAge];
        [p1 printData];
        //**********************************************************
        //The call to the overloaded method printData
        [p1 printData:str2 :enteredAge];
        NSString *fname, *lname;
        
        //Ask the user for data
        char enteredFName[50];
        NSLog(@"\nEnter a first name:");
        scanf("%s",enteredFName);
        fname = [NSString stringWithFormat:@"%s",enteredName];
        char enteredLName[50];
        NSLog(@"\nEnter a last name:");
        scanf("%s",enteredLName);
        
        lname = [NSString stringWithFormat:@"%s",enteredName];
        //**********************************************************
        //The call to the overloaded method printData
        [p1 printData:fname :lname :enteredAge];
    }
    return 0;
}
