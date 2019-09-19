/*
  main.m ClassText
  Created by Leo on 2019-09-19.
*/

#import <Foundation/Foundation.h>

    @interface Car : NSObject {
        float fuelTank;
    }
        -(void)addGas;
        -(void)setFuelTankValue:(float)level;
        -(float)getFuelTankValue;
    @end

    @implementation Car
        -(void) addGas {
            do {
                fuelTank += 16;
                NSLog(@"FuelTank is being filled out now ... %.2f", fuelTank);
            } while (fuelTank < 100);
        }
        -(void)setFuelTankValue:(float)level {
            fuelTank = level;
        }
        -(float)getFuelTankValue {
            return fuelTank;
        }
    @end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *testString;
        testString = [[NSString alloc] init];
        testString = @"\n\nHere's a test string in testString!";
        NSLog(@"\ntestString: %@", testString);

        float currentLevel = 0;    
        
        Car *myCar = [[Car alloc] init];
        [myCar setFuelTankValue: 13.35];
        [myCar addGas];
        currentLevel = [myCar getFuelTankValue];

        NSLog(@"\n\nmyCar FuelTank is %.2f", currentLevel);
    }
    return 0;
}
