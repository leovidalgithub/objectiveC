//
//  customer.h
//  finalProject_MacOS
//
//  Created by Leonardo on 2019-11-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#ifndef customer_h
#define customer_h

@interface Customer : Person {
    @public
        NSString *customerID;
        Reservation *reservation;
    }
    @property NSString *customerID;
    @property Reservation *reservation;
    -(void)showAllCustomerInfo;
    +(Customer*)getCustomerFromArray:(NSString *)_customerID :(NSMutableArray *)_customersArray;
@end

@implementation Customer
    @synthesize customerID;
    @synthesize reservation;
    -(void)showAllCustomerInfo {
        [Utilities terminalPristine];
        NSLog(@" CustomerID = %@", customerID);
        NSLog(@"  Full Name = %@", fullName);
        NSLog(@"    Address = %@", address);
        NSLog(@"    Country = %@", country);
        if (reservation) {
            NSLog(@"-------------- RESERVATION INFO --------------");
            NSLog(@"\t\tReservation ID   = %@", reservation.resID);
            NSLog(@"\t\tReservation Date = %@", [Utilities getDateFormatter:reservation.date_init]);
            NSLog(@"\t\t    Days of Stay = %@", reservation.days);
            NSLog(@"\t\t   Room Reserved = %@", reservation.roomNumber);
        } else {
            NSLog(@"RESERVATION = NO");
        }
    }
    +(Customer*)getCustomerFromArray:(NSString *)_customerID :(NSMutableArray *)_customersArray {
        for (Customer* customer in _customersArray){
            if([customer.customerID isEqualToString:_customerID])
                return customer;
        }
        NSLog(@"\n---------------------------------");
        NSLog(@"Sorry! Customer ID %@ not exist!", _customerID);
        NSLog(@"---------------------------------");
        return nil;
    }
@end

#endif /* customer_h */
