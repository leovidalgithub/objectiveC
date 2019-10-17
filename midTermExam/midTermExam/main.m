//
//  midTermExam October 10th 2019
//  prof. Mihai
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>

// Super Class Person from which Player will inheritance
@interface Person : NSObject{
    NSString *fname;
    NSString *lname;
    NSString *sex;
    int age;
    NSString *email;
    NSString *password;
}
    -(NSString *)getFirstname;
    -(NSString *)getLastname;
    -(NSString *)getEmail;
    -(NSString *)getPassword;
    -(int)getAge;
    -(void)setPersonInfo:(NSString *)_fname :(NSString *)_lname :(NSString *)_email :(NSString *)_password :(int)_age :(NSString *)_sex;
@end

@implementation Person
    -(NSString *)getFirstname {
        return fname;
    }
    -(NSString *)getLastname {
        return lname;
    }
    -(NSString *)getEmail {
        return email;
    }
    -(NSString *)getPassword {
        return password;
    }
    -(int)getAge {
        return age;
    }
    -(NSString *)getSex {
        return sex;
    }
    -(void)setPersonInfo:(NSString *)_fname :(NSString *)_lname :(NSString *)_email :(NSString *)_password :(int)_age :(NSString *)_sex {
        fname = _fname;
        lname = _lname;
        email = _email;
        password = _password;
        age = _age;
        sex = _sex;
    }
@end

// Class Player inheriting from Person
@interface Player : Person {
    NSString *userName;
    int accumulatedPoints;
}
    -(NSString *)getUserName;
    -(int)getAccumulatedPoints;
    -(void)setUserName:(NSString *)_username;
    -(void)setAccumulatedPoints:(int)_accumulatedPoints;
    -(void)showCompleteInfo;
@end

@implementation Player
    -(NSString *)getUserName {
        return userName;
    }
    -(int)getAccumulatedPoints {
        return accumulatedPoints;
    }
    -(void)setUserName:(NSString *)_username {
        userName = _username;
    }
    -(void)setAccumulatedPoints:(int)_accumulatedPoints {
        accumulatedPoints = _accumulatedPoints;
    }
    -(void)showCompleteInfo {
        NSLog(@"\n\nFirst Name = %@\nLast Name = %@\nAge = %d\nSex = %@,\nUsername = %@\nPassword = %@\nNumber of Points Accumulated = %d", fname, lname, age, sex, userName, password, accumulatedPoints);
    }
@end

// Program main Function starts here
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //this is to reduce info line output in the Terminal
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);
        
        //in this variable we store what the User choose from the Program Menu
        int User_option = 0;
        
        // Array of Players
        NSMutableArray *playerArray = [[NSMutableArray alloc] initWithCapacity:40];
        
        //We define the Player Object here and then on each new Player we call the Player Class Constructure
        Player *player;
        
        do {
            NSLog(@"\n\nWelcome to midTermExam");
            NSLog(@"----------------------");
            NSLog(@"1. Enter a new Player");
            NSLog(@"2. Show Player's info");
            NSLog(@"3. Finish");
            printf("\nEnter an Option : ");
            scanf("%i", &User_option);
            
            if (User_option == 1) {
                char fname[20];
                printf("\nEnter First Name : ");
                scanf("%s", fname);
                NSString *_fname = [NSString stringWithFormat:@"%s", fname];

                char lname[20];
                printf("\nEnter Last Name : ");
                scanf("%s", lname);
                NSString *_lname = [NSString stringWithFormat:@"%s", lname];
               
                //to clean the buffer before scanf int
                while(getchar() != '\n');
                
                int _age;
                printf("\nEnter Age : ");
                scanf("%d", &_age);
                
                char sex[1];
                printf("\nEnter Gender : ");
                scanf("%s", sex);
                NSString *_sex = [NSString stringWithFormat:@"%s", sex];

                char email[20];
                printf("\nEnter an email : ");
                scanf("%s", email);
                NSString *_email = [NSString stringWithFormat:@"%s", email];

                char user[20];
                printf("\nEnter Username : ");
                scanf("%s", user);
                NSString *_user = [NSString stringWithFormat:@"%s", user];
                
                char pass[20];
                printf("\nEnter Password : ");
                scanf("%s", pass);
                NSString *_pass = [NSString stringWithFormat:@"%s", pass];

                int _points;
                BOOL ok_points = false;
                do { // verifyng is Accumulated Points is between 0 and 1,000,000,000
                    printf("\nEnter Accumulated Points (0 - 1,000,000,000) : ");
                    scanf("%d", &_points);
                    
                    if (_points >= 0 && _points <= 1000000000) {
                        ok_points = true;
                    } else {
                        NSLog(@"\n\nSorry! But Accumulated Points must be between 0 and 1,000,000,000\nTry again")
                    }
                } while (!ok_points);

                //each new Player introduced, we create a new instance of Class Player (new memory allocation)
                player = [[Player alloc] init];
                
                //setting different player info inside Player object from Class Player
                [player setPersonInfo:_fname :_lname :_email :_pass :_age :_sex];
                [player setUserName:_user];
                [player setAccumulatedPoints:_points];
                
                //adding the new Player object into the Array of Player objects
                [playerArray addObject:player];
                
            } else if(User_option == 2) {
                // Showing all Players that have been introduced which are inside the Array of Players
                if ([playerArray count] > 0 ) {
                    
                    NSLog(@"\nNumber of Players introduced = %lu", (unsigned long)[playerArray count]);
                    NSLog(@"-----------------------------------------");
                    for (int i=0; i < [playerArray count]; i++) {
                        NSLog(@"\nPlayer number %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [playerArray[i] showCompleteInfo];
                        NSLog(@"*****************************************");
                    }
                } else {
                    NSLog(@"\n\nSorry!\nThere is no Players info to show\nTry to add some Players.")
                }
            }
        } while (User_option != 3); // while opt is not equal 3 the Do While continues

        //get here means the end of the Program after user choose Option # 3
        NSLog(@"\n\nThank you so much for using this Application!\n...bye")
    }
    return 0;
}
