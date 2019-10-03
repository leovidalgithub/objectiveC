//  midTermPreparation 1
//
//  Created by english on 2019-10-03.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a,b,c;
        double t;
        a = 13;
        b = 2;
        c = 5;
        if (b == 0 || c == 0) {
            NSLog(@"\nDivison by zero");
        } else {
            t = ((float)a / (float)b) / (float)c;
            NSLog(@"\n%.2f = %d / %d / %d", t,a,b,c);
        }
    }
    return 0;
}
