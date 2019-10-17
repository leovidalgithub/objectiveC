//  <after midTermExam>
//  main.m  Fraction
//
//  Created by english on 2019-10-17.
//

#import <Foundation/Foundation.h> // The Fraction class
#import "Fraction.h"

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...) {}
#endif

int main (int argc, char * argv[]) {
    @autoreleasepool {
        
        Fraction *myFraction = [[Fraction alloc] init];
        
        // set fraction to 1/3 using the dot operator
        myFraction.numerator   = 214;
        myFraction.denominator = 35;

        // display the fraction's numerator and denominator
        NSLog (@"\n\nThe numerator is %i, and the denominator is %i", myFraction.numerator, myFraction.denominator);
        [myFraction print];
        NSLog (@"\n%i/%i = %.2f", myFraction.numerator, myFraction.denominator, [myFraction convertToNum]);
        
        myFraction.name = @"Hola a todos! Soy una Property";
        NSLog(@"\n\n%@", myFraction.name);

    }
    return 0;
}
