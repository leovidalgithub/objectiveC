//
//  utilities.h
//  finalProject_MacOS
//
//  Created by Leonardo on 2019-11-16.
//  Copyright © 2019 Leonardo. All rights reserved.
//

#ifndef utilities_h
#define utilities_h

@interface Utilities : NSObject
    +(void)clearScreen;
    +(void)terminalPristine;
    +(void)displayTitle:(NSString *)_charStyle :(NSString *)_title :(BOOL)_useTabs;
    +(NSString *)giveMeFullPath:(NSString *)_fileName;
    +(NSArray *)getFileContent:(NSString *)_fileName;
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content;
    +(void)removeObjectfromArray:(NSMutableArray *)_objectArray :(id)_obj;
    +(void)pressAnyKey;
    +(NSString *)getRandomStringCode:(int)_len;
    +(NSString *)getDateFormatter:(NSDate *)_date;
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
    +(NSString *)giveMeFullPath:(NSString *)_fileName {
        NSFileManager *filemgr = [NSFileManager defaultManager];
        return [NSString stringWithFormat: @"%@/%@", [filemgr currentDirectoryPath], _fileName];
    }
    +(NSArray *)getFileContent:(NSString *)_fileName {
        NSFileManager *filemgr = [NSFileManager defaultManager];
        NSString *fullPath = [Utilities giveMeFullPath:_fileName];
        if ([filemgr fileExistsAtPath: fullPath] == NO) {
            [Utilities displayTitle:@"+" :_fileName :YES];
            NSLog(@"\nSorry! But that file could not be found.\nMake sure this file is located on DeriveData folder according to the Project instructions.\n\n");
            exit(0);
        }
        NSError *error = nil;
        NSString *allContent = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:&error];
        NSArray *contentArray = [allContent componentsSeparatedByString:@"\n"];
        return contentArray;
    }
    +(void)saveFileContent:(NSString *)_fileName :(NSString *)_content {
        NSString *fullPath = [Utilities giveMeFullPath:_fileName];
        [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil attributes:nil];
        [_content writeToFile:fullPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    +(void)removeObjectfromArray:(NSMutableArray *)_objectArray :(id)_obj {
        [_objectArray removeObject:_obj];
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
    +(NSString *)getDateFormatter:(NSDate *)_date {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"MMM dd yyyy / HH:MM"];
        return [dateFormatter stringFromDate:_date];
    }
@end

#endif /* utilities_h */
