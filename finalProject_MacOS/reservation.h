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
        NSString *days;
        NSString *roomNumber;
    }
    @property NSString *resID;
    @property NSDate *date_init;
    @property NSString *days;
    @property NSString *roomNumber;
@end

@implementation Reservation
    @synthesize resID;
    @synthesize date_init;
    @synthesize days;
    @synthesize roomNumber;
@end

#endif /* reservation_h */
