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
        NSString *first_name;
        NSString *last_name;
    @public
        NSString *fullName;
        NSString *gender;
        int age;
    }
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname;
    -(NSString *)getFullName;
    @property NSString *first_name;
    @property NSString *last_name;
    @property NSString *gender;
    @property int age;
@end

@implementation Person
    -(id)initWithfname:(NSString *)_fname lname:(NSString *)_lname{
        self = [super init];
        if(self) {
            self.first_name = _fname;
            self.last_name = _lname;
            self->fullName = [NSString stringWithFormat: @"%@ %@", _fname, _lname];
        }
        return self;
    }
    -(NSString *)getFullName {
        return fullName;
    }
    @synthesize first_name;
    @synthesize last_name;
    @synthesize gender;
    @synthesize age;
@end

#endif /* person_h */
