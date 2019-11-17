/*
 Objective-C Final Project - MacOS SIERRA HIGH 10.13.6 for Xcode 9.4.1
 Created by Leonardo Rodriguez-Vidal 1811229 on Nov 8th 2019
 
 https://isipinoytek.wordpress.com/2018/06/07/mac-os-x-high-sierra-10-13-vm-in-vmware-workstation-14/
 */

#include <stdlib.h>
#import <Foundation/Foundation.h>
#import "utilities.h"
#import "person.h"
#import "reservation.h"
#import "customer.h"
#import "room.h"

// ---------------------- ---------------------- ---------------------- main ---------------------- ---------------------- /
int main(int argc, const char * argv[]) {
    @autoreleasepool {

/* TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST */
//    Customer *cus = [[Customer alloc] init];
//    Reservation *res = [[Reservation alloc] init];
//    res.date_init = [NSDate date];
//    res.days = 23;
//    res.roomNumber = 2;
//    cus.reservation = res;
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
//    NSString *dateString = [dateFormatter stringFromDate:cus.reservation.date_init];
//    NSLog(@"DATE === %@ - %d - %d", dateString, cus.reservation.days, cus.reservation.roomNumber);
//    NSLog(@"random... %@", [Utilities getRandomStringCode:13]);
//    NSLog(@"test ends here...");
//    return 0;
/* TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST */
    
    
    // VARIABLES AND CONSTANTS
    NSString *const CUSTOMERS_DATA = @"customers.dat";
    NSString *const ROOMS_DATA     = @"rooms.dat";
    int const ROOMS_SIZE           = 5;
    Customer *customer;
    Room *room;
    NSMutableArray *customersObjArray    = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size
    NSMutableArray *roomsObjArray        = [[NSMutableArray alloc]initWithCapacity:ROOMS_SIZE]; // fixed size
    NSMutableArray *customersWaitingList = [[NSMutableArray alloc]initWithCapacity:1]; // dynamic size to store CustomerIDs
    
    [Utilities clearScreen];
    
    // ********** ********** ********** GETTING ALL STORED DATA ********** ********** **********
    // ********** Retrieving all Customers data
    NSArray *customersTempArray = [Utilities getFileContent:CUSTOMERS_DATA];
    for (int i=0; i < [customersTempArray count]; i++) {
        NSArray *customerItem = [[customersTempArray objectAtIndex:i] componentsSeparatedByString:@"#"];
        customer              = [[Customer alloc] initWithfname:[customerItem objectAtIndex:1] lname:[customerItem objectAtIndex:2]]; // Customer custom Constructor
        customer.customerID   = [customerItem objectAtIndex:0];
        customer.address      = [customerItem objectAtIndex:3];
        customer.country      = [customerItem objectAtIndex:4];
        [customersObjArray addObject:customer];
    }
    // ********** Retrieving all Rooms data
    NSArray *roomsTempArray = [Utilities getFileContent:ROOMS_DATA];
    for (int i=0; i < [roomsTempArray count]; i++) {
        NSArray *roomItem = [[roomsTempArray objectAtIndex:i] componentsSeparatedByString:@"#"];
        room              = [[Room alloc] init]; // Room default Constructor
        room.number       = [roomItem objectAtIndex:0];
        room.capacity     = [roomItem objectAtIndex:1];
        room.name         = [roomItem objectAtIndex:2];
        room.customerID   = [roomItem objectAtIndex:3];
        [roomsObjArray addObject:room];
    }
    
//        NSMutableArray *roomsAvailable = [Room showRoomsAvailable:roomsObjArray];
//        for (NSString *obj in roomsAvailable) {
//            NSLog(@"--- %@", obj);
//        }
//        NSString *roomNumber = @"4";
//        if ([roomsAvailable indexOfObject:roomNumber] == NSNotFound) {
//            NSLog(@" == NSNOTFOUND");
//        } else {
//            NSLog(@" != NSNOTFOUND");
//        }
//        return 0;
        
    // ------------------- ------------------- ------------------- CUSTOMER DO WHILE MENU ---------------- ---------------- ----------------
    int mainMenuOption = 0; // variable which store user choice
    do {
        NSLog(@"\t\t**** **** **** *** *** **** **** ****");
        NSLog(@"\t\t*** Welcome to Hotel Hobbies Menu ***");
        NSLog(@"\t\t**** **** **** *** *** **** **** ****\n");
        NSLog(@"\t\t------------ CUSTOMERS -----------");
        NSLog(@"\t\t--- 1. Enter New Customer");
        NSLog(@"\t\t--- 2. List all Customers");
        NSLog(@"\t\t--- 3. Remove a Customer");
        NSLog(@"\t\t--- ---------- ROOMS -------------");
        NSLog(@"\t\t--- 4. List all Rooms");
        NSLog(@"\t\t--- ------- RESERVATIONS ---------");
        NSLog(@"\t\t--- 5. List all Reservations");
        NSLog(@"\t\t--- 6. Make a New Reservation");
        NSLog(@"\t\t--- --------- ---------- ---------");
        NSLog(@"\t\t--- 9. Finish");
        NSLog(@"\t\t--- --------- ---------- ---------");
        printf("\n\t\tEnter an Option : ");
        scanf("%d", &mainMenuOption);
        [Utilities clearScreen];
        
        if (mainMenuOption == 1) {
            NSLog(@"\n\n*** ENTERING A NEW CUSTOMER ***");
            NSLog(@"-------------------------------");
            
            char customerID[10] = {0};
            printf("\nEnter customerID : ");
            scanf("%s", customerID);
            NSString *_customerID = [NSString stringWithUTF8String:customerID];
            
            char fname[25] = {0};
            printf("\nEnter First Name : ");
            scanf("%s", fname);
            NSString *_fname = [NSString stringWithUTF8String:fname];
            
            char lname[25] = {0};
            printf("\nEnter Last Name : ");
            scanf("%s", lname);
            NSString *_lname = [NSString stringWithUTF8String:lname];
            
            char address[45] = {0};
            printf("\nEnter the Address : ");
            scanf("%s", address);
            NSString *_address = [NSString stringWithUTF8String:address];
            
            char country[25] = {0};
            printf("\nEnter the Country : ");
            scanf("%s", country);
            NSString *_country = [NSString stringWithUTF8String:country];
            
            // MAKING SURE THAT THE INFO ENTERED ARE CORRECTO TO PROCEED TO ADD INTO CUSTOMERSOBJARRAY
            [Utilities clearScreen];
            NSLog(@"\n\n*** ENTERING A NEW CUSTOMER ***");
            NSLog(@"-------------------------------\n");
            NSLog(@"CustomerID = %@", _customerID);
            NSLog(@"First Name = %@", _fname);
            NSLog(@" Last Name = %@", _lname);
            NSLog(@"   Address = %@", _address);
            NSLog(@"   Country = %@", _country);
            NSLog(@"----------------------------\n");
            NSLog(@"Is this info correct?");
            NSLog(@"\n1. Yes");
            NSLog(@"2. No");
            printf("\nEnter an Option : ");
            fflush(stdin);
            int option = 0;
            scanf("%d", &option);
            if(option == 1) {
                customer            = [[Customer alloc] initWithfname:_fname lname:_lname]; // Customer custom Constructor
                customer.customerID = _customerID;
                customer.address    = _address;
                customer.country    = _country;
                [customersObjArray addObject:customer];
                NSLog(@"\n----------------------------");
                NSLog(@"New Customer added corretly!");
                NSLog(@"----------------------------");
            } else {
                NSLog(@"\n-------------------------------------------");
                NSLog(@"***** Operation cancelled by the user *****");
                NSLog(@"-------------------------------------------");
            }
            [Utilities pressAnyKey];
        } else if(mainMenuOption == 2) {
            // LISTING CUSTOMERS
            NSLog(@"\n\n**** CUSTOMERS LISTING ****");
            NSLog(@"--------------------------------");
            if ([customersObjArray count] > 0 ) {
                NSLog(@"\nNumber of Customers being displayed = %lu", (unsigned long)[customersObjArray count]);
                NSLog(@"-----------------------------------------");
                [NSThread sleepForTimeInterval:1];
                
                for (int i=0; i < [customersObjArray count]; i++) {
                    NSLog(@"\nCustomer # %i", i + 1);
                    NSLog(@"-----------------------------------------");
                    [[customersObjArray objectAtIndex:i] showAllCustomerInfo];
                    NSLog(@"*****************************************");
                }
            } else {
                NSLog(@"\n\nSorry!\nThere is no Customers to show\nTry to add at least one Customer.")
            }
            [Utilities pressAnyKey];
        } else if(mainMenuOption == 4) {
            // LISTING ROOMS
            NSLog(@"\n\n**** ROOMS LISTING ****");
            NSLog(@"----------------------------");
            if ([roomsObjArray count] > 0 ) {
                NSLog(@"\nNumber of Rooms being displayed = %lu", (unsigned long)[roomsObjArray count]);
                NSLog(@"-----------------------------------------");
                [NSThread sleepForTimeInterval:1];
                
                for (int i=0; i < [roomsObjArray count]; i++) {
                    NSLog(@"\nRoom # %i", i + 1);
                    NSLog(@"-----------------------------------------");
                    [[roomsObjArray objectAtIndex:i] showAllRoomsInfo];
                    NSLog(@"*****************************************");
                }
                NSLog(@"\n------------------------");
                NSLog(@"Rooms available = %d", [Room getRoomsAvailability:roomsObjArray]);
                NSLog(@"------------------------");
            } else {
                NSLog(@"\n\nSorry!\nThere is no Rooms to display.")
            }
            [Utilities pressAnyKey];
        } else if(mainMenuOption == 3) { // OPTION 3 - REMOVE A CUSTOMER
            NSLog(@"\n\n*** REMOVE A CUSTOMER ***");
            NSLog(@"----------------------------");
            char optionCustomerID[10] = {0};
            printf("\nEnter Customer ID : ");
            scanf("%s", optionCustomerID);
            NSString *_optionCustomerID = [NSString stringWithUTF8String:optionCustomerID];
            
            // if exists, get the Customer by its ID to be removed
            Customer *customerToRemove = [Customer getCustomerFromArray:_optionCustomerID :customersObjArray];
            if(customerToRemove) {
                NSLog(@"-----------------------------------------");
                NSLog(@"Do you really want to remove customer : %@", customerToRemove.fullName);
                NSLog(@"\n1. Yes");
                NSLog(@"2. No");
                printf("\nEnter an Option : ");
                fflush(stdin);
                int option = 0;
                scanf("%d", &option);
                if(option == 1) {
                    [Utilities removeObjectfromArray:customersObjArray :customerToRemove];
                    NSLog(@"\n----------------------------------------------------")
                    NSLog(@"Customer %@ has been corretly removed!", customerToRemove.fullName);
                    NSLog(@"----------------------------------------------------")
                } else {
                    NSLog(@"\n-------------------------------------------");
                    NSLog(@"***** Operation cancelled by the user *****");
                    NSLog(@"-------------------------------------------");
                }
            }
            [Utilities pressAnyKey];
        } else if(mainMenuOption == 6) { // OPTION 6 - MAKE A NEW RESERVATION
            [Utilities clearScreen];
            
            Reservation *newReservation = [[Reservation alloc] init];
            newReservation.resID = [Utilities getRandomStringCode:9];
            newReservation.date_init = [NSDate date];

            NSLog(@"\n\n*** MAKING A NEW RESERVATION ***");
            NSLog(@"--------------------------------------------\n");
            NSLog(@"New Reservation ID = %@", newReservation.resID);
            NSLog(@"              Date = %@", [Utilities getDateFormatter:newReservation.date_init]);
            NSLog(@"--------------------------------------------");
            char optionCustomerID[10] = {0};
            printf("\nEnter Customer ID : ");
            scanf("%s", optionCustomerID);
            NSString *_optionCustomerID = [NSString stringWithUTF8String:optionCustomerID];
            
            // if exists, get the Customer by its ID to be removed
            Customer *customerToNewReservation = [Customer getCustomerFromArray:_optionCustomerID :customersObjArray];
            if(customerToNewReservation) {
                NSLog(@"         Fullname : %@", customerToNewReservation.fullName);
                
                // veryfing for Room availability
                if ([Room getRoomsAvailability:roomsObjArray] != 0) { // ROOMS AVAILABLE
                    BOOL roomNumberOkay;
                    do {
                        roomNumberOkay = YES;
                        NSLog(@"\n--------------------------------\n");
                        NSLog(@"\t*** Available Rooms ***\n");
                        NSMutableArray *roomsAvailable = [Room showRoomsAvailable:roomsObjArray];
                        NSLog(@"--------------------------------------------------");
                        char roomNumber[5] = {0};
                        printf("\nEnter Room number : ");
                        scanf("%s", roomNumber);
                        NSString *_roomNumber = [NSString stringWithUTF8String:roomNumber];
                        
                        if ([roomsAvailable indexOfObject:_roomNumber] != NSNotFound) { // roomNumber correct and available
                            
                            newReservation.roomNumber = _roomNumber;

                            NSLog(@"----------------------------");
                            char numberOfDays[5] = {0};
                            printf("\nEnter Number of Days : ");
                            scanf("%s", numberOfDays);
                            newReservation.days = [NSString stringWithUTF8String:numberOfDays];
                        
                            customerToNewReservation.reservation = newReservation;
                            
                            [Room setRoomReservation:roomsObjArray :customerToNewReservation.customerID :newReservation.roomNumber];

                            NSLog(@"\n  --------------------------------");
                            NSLog(@"  Reservation stored succsesfully!");
                            NSLog(@"  --------------------------------");

                        } else { // roomNumber introduced is not correct or not available
                            NSLog(@"\n--------------------------------------");
                            NSLog(@"  Sorry! Room introduced is not correct!");
                            NSLog(@"--------------------------------------");
                            roomNumberOkay = NO;
                        }
                    } while (!roomNumberOkay);
                    
                } else { // NO ROOMS AVAILABLE
                    NSLog(@"\n-----------------------------------------");
                    NSLog(@"  Sorry! No Rooms available at this time!");
                    NSLog(@"-----------------------------------------");
                    NSLog(@"\nDo you want customer %@ to be added into the Waiting List?", customerToNewReservation.fullName);
                    NSLog(@"\n1. Yes");
                    NSLog(@"2. No");
                    printf("\nEnter an Option : ");
                    fflush(stdin);
                    int option = 0;
                    scanf("%d", &option);
                    if(option == 1) {
                        if ([customersWaitingList indexOfObject:customerToNewReservation.customerID] == NSNotFound) // veryfing if already exist / otherwise, it is added into the WaitingListArray
                            [customersWaitingList addObject:customerToNewReservation.customerID];
                        NSLog(@"\n-----------------------------------------------------------------");
                        NSLog(@"Customer %@ added corretly to the Waiting List!", customerToNewReservation.fullName);
                        NSLog(@"-----------------------------------------------------------------");
                    } else {
                        NSLog(@"\n-------------------------------------------");
                        NSLog(@"***** Operation cancelled by the user *****");
                        NSLog(@"-------------------------------------------");
                    }
                }
            } // if(customerToNewReservation)
            [Utilities pressAnyKey];
        }
    } while (mainMenuOption != 9); // main Do While (exit on mainMenuOption == 9 )
    
    /********** STORING ALL DATA INTO PLAIN FILES BEFORE EXIT ********** ********** **********/
    /********** Storing Customers into Customers.dat          ********** ********** **********/
    NSMutableString *customerContent = [NSMutableString string];
    for (int i=0; i < [customersObjArray count]; i++) {
        NSString *temp = [NSString stringWithFormat:@"%@#%@#%@#%@#%@\n",[[customersObjArray objectAtIndex:i] customerID],
                          [[customersObjArray objectAtIndex:i] fname],
                          [[customersObjArray objectAtIndex:i] lname],
                          [[customersObjArray objectAtIndex:i] address],
                          [[customersObjArray objectAtIndex:i] country]];
        [customerContent appendString:temp];
    }
    [customerContent deleteCharactersInRange:NSMakeRange([customerContent length]-1, 1)]; // removing the last newLine '\n'
    [Utilities saveFileContent:CUSTOMERS_DATA :customerContent];
    
    // exit program
    [Utilities clearScreen];
    NSLog(@"------------------ -------------------- -------------------");
    NSLog(@"--- Thanks for using Hotel Hobbies Managenment Program! ---");
    NSLog(@"------------------ -------------------- -------------------");
//    [pool drain];
    }
    return 0;
}
/*
 class Person
 
 class Customer inh Person
 class Employer inh Person
 
 class Reservation
 
 list array Employees[5]
 list array Customers[50]
 list array Reservations[5]
 list array waitingList[50]
 
 
 
 */
// /********** ********** SECUENCIAL WRITE FILE ********** **********/
// [[NSFileManager defaultManager] createFileAtPath:@"C:/GNUstep/msys/1.0/home/leone/data.txt" contents:nil attributes:nil];
// NSString *str = @"Description#Data#IMG#4#76#1#54";
// [str writeToFile:@"C:/GNUstep/msys/1.0/home/leone/data.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
/********** ********** ********** **********/
/*
 Customer *myCustomer = [[Customer alloc] init];
 myCustomer = [customersObjArray objectAtIndex:2];
 NSLog(@"%d",[customersObjArray count]);
 NSLog(@"%@",myCustomer.fname);
 NSLog(@"%@",myCustomer.address);
 NSLog(@"%@",myCustomer.country);
 NSLog(@"-------------------------");
 */

