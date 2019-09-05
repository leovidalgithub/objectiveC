//
//  main.m
//  lesson1
//
//  Created by english on 2019-09-05.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"\nProgramming is fun!");
        NSLog (@"\nProgramming in Objective-C is even more fun!");
        NSLog (@"Testing...\n..1\n...2\n....3");
        
        float sumFloat = 25.123;
        double sumDouble = 56.789123;
        int sumInt = 56;
        
        float f1 = 3242.123;
        float f2 = 536.45;
        float f3 = f1 / f2;
        
        int num1, num2;
        num1 = 52;
        num2 = 17;
        float x = (float)num1 / (float)num2;
        
        NSLog (@"\nThe int = %i / sumFloat = %.3f / sumDouble = %.4f / x = %.2f / f3 = %.2f", sumInt, sumFloat, sumDouble, x, f3);
    }
    return 0;
}
