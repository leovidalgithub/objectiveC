//  midTermPreparation_2
//
//  Created by english on 2019-10-03.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Class1 : NSObject {
        int val1, val2;
    }
    -(int)add;
    -(float)add:(float)nbr1 and:(int)nbr2;
@end

@implementation Class1
    -(int)add {
        val1 = 23;
        val2 = 56;
        int t = val1 + val2;
        NSLog(@"\nThe Sum #1 : %i + %i = %i\n", val1, val2, t);
        return t;
    }
    -(float)add:(float)nbr1 and:(int)nbr2 {
        float t = nbr1 + nbr2;
        NSLog(@"\nThis other Sum #2 : %.3f + %i = %.3f\n", nbr1, nbr2, t);
        return t;
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

        Class1 *obj1 = [[Class1 alloc] init];
        NSLog(@"\nThe result again = %i\n", [obj1 add]);
        
        [obj1 add:33.5 and:25];
        
        NSLog(@"\nThis is the end!");
    }
    return 0;
}
