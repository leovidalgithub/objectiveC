/
//  main.m
//  Car
//
//  Created by Leandro on 2019-10-08.
//  Copyright © 2019 Leandro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *car1 = [[Car alloc] init];
        char arrayName[50];
        int intAnswer;
        NSString *carName;
        int entry;
        do {
            NSLog(@"======== Menu ========");
            NSLog(@"1 - Add a Car");
            NSLog(@"2 - Modify");
            NSLog(@"3 - Display");
            NSLog(@"4 - Exit");

            scanf("%i",&entry);
            switch (entry) {
                case 1:
                    NSLog(@"Enter the car name: ");
                    scanf("%s",arrayName);
                    carName = [NSString stringWithFormat:@"%s",arrayName];
                    [car1 setName:carName];
                    
                    NSLog(@"Enter number of doors: ");
                    scanf("%i",&intAnswer);
                    [car1 setNumOfDoors: intAnswer];
                    
                    NSLog(@"Enter number of passengers: ");
                    scanf("%i",&intAnswer);
                    [car1 setNumOfPassengers: intAnswer];
                    
                    NSLog(@"Enter car weight: ");
                    scanf("%i",&intAnswer);
                    [car1 setWeight: intAnswer];
                    
                    NSLog(@"Saved car data... ");
                    [car1 printData];
                    
                    break;
                    
                case 2:
                    NSLog(@"Modify menu...");
                    NSLog(@"1 - Change Name");
                    NSLog(@"2 - Change number of Doors");
                    NSLog(@"3 - Change number of Passengers");
                    NSLog(@"4 - Change Weight");
                    int newEntry;
                    scanf("%i",&newEntry);
                    switch (newEntry) {
                        case 1:
                            NSLog(@"Enter the car name: ");
                            scanf("%s",arrayName);
                            carName = [NSString stringWithFormat:@"%s",arrayName];
                            [car1 setName:carName];
                            break;
                            
                        case 2:
                            NSLog(@"Enter number of doors: ");
                            scanf("%i",&intAnswer);
                            [car1 setNumOfDoors: intAnswer];
                            break;
                            
                        case 3:
                            NSLog(@"Enter number of passengers: ");
                            scanf("%i",&intAnswer);
                            [car1 setNumOfPassengers: intAnswer];
                            break;
                            
                        case 4:
                            NSLog(@"Enter car weight: ");
                            scanf("%i",&intAnswer);
                            [car1 setNumOfDoors: intAnswer];
                            break;
                            
                        default:
                            break;
                    }
                    newEntry=0;
                    break;
                    
                case 3:
                    NSLog(@"Saved car data... ");
                    [car1 printData];
                    break;
                    
                case 4:
                    NSLog(@" - Exiting");
                    return 0;
                    break;
                    
                default:
                    break;
            }
        }while(entry !=4);
    }
   return 0;
}
