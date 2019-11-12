//  final_Project//
//  Created by english on 2019-10-31.
//  Copyright © 2019 english. All rights reserved.
//  gcc `gnustep-config --objc-flags` -L /GNUstep/System/Library/Libraries finalProject.m -o Final -lgnustep-base -lobjc -std=c99

#import <Foundation/Foundation.h>

/********** ********** CLASS UTILITIES ********** **********/
@interface Utilities : NSObject
    +(void)clearScreen;
    +(void)terminalPristine;
    +(NSString *)giveMeFullPath:(NSString *)_fileName;
    +(NSArray *)getFileContent:(NSString *)_fileName;
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content;
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
        if ([filemgr fileExistsAtPath: fullPath] == YES)
                NSLog(@"\nFile exists")
        else
                NSLog(@"\nFile not found");
        NSString *allContent = [NSString stringWithContentsOfFile:fullPath];
        NSArray *contentArray = [allContent componentsSeparatedByString:@"\n"];
        return contentArray;
    }
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content {
        NSString *fullPath = [Utilities giveMeFullPath:_fileName];
        [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil attributes:nil];
        [_content writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }

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
    -(id)initWithfname:(NSString *)afname lname:(NSString *)alname;
    -(NSString *)getFullName;
    @property NSString *fname;
    @property NSString *lname;
    @property NSString *fullName;
    @property NSString *address;
    @property NSString *country;
@end
@implementation Person
    -(id)initWithfname:(NSString *)afname lname:(NSString *)alname{
            self = [super init];
            if(self) {
                self.fname = afname;
                self.lname = alname;
                self.fullName = [NSString stringWithFormat: @"%@ %@", afname, alname];
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
/********** ********** CLASS CUSTOMER ********** **********/
@interface Customer : Person {
    @public
        NSString *customerID;
    }
    @property NSString *customerID;
    -(void)showAllCustomerInfo;
@end
@implementation Customer
    @synthesize customerID;
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
    }
    @property int number;
    @property int capacity;
    @property NSString *name;
@end
@implementation Room
    @synthesize number;
    @synthesize capacity;
    @synthesize name;
@end
/********** ********** ********** **********/
int main(int argc, const char * argv[]) {
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

        [Utilities clearScreen];

        // GETTING ALL STORED CUSTOMERS INTO customersObjArray
        Customer *customer;
        NSMutableArray *customersObjArray = [[NSMutableArray alloc]initWithCapacity:1];
        NSArray *customersTempArray = [Utilities getFileContent:@"customer.dat"];
        for (int i=0; i < [customersTempArray count]; i++) {
            NSArray *customerItem = [[customersTempArray objectAtIndex:i] componentsSeparatedByString:@"#"];
            customer              = [[Customer alloc] initWithfname:[customerItem objectAtIndex:1] lname:[customerItem objectAtIndex:2]]; // custom Constructor
            customer.customerID   = [customerItem objectAtIndex:0];
            customer.address      = [customerItem objectAtIndex:3];
            customer.country      = [customerItem objectAtIndex:4];
            [customersObjArray addObject:customer];
        }

        /********** CUSTOMER DO WHILE MENU ********** ********** **********/
        // User_option : INTEGER VARIABLE TO STORE WHATEVER USER CHOOSE
        int User_option = 0;
        do {
            NSLog(@"\n\nWelcome to Hotel Hobbies Customer Menu");
            NSLog(@"----------------------");
            NSLog(@"1. Enter a new Customer");
            NSLog(@"2. Show all Customers");
            NSLog(@"3. Remove a Customer");
            NSLog(@"4. Finish");
            printf("\nEnter an Option : ");
            scanf("%d", &User_option);

            if (User_option == 1) {
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
                int proceed = 0;
                scanf("%d", &proceed);
                if(proceed == 1) {
                    customer            = [[Customer alloc] initWithfname:_fname lname:_lname]; // Customer custom Constructor
                    customer.customerID = _customerID;
                    customer.address    = _address;
                    customer.country    = _country;
                    [customersObjArray addObject:customer];

                    NSLog(@"----------------------------------------\n");
                    NSLog(@"Info added to the Customers Array corretly!");
                    [NSThread sleepForTimeInterval:3.8];
                    [Utilities clearScreen];
                }
            } else if(User_option == 2) {
                // SHOWING A COMPLETE LIST OF ALL CUSTOMERS
                [Utilities clearScreen];
                if ([customersObjArray count] > 0 ) {
                    NSLog(@"\nNumber of Customers being displayed = %d", [customersObjArray count]);
                    NSLog(@"-----------------------------------------");
                    for (int i=0; i < [customersObjArray count]; i++) {
                        NSLog(@"\nCustomer # %i", i + 1);
                        NSLog(@"-----------------------------------------");
                        [[customersObjArray objectAtIndex:i] showAllCustomerInfo];
                        NSLog(@"*****************************************");
                    }
                } else {
                    NSLog(@"\n\nSorry!\nThere is no Customers to show\nTry to add at least one Customer.")
                }
            }
        } while (User_option != 4); // while opt is not equal 3 the Do While continues

/********** STORING ALL DATA INTO PLAIN FILES BEFORE EXIT ********** ********** **********/
/********** Storing Customers into Customer.dat ********** ********** **********/
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
            [Utilities saveFileContent:@"customer.dat" :customerContent];

        NSLog(@"program ends -------------------------");
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