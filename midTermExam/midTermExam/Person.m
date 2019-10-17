//
//  Person.m
//  midTermExam
//
//  Created by english on 2019-10-17.
//

#import <Foundation/Foundation.h>
#import "Person.h"

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
    -(NSString *)getAge {
        return age;
    }
    -(NSString *)getSex {
        return sex;
    }
    -(void)setPersonInfo:(NSString *)_fname :(NSString *)_lname :(NSString *)_email :(NSString *)_password :(NSString *)_age :(NSString *)_sex {
        fname = _fname;
        lname = _lname;
        email = _email;
        password = _password;
        age = _age;
        sex = _sex;
    }
@end
