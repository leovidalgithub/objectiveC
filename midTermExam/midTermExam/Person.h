//
//  Person.h
//  midTermExam
//
//  Created by english on 2019-10-17.
//

#ifndef Person_h
#define Person_h

#import <Foundation/Foundation.h>

// Super Class Person from which Player will inheritance
@interface Person : NSObject{
    NSString *fname;
    NSString *lname;
    NSString *sex;
    NSString *age;
    NSString *email;
    NSString *password;
    }

    -(NSString *)getFirstname;
    -(NSString *)getLastname;
    -(NSString *)getEmail;
    -(NSString *)getPassword;
    -(NSString *)getAge;
    -(void)setPersonInfo:(NSString *)_fname :(NSString *)_lname :(NSString *)_email :(NSString *)_password :(NSString *)_age :(NSString *)_sex;
@end

#endif /* Person_h */
