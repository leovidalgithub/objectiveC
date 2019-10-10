
//  car.m
//  Car
//
//  Created by Leandro on 2019-10-08.
//  Copyright © 2019 Leandro. All rights reserved.
//
/* Write and test an Objective-C program to describe the Car class with the following properties:
 name, number of doors, number of passages, and weight. Use an appropriate data type.
 We need to get this information about a car, so create methods to set and get the values for those instance variables.
 Create another method to display the data. Use appropriate structures (conditional, loop, etc.) to query the user, to enter the data,
 to modify it, or to have displayed the data, also the option to quit.
 Comment on your programs and identify yourself at the top of the page, add the instructions for the "garbage collection"
 for the Windows in comments. Test your application, theirs functionalities, save the solution
 */

#import <Foundation/Foundation.h>
#import "car.h"

@implementation Car

    - (int) setNumOfDoors: (int) entry {
        numOfDoors = entry;
        return entry;
    }

    - (int) setNumOfPassengers: (int) entry {
        numOfPassenger = entry;
        return entry;
    }

    - (float) setWeight: (int) entry {
        weight = entry;
        return entry;
    }

    - (void) setName: (NSString *) s1 {
        name = s1;
    }

    - (NSString*) getName {
        return name;
    }

    - (int) getNumOfDoors {
        return numOfDoors;
    }

    - (int) getNumOfPassenger {
        return numOfPassenger;
    }

    - (float) getWeight {
        return weight;
    }

    - (void) printData {
        NSLog(@"Car name: %@,  number of doors: %i, number of passengers: %i, weight:, %f", name, numOfDoors,numOfPassenger,weight);
    }

@end
