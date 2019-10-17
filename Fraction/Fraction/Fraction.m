//
//  Fraction.m
//
//  Created by english on 2019-10-17.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@implementation Fraction
    /*{  @public int numerator;
         @public int denominator;  }*/

    @synthesize numerator, denominator;
    @synthesize name = _name;

    -(void) print {
        //NSLog (@"\n%i/%i", numerator, denominator); }
        printf("\nThe Numerator = %i - Denomitanor = %i", numerator, denominator); }
/*  -(void) setNumerator: (int) n {
        numerator = n;
    }
    -(void) setDenominator: (int) d {
        denominator = d;
    }
    -(int) numerator { return numerator; }
    -(int) denominator { return denominator; }
 */
    -(double) convertToNum {
        if (denominator != 0)
            return (double) numerator / denominator;
        else
            return NAN;
    }
@end
