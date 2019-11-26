//
//  reservation.h
//  finalProject_MacOS
//
//  Created by Leonardo on 2019-11-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#ifndef reservation_h
#define reservation_h

/********** ********** CLASS RESERVATION ********** **********/
@interface Reservation : NSObject {
    @public
        NSString *resID;
        NSDate *date_init;
        NSDate *date_ends;
        NSString *days;
        NSString *roomNumber;
        NSString *extraService;
    }
    @property NSString *resID;
    @property NSDate *date_init;
    @property NSDate *date_ends;
    @property (nonatomic) NSString *days;
    @property NSString *roomNumber;
    @property NSString *extraService;
@end

@implementation Reservation
    @synthesize resID;
    @synthesize date_init;
    @synthesize date_ends;
    @synthesize days = _days;
    @synthesize roomNumber;
    @synthesize extraService;
    -(id)init { // default Constructor just to initlize 'extraService' Property default value
        if (self = [super init]) {
            self.extraService = @"N/A";
        }
        return self;
    }
    -(void)setDays:(NSString *)_stayDays { // Property 'days' setter so that 'date_ends' is calculated automatically
        _days = _stayDays;
        date_ends = [date_init dateByAddingTimeInterval:([_days intValue]*24*60*60)];
    }
@end

#endif /* reservation_h */
