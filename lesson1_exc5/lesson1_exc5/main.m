//
//  main.m
//  lesson1_exc5
//
//  Created by english on 2019-09-05.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>
int main (int argc, const char *argv[])
{
    @autoreleasepool {
        int answer, result;
        answer = 100;
        result = answer / 11;
        NSLog (@"\n\nThe result is %.2f\n", result + 5.5);
        
        int nbr1 = 10;
        float nbr2 = 10.55;
        char ch = 'c';
        BOOL valid = YES;
        NSLog (@"\n\nnbr1 = %i, nbr2 = %f, char = %c, valid = %i\n\n", nbr1, nbr2, ch, valid);
        if (valid) {
            NSLog (@"\n\nvalid is YES\n");
        }
    }
    return 0;
}

/* OUTPUT
 2019-09-05 16:39:09.626492-0400 lesson1_exc5[20331:700186]
 
 The result is 14.50
 Program ended with exit code: 0
 */
