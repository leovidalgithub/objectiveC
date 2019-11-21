//
//  person.h
//  finalProject_MacOS
//
//  Created by Leonardo on 2019-11-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#ifndef person_h
#define person_h

@interface Person : NSObject {
    @private
        NSString *fname;
        NSString *lname;
    @public
        NSString *fullName;
        NSString *address;
        NSString *country;
    }
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname;
    -(NSString *)getFullName;
    @property NSString *fname;
    @property NSString *lname;
    @property NSString *fullName;
    @property NSString *address;
    @property NSString *country;
@end

@implementation Person
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname{
        self = [super init];
        if(self) {
            self.fname = _fname;
            self.lname = _lname;
            self.fullName = [NSString stringWithFormat: @"%@ %@", _fname, _lname];
        }
        return self;
    }
    -(NSString *)getFullName {
        return fullName;
    }
    @synthesize fname;
    @synthesize lname;
    @synthesize fullName;
    @synthesize address;
    @synthesize country;
@end

#endif /* person_h */
