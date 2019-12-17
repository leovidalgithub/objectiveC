//  person.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#ifndef person_h
#define person_h

@interface Person : NSObject {
    @private
        NSString *fname;
        NSString *lname;
    @public
        NSString *fullName;
        NSString *gender;
        int age;
    }
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname;
    -(NSString *)getFullName;
    @property NSString *fname;
    @property NSString *lname;
    @property NSString *gender;
    @property int age;
@end

@implementation Person
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname{
        self = [super init];
        if(self) {
            self.fname = _fname;
            self.lname = _lname;
            self->fullName = [NSString stringWithFormat: @"%@ %@", _fname, _lname];
        }
        return self;
    }
    -(NSString *)getFullName {
        return fullName;
    }
    @synthesize fname;
    @synthesize lname;
    //@synthesize fullName;
    @synthesize gender;
    @synthesize age;
@end

#endif /* person_h */
