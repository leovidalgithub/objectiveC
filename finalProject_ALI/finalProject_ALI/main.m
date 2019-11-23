//
//  main.m
//  Project
//
//  Created by Ali khamseh on 2019-11-14.
//  Copyright © 2019 Ali khamseh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelRoom : NSObject{
    NSString *roomType;
    int roomNumber;
    int price;
    }
    -(NSString *)getRoomType;
    -(int)getRoomNumber;
    -(int)getPrice;
    -(void)setRoomType : (NSString *) typeOfRoom;
    -(void)setRoomNumber : (int) numberOfroom;
    -(void)setPrice : (int) totalPrice;
    -(void)print;
@end
@implementation HotelRoom
    -(NSString *)getRoomType {return roomType;}
    -(void)setRoomType:(NSString *)typeOfRoom {roomType=typeOfRoom;}
    -(int)getRoomNumber {return roomNumber;}
    -(void)setRoomNumber :(int) numberOfroom {roomNumber = numberOfroom;}
    -(int)getPrice{ return price;}
    -(void)setPrice : (int) totalPrice { price=totalPrice;}
    -(void)print{
        NSLog(@"\nThe room type is : %@ ,\nThe room number is : %i,\nThe price is :%d.00",roomType,roomNumber,price);
    }
@end

@interface Reservation : HotelRoom{
    NSString *firstName;
    NSString *lastName;
    NSString *email;
    int duration;
    }
    -(NSString *)getFirstName ;
    -(NSString *)getLastName ;
    -(NSString *)getEmail ;
    -(int )getDuration;
    -(void)setFirstName : (NSString *) fname;
    -(void)setLastName : (NSString *) lname;
    -(void)setEmail : (NSString *) mail;
    -(void)setDuration :(int) date;
    -(void)setReservationData :(NSString *) fn :(NSString *) ln :( NSString *)ma :(int) da :(NSString *) roomT :(int) pr;
    -(void)printReservtion;
@end
@implementation Reservation
    -(NSString *)getFirstName {return firstName;}
    -(NSString *)getLastName {return lastName;}
    -(NSString *)getEmail {return email;}
    -(int)getDuration {return duration;}
    -(void)setFirstName : (NSString *) fname {firstName=fname;}
    -(void)setLastName : (NSString *) lname {lastName=lname;}
    -(void)setEmail : (NSString *) mail {email=mail;}
    -(void)setDuration :(int) date {duration = date;}
    -(void) setReservationData :(NSString *) fn :(NSString *) ln :(NSString *)ma :(int) da : (NSString *) roomT :(int) pr {
        firstName = fn;
        lastName = ln;
        email = ma;
        duration = da;
        roomType=roomT;
        price=pr;
    }
    -(void)printReservtion {
        NSLog(@"\nThe firstname is : %@ \nThe lastname is : %@ \nThe email is %@,\nThe duration : %i,\nThe type Of Room : %@,\nThe room Number is : %i,\nThe total price is : %i ",firstName,lastName,email,duration,roomType,roomNumber,price );
    }
@end

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Reservation *reserve = [[Reservation alloc] init];
        char enteredFN[30];
        char enteredLN[30];
        char enteredEmail[30];
        int enteredDuration = 0;
        char enteredRoomType[30];
        int enteredPrice = 0;
// ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
        NSMutableArray *availableRooms = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
// ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
        //  int intAnswer;
        int entry;
        do {
            NSLog(@"======== Menu ========");
            NSLog(@"1 - Customer");
            NSLog(@"2 - Employee");
            scanf("%i",&entry);
            int option = 0;
            switch (entry) {
                case 1:
                    do {
                        NSLog(@"========Customer Menu ========");
                        NSLog(@"1 - Reserve a room");
                        NSLog(@"2 - See the Services");
                        NSLog(@"3 - See the bill");
                        scanf("%i",&option);
                        switch (option) {
                            case 1: {
// ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
                                if ([availableRooms count] == 0) {
                                    NSLog(@"\n\nSorry! But there is no available Rooms.\n");
                                    break;
                                }
// ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
                                NSLog(@"+++Reserve a room+++");
                                NSLog(@"Please enter your first name : ");
                                scanf("%s",enteredFN);
                                NSLog(@"Please enter your last name : ");
                                scanf("%s",enteredLN);
                                NSLog(@"Please enter your email : ");
                                scanf("%s",enteredEmail);
                                NSLog(@"Please enter your duration : ");
                                scanf("%d",&enteredDuration);
                                NSLog(@"Please enter your type of room (Suite/Semi_Suite/King_bed/Queen_bed) :");
                                scanf("%s",enteredRoomType);
                                
                                NSString *str1;
                                str1 = [NSString stringWithFormat:@"%s",enteredFN];
                                NSString *str2;
                                str2 = [NSString stringWithFormat:@"%s",enteredLN];
                                NSString *str3;
                                str3 = [NSString stringWithFormat:@"%s",enteredEmail];
                                NSString *str4;
                                str4 = [NSString stringWithFormat:@"%s",enteredRoomType];
                                
                                if ( [str4 isEqualToString:@"Suite"]) {
                                    enteredPrice = enteredDuration * 500;
                                }else if ([str4 isEqualToString: @"Semi_suite"]){
                                    enteredPrice = enteredDuration * 350;
                                }
                                else if ([str4 isEqualToString:@"King_bed"]){
                                    enteredPrice = enteredDuration * 250;
                                }
                                else if ([str4 isEqualToString:@"Queen_bed"]){
                                    enteredPrice = enteredDuration * 200;
                                }
                                else{
                                    NSLog(@"Please enter corect type of room.");
                                }
                                [reserve setReservationData :str1 :str2 :str3 : enteredDuration :str4: enteredPrice];
// ------------------- ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
                                int randomRoomIndex = arc4random_uniform((uint)[availableRooms count]);
                                NSString *room = [availableRooms objectAtIndex:randomRoomIndex];
                                [availableRooms removeObject:room];
                                NSLog(@"\nSelected Room number is %@", room);
                                NSLog(@"\nThere are %lu Rooms available.", (unsigned long)[availableRooms count]);
// ------------------- ------------------- ------------------- ------------------- ------------------- ------------------- ROOM ------------------- -------------------
                                break;
                            }
                            case 2: {
                                NSLog(@"+++See the Services and the price by choosing the type of room+++");
                                int choice = 0;
                                do{
                                    NSLog(@"1- Suite");
                                    NSLog(@"2- Semi-Suite");
                                    NSLog(@"3- King-bed");
                                    NSLog(@"4- Queen-bed");
                                    NSLog(@"5- back to menu");
                                    scanf("%i",&choice);
                                    switch (choice) {
                                        case 1:
                                            NSLog(@"Souna \nFitness center \nIndoor Pool \nOutdoor Pool");
                                            NSLog(@"each night 500$");
                                            break;
                                        case 2:
                                            NSLog(@"Souna \nFitness center \nIndoor Pool");
                                            NSLog(@"each night 350$");
                                            break;
                                        case 3:
                                            NSLog(@"Souna \nFitness center \nIndoor Pool");
                                            NSLog(@"each night 250$");
                                            break;
                                        case 4:
                                            NSLog(@"Souna \nFitness center");
                                            NSLog(@"each night 200$");
                                            break;
                                        case 5:
                                            NSLog(@"back menu");
                                            break;
                                    }
                                } while(choice != 5);
                            }
                            case 3:
                            {
                                [reserve printReservtion];
                            }
                        } // switch(option)
                    } while(option !=3);
            } // switch(entry)
        } while(entry !=2);
        
    } // @autoreleasepool
    return 0;
} // int main


