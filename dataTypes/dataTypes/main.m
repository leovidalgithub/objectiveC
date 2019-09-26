/*
  main.m dataTypes

  Created by english on 2019-09-26.
  Copyright © 2019 english. All rights reserved.
*/

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
    -(void) Print;
@end

@implementation MyClass
    -(void) Print {
        NSLog(@"\n\nThis is Print method from MyClass Class!");
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);

        int myPrimitive1 = 1;
        long myPrimitive2 = 234554664565;
        NSLog(@"\nint variable = %d and long = %ld", myPrimitive1, myPrimitive2);
        
        NSNumber *theLetterZNumber = @'Z';
        char theLetterZ = [theLetterZNumber charValue];
        NSLog(@"\ntheLetter char = %c", theLetterZ);
        
        MyClass *myObject1 = nil; // Strong typing
        id myObject2 = nil; // Weak typing
        myObject2 = @"I'm a String now";
        NSLog(@"\nStrong and Weak Typing variables myObject1 = %@ and myObject2 = %@", myObject1, [myObject2 description]);
        
        NSString *worldString = @"This is a normal String NSString";
        NSLog(@"\nNSString variable = %@!", worldString);
        worldString = @"New string content";
        NSLog(@"NSString new content = %@!", worldString);

        NSMutableString *mutableString = [NSMutableString stringWithString:@"MutableString"];
        [mutableString appendString:@" ...this string was appended"];
        NSLog(@"\n%@", mutableString);
        
        MyClass *myObje = [[MyClass alloc] init];
        [myObje Print];
        NSLog(@"\nHERE you got myObject1 = %@ / myObject2 = %@ / myObje memory address = %@", myObject1, myObject2, myObje);
        
        NSNumber *theletterZNumber = @'Z';
        char theLetterZ2 = [theletterZNumber charValue];
        NSLog(@"\ntheletterZNumber = %@", theletterZNumber);

        NSLog(@"\n\nThis is the End!");
    }
    return 0;
}
