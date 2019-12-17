//
//  utilities.h
//  finalExam_MacOS
//
//  Created by Leonardo Rodriguez Vidal - 1811229
//  Dec 17th 2019
//

#ifndef utilities_h
#define utilities_h

@interface Utilities : NSObject
    +(void)clearScreen;
    +(void)terminalPristine;
    +(void)displayTitle:(NSString *)_charStyle :(NSString *)_title :(BOOL)_useTabs;
    +(void)pressAnyKey;
    +(NSString *)getRandomStringCode:(int)_len;
@end

@implementation Utilities
    +(void)terminalPristine {
        //this is to reduce info line output in the Terminal
    #define NSLog(STRING, ...) printf("%s\n", [[NSString stringWithFormat:STRING, ##__VA_ARGS__] UTF8String]);
    }
    +(void)clearScreen {
        for (int i=0; i < 60; i++) {
            NSLog(@"\n");
            [NSThread sleepForTimeInterval:.01];
        }
    }
    +(void)displayTitle:(NSString *)_charStyle :(NSString *)_title :(BOOL)_useTabs {
        NSString *tabs = _useTabs ? @"\t\t" : @"";
        NSString *tripleCharStyle = [@"" stringByPaddingToLength:3 withString:_charStyle startingAtIndex:0];
        NSString *titleStyled     = [NSString stringWithFormat:@"%@ %@ %@", tripleCharStyle, _title, tripleCharStyle];
        NSString *completeLine    = [@"" stringByPaddingToLength:[titleStyled length] withString:_charStyle startingAtIndex:0];
        NSLog(@"\n%@%@", tabs, completeLine);
        NSLog(@"%@%@", tabs, titleStyled);
        NSLog(@"%@%@\n", tabs, completeLine);
    }
    +(void)pressAnyKey {
        NSLog(@"\n\t\t\t---------- ----------- ----------");
        NSLog(@"\t\t\tPress <ENTER> key to continue ...");
        NSLog(@"\t\t\t---------- ----------- ----------");
        getchar(); // wait for ENTER
        getchar(); // wait for ENTER
        [Utilities clearScreen];
    }
    +(NSString *)getRandomStringCode:(int)_len {
        NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        NSMutableString *randomString = [NSMutableString stringWithCapacity:_len];
        for (int i=0; i<_len; i++) {
            [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length])]];
        }
        return randomString;
    }
@end

#endif /* utilities_h */
