//
//  main.m
//  final_Project
//
//  Created by english on 2019-10-31.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

/**********/
@interface Animal : NSObject
@property NSString *dogName;
@end
@implementation Animal
@synthesize dogName;
@end
@interface MyClass : NSObject {
    NSString *userName;
    //    Animal *myAnimal;
}
@property NSString *name;
@property Animal *myAnimal;
-(void)showCompleteInfo;
@end
@implementation MyClass
@synthesize name;
@synthesize myAnimal;
-(void)showCompleteInfo {
    NSLog(@"Hola");
}
@end
/**********/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //this is to reduce info line output in the Terminal
#define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

        MyClass *myclass = [[MyClass alloc] init];
        myclass.name = @"Leo";
        
        Animal *myAnimal = [[Animal alloc] init];
        myAnimal.dogName = @"Tabita";
        
        myclass.myAnimal = myAnimal;
        
        NSLog(@"\nMy name is %@ and my dog is %@", myclass.name, myclass.myAnimal.dogName);
    }
    return 0;
}
/*
 class Person
 
 class Customer inh Person
 class Employer inh Person
 
 class Reservation
 
 list array Employees[5]
 list array Customers[50]
 list array Reservations[5]
 list array waitingList[50]
 
 
 
 */
