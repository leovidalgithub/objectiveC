//  Fraction.h
//
//  Created by english on 2019-10-17.
//

#ifndef Fraction_h
#define Fraction_h

@interface Fraction : NSObject

    @property (copy) NSString *name;
    @property int numerator, denominator;

    -(void)   print;
//  -(void)   setNumerator: (int) n;
//  -(void) setDenominator: (int) d;
//  -(int)    numerator;
//  -(int)    denominator;
    -(double) convertToNum;
@end

#endif /* Fraction_h */
