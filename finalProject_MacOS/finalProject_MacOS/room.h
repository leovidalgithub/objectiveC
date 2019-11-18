//
//  room.h
//  finalProject_MacOS
//
//  Created by Leonardo on 2019-11-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#ifndef room_h
#define room_h

@interface Room : NSObject {
    @public
        NSString *number;
        NSString *capacity;
        NSString *name;
        NSString *customerID;
    }
    @property NSString *number;
    @property NSString *capacity;
    @property NSString *name;
    @property NSString *customerID;
    -(void)showAllRoomsInfo;
    +(int)getRoomsAvailability:(NSMutableArray *)_roomsArray;
    +(NSMutableArray *)showRoomsAvailable:(NSMutableArray *)_roomsArray;
    +(void)setRoomReservation:(NSMutableArray *)_roomsArray :(NSString *)_customerID :(NSString *)_roomNumber;
@end

@implementation Room
    @synthesize number;
    @synthesize capacity;
    @synthesize name;
    @synthesize customerID;
    -(void)showAllRoomsInfo {
        [Utilities terminalPristine];
        NSLog(@"ROOM NUMBER = %@", number);
        NSLog(@"   CAPACITY = %@", capacity);
        NSLog(@"      SUITE = %@", name);
        NSLog(@"     STATUS = %@", ([customerID isEqualToString:@"empty"]) ? @"AVAILABLE" : [NSString stringWithFormat: @"%@%@", @"RESERVED CUSTOMER ID = ", customerID]);
    }
    +(int)getRoomsAvailability:(NSMutableArray *)_roomsArray {
        int roomsAvailables = 0;
        for (Room *room in _roomsArray) {
            if ([room.customerID isEqualToString:@"empty"])
                roomsAvailables++;
        }
        return roomsAvailables;
    }
    +(NSMutableArray *)showRoomsAvailable:(NSMutableArray *)_roomsArray {
        NSMutableArray *roomsAvailableArray = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size
        for (Room *room in _roomsArray) {
            if ([room.customerID isEqualToString:@"empty"]) {
                [roomsAvailableArray addObject:room.number];
                NSLog(@"ROOM #%@ - SUITE %@ - CAPACITY = %@ - AVAILABLE = YES", room.number, room.name, room.capacity);
            }
        }
        return roomsAvailableArray;
    }
    +(void)setRoomReservation:(NSMutableArray *)_roomsArray :(NSString *)_customerID :(NSString *)_roomNumber {
        for (Room *room in _roomsArray) {
            if ([room.number isEqualToString:_roomNumber])
                room.customerID = _customerID;
        }
    }
@end

#endif /* room_h */
