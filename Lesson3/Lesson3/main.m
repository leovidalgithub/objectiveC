//
//  main.m
//  Lesson3
//
//  Created by english on 2019-09-12.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int value = 0;
        NSLog(@"\nValue = %i", value);

        do {
                NSLog(@"\n\nEnter a Value 1 t0 3 or 0 to quit");
                scanf("%i", &value);
    
                switch (value) {
                    case 1:
                        NSLog(@"\nYou entered 1");
                        break;
                    case 2:
                        NSLog(@"\nYou entered 2");
                        break;
                    case 3:
                        NSLog(@"\nYou entered 3");
                        break;
                    default:
                        NSLog(@"\nWrong number!");
                    break;
                }
        } while (value != 0);
        
        NSLog(@"\n\nProgram ends...\n\n");
    }
    return 0;
}
