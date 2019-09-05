//
//  main.m
//  lesson1_exc3
//
//  Created by english on 2019-09-05.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        float num1 = 15.5;
        float num2 = 87;
        float result = num1 - num2;
        
        // insert code here...
        NSLog(@"\n\nThe result of subtracts %.1f from %.1f is %.2f\n", num1, num2, result);
    }
    return 0;
}
