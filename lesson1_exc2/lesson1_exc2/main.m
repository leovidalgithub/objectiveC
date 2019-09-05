//
//  main.m
//  lesson1_exc2
//
//  Created by english on 2019-09-05.
//  Copyright © 2019 english. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int i;
        i = 10;
        NSLog (@"Testing...");
        NSLog (@".... %i", i);
        NSLog (@"...  %i", i + 1);
        NSLog (@"..   %d", i * 2);
        NSLog (@"..   %f", (float)i / 3);
        NSLog (@"..   %.2f", (float)i / 3);

    }
    return 0;
}

/* OUTPUT
            2019-09-05 16:29:06.302666-0400 lesson1_exc2[20095:695304] Testing...
            2019-09-05 16:29:06.302868-0400 lesson1_exc2[20095:695304] .... 10
            2019-09-05 16:29:06.302875-0400 lesson1_exc2[20095:695304] ...  11
            2019-09-05 16:29:06.302880-0400 lesson1_exc2[20095:695304] ..   20
            2019-09-05 16:29:06.302884-0400 lesson1_exc2[20095:695304] ..   3.333333
            2019-09-05 16:29:06.302890-0400 lesson1_exc2[20095:695304] ..   3.33
            Program ended with exit code: 0
*/
