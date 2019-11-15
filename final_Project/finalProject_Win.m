/*
    Objective-C Final Project - Windows Version for MWINGC32 Compiler
    Created by Leonardo Rodriguez-Vidal 1811229 on Nov 8th 2019

gcc finalProject_Win.m `gnustep-config --objc-flags` -L /GNUstep/System/Library/Libraries -Wl,--no-as-needed -lgnustep-base -lobjc -std=c99 -o finalProject

*/

// #include <stdlib.h>
#import <Foundation/Foundation.h>

/********** ********** CLASS UTILITIES ********** **********/
@interface Utilities : NSObject
    +(void)clearScreen;
    +(void)terminalPristine;
    +(NSString *)giveMeFullPath:(NSString *)_fileName;
    +(NSArray *)getFileContent:(NSString *)_fileName;
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content;
    +(void)removeObjectfromArray:(NSMutableArray *)_objectArray :(int)_index;
    +(void)pressAnyKey;
    // +(NSString *)getRandomStringCode:(int)_len;
@end
@implementation Utilities
    +(void)terminalPristine {
        //this is to reduce info line output in the Terminal
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);
    }
    +(void)clearScreen {
        for (int i=0; i < 60; i++) {
            NSLog(@"\n");
            [NSThread sleepForTimeInterval:.01];
        }
    }
    +(NSString *)giveMeFullPath:(NSString *)_fileName {
        NSFileManager *filemgr = [NSFileManager defaultManager];
        return [NSString stringWithFormat: @"%@/%@", [filemgr currentDirectoryPath], _fileName];
    }
    +(NSArray *)getFileContent:(NSString *)_fileName {
        NSFileManager *filemgr = [NSFileManager defaultManager];
        NSString *fullPath = [Utilities giveMeFullPath:_fileName];
        if ([filemgr fileExistsAtPath: fullPath] == NO) {
                NSLog(@"\nSorry! But the file %@ was not found.\nMake sure this file is located in the same folder.", _fileName);
                [[NSThread mainThread] exit];
        }
        NSString *allContent = [NSString stringWithContentsOfFile:fullPath];
        NSArray *contentArray = [allContent componentsSeparatedByString:@"\n"];
        return contentArray;
    }
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content {
        NSString *fullPath = [Utilities giveMeFullPath:_fileName];
        [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil attributes:nil];
        [_content writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    +(void)removeObjectfromArray:(NSMutableArray *)_objectArray :(int)_index {
        [_objectArray removeObjectAtIndex:_index];
    }
    +(void)pressAnyKey {
        NSLog(@"\n\n--------- --------- ---------");
        NSLog(@"Press any key to continue ...");
        NSLog(@"--------- --------- ---------");
        _getch(); // getchar(); for mac
        [Utilities clearScreen];
    }
    // +(NSString *)getRandomStringCode:(int)_len {
    //     NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    //     NSMutableString *randomString = [NSMutableString stringWithCapacity:_len];
    //     for (int i=0; i<_len; i++) {
    //         [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    //     }
    //     return randomString;
    // }
@end
/********** ********** CLASS PERSON ********** **********/
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
/********** ********** CLASS RESERVATION ********** **********/
@interface Reservation : NSObject {
    @public
        NSString *resID;
        NSDate *date_init;
        int days;
        int roomNumber;
    }
    @property NSString *resID;
    @property NSDate *date_init;
    @property int days;
    @property int roomNumber;
@end
@implementation Reservation
    @synthesize resID;
    @synthesize date_init;
    @synthesize days;
    @synthesize roomNumber;
@end
/********** ********** CLASS CUSTOMER ********** **********/
@interface Customer : Person {
    @public
        NSString *customerID;
        Reservation *reservation;
    }
    @property NSString *customerID;
    @property Reservation *reservation;
    -(void)showAllCustomerInfo;
@end
@implementation Customer
    @synthesize customerID;
    @synthesize reservation;
    -(void)showAllCustomerInfo {
        [Utilities terminalPristine];
        NSLog(@"CustomerID = %@", customerID);
        NSLog(@" Full Name = %@", fullName);
        NSLog(@"   Address = %@", address);
        NSLog(@"   Country = %@", country);
    }
@end
/********** ********** CLASS ROOM ********** **********/
@interface Room : NSObject {
    @public
        int number;
        int capacity;
        NSString *name;
        NSString *customerID;
    }
    @property int number;
    @property int capacity;
    @property NSString *name;
    @property NSString *customerID;
    -(void)showAllRoomsInfo;
@end
@implementation Room
    @synthesize number;
    @synthesize capacity;
    @synthesize name;
    @synthesize customerID;
    -(void)showAllRoomsInfo {
        [Utilities terminalPristine];
        NSLog(@"Room number = %@", number);
        NSLog(@"   Capacity = %@", capacity);
        NSLog(@"      Suite = %@", name);
        NSLog(@"     Status = %@", ([customerID isEqualToString:@"empty"]) ? @"available" : [NSString stringWithFormat: @"%@%@", @"Reserved to ", customerID]);
    }
@end
/********** ********** ********** **********/
int main(int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

/* TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST */
// Customer *cus = [[Customer alloc] init];
// Reservation *res = [[Reservation alloc] init];
// res.date_init = [NSDate date];
// res.days = 23;
// res.roomNumber = 2;
// cus.reservation = res;
// NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
// [dateFormatter setDateFormat:@"MMM-dd-yyyy"];
// NSString *dateString = [dateFormatter stringFromDate:cus.reservation.date_init];
// NSLog(@"DATE = %@ - %d - %d", dateString, cus.reservation.days, cus.reservation.roomNumber);


// NSLog(@"FINISHING");
// [pool drain];
// return 0;
/* TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST */


    // VARIABLES AND CONSTANTS
    NSString *const CUSTOMERS_DATA = @"customers.dat";
    NSString *const ROOMS_DATA     = @"rooms.dat";
    int const ROOMS_SIZE           = 5;
    Customer *customer;
    Room *room;
    NSMutableArray *customersObjArray = [[NSMutableArray alloc]initWithCapacity:1];
    NSMutableArray *roomsObjArray     = [[NSMutableArray alloc]initWithCapacity:ROOMS_SIZE]; // fixed size

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
            room.number       = (int)[roomItem objectAtIndex:0];
            room.capacity     = (int)[roomItem objectAtIndex:1];
            room.name         = [roomItem objectAtIndex:2];
            room.customerID   = [roomItem objectAtIndex:3];
            [roomsObjArray addObject:room];
        }

        /********** CUSTOMER DO WHILE MENU ********** ********** **********/
        // mainMenuOption : INTEGER VARIABLE TO STORE WHATEVER USER CHOOSE
        int mainMenuOption = 0;
        do {
            NSLog(@"\n\n**** **** **** *** *** **** **** ****");
            NSLog(@"*** Welcome to Hotel Hobbies Menu ***");
            NSLog(@"**** **** **** *** *** **** **** ****");
            NSLog(@"------------ CUSTOMERS -----------");
            NSLog(@"--- 1. Enter New Customer");
            NSLog(@"--- 2. List all Customers");
            NSLog(@"--- 3. Remove a Customer");
            NSLog(@"--- ---------- ROOMS -------------");
            NSLog(@"--- 4. List all Rooms");
            NSLog(@"--- ------- RESERVATIONS ---------");
            NSLog(@"--- 5. List all Reservations");
            NSLog(@"--- 6. Make a New Reservation");
            NSLog(@"--- --------- ---------- ---------");
            NSLog(@"--- 9. Finish");
            NSLog(@"--- --------- ---------- ---------");
            printf("\nEnter an Option : ");
            scanf("%d", &mainMenuOption);

            if (mainMenuOption == 1) {
                [Utilities clearScreen];
                NSLog(@"\n\n*** ENTER A NEW CUSTOMER ***");
                NSLog(@"----------------------------");

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
                NSLog(@"\n\n*** ENTER A NEW CUSTOMER ***");
                NSLog(@"----------------------------\n");
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
                NSLog(@"----------------------------------------\n");
                if(option == 1) {
                    customer            = [[Customer alloc] initWithfname:_fname lname:_lname]; // Customer custom Constructor
                    customer.customerID = _customerID;
                    customer.address    = _address;
                    customer.country    = _country;
                    [customersObjArray addObject:customer];
                    NSLog(@"New Customer added corretly!");
                } else {
                    NSLog(@"***** ... cancelled *****");
                }
                [NSThread sleepForTimeInterval:3.8];
                [Utilities clearScreen];
            } else if(mainMenuOption == 2) {
                // LISTING CUSTOMERS
                [Utilities clearScreen];
                NSLog(@"\n\n**** CUSTOMERS LISTING ****");
                NSLog(@"--------------------------------");
                if ([customersObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Customers being displayed = %d", [customersObjArray count]);
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
                [Utilities clearScreen];
                NSLog(@"\n\n**** ROOMS LISTING ****");
                NSLog(@"----------------------------");
                if ([roomsObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Rooms being displayed = %d", [roomsObjArray count]);
                    NSLog(@"-----------------------------------------");
                    [NSThread sleepForTimeInterval:1];

                    int roomsAvailable = 0;
                    for (int i=0; i < [roomsObjArray count]; i++) {
                        NSLog(@"\nRoom # %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [[roomsObjArray objectAtIndex:i] showAllRoomsInfo];
                        NSLog(@"*****************************************");
                        if([[[roomsObjArray objectAtIndex:i] customerID] isEqualToString:@"empty"])
                            roomsAvailable++;
                    }
                    NSLog(@"------------------------");
                    NSLog(@"Rooms available = %d", roomsAvailable);
                    NSLog(@"------------------------");
                } else {
                    NSLog(@"\n\nSorry!\nThere is no Rooms to display.")
                }
                [Utilities pressAnyKey];
            } else if(mainMenuOption == 3) { // OPTION 3 - REMOVE A CUSTOMER
                [Utilities clearScreen];
                NSLog(@"\n\n*** REMOVE A CUSTOMER ***");
                NSLog(@"----------------------------");
                char optionCustomerID[10] = {0};
                printf("\nEnter Customer ID : ");
                scanf("%s", optionCustomerID);
                NSString *_optionCustomerID = [NSString stringWithUTF8String:optionCustomerID];

                // searching for the Customer to be removed
                for (int i=0; i < [customersObjArray count]; i++) {
                    if([[[customersObjArray objectAtIndex:i] customerID] isEqualToString:_optionCustomerID]) {
                        NSLog(@"-----------------------------------------");
                        NSLog(@"Do you really want to remove customer : %@", [[customersObjArray objectAtIndex:i] fullName]);
                        NSLog(@"\n1. Yes");
                        NSLog(@"2. No");
                        printf("\nEnter an Option : ");
                        fflush(stdin);
                        int option = 0;
                        scanf("%d", &option);
                        NSLog(@"----------------------------------------\n");
                        if(option == 1) {
                            [Utilities removeObjectfromArray:customersObjArray :i];
                            NSLog(@"Customer removed corretly!");
                        } else {
                            NSLog(@"***** ... cancelled *****");
                        }
                        [NSThread sleepForTimeInterval:3.8];
                        [Utilities clearScreen];
                    }
                }
            }
        } while (mainMenuOption != 9); // while opt is not equal 3 the Do While continues

/********** STORING ALL DATA INTO PLAIN FILES BEFORE EXIT ********** ********** **********/
/********** Storing Customers into Customers.dat ********** ********** **********/
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
        [pool drain];
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