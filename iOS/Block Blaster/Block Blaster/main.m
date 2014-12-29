//
//  main.m
//  Block Blaster
//
//  Created by Arjun on 04/07/13.
//  Copyright (c) 2013 Arjun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        
        int returnVal;
        
        @try {
            
            returnVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
            
        }
        
        @catch (NSException *exp) {
            
            NSLog(@"******Exception description************: %@", exp.description);
            
            NSLog(@"*****Stack trace for the exception********: %@", [exp callStackSymbols]);
            
            NSLog(@"****REASON*********: %@", [exp reason]);
            
            NSLog(@"***USER INFO*******: %@", [exp userInfo]);
            
            
            
        }
        
        @finally {
            
            return returnVal;
            
        }
        
        
        
    }
    
    
    
}