//
//  OGSSecondGraphData.m
//  OilAndGasSolution
//
//  Created by Arjun on 29/08/13.


#import "OGSSecondGraphData.h"
#import "OGSGraphConstants.h"

@implementation OGSSecondGraphData

+ (OGSSecondGraphData *)sharedInstance {
    static OGSSecondGraphData *sharedInstance;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (NSArray *)tickerSymbols {
    static NSArray *symbols = nil;
    if (!symbols) {
        symbols = [NSArray arrayWithObjects:
                   @"NOBL",
                   nil];
    }
    return symbols;
}

- (NSArray *)datesInWeek {
    static NSArray *dates = nil;
    if (!dates) {
        dates = [NSArray arrayWithObjects:
                 @"4/23",
                 @"4/24",
                 @"4/25",
                 @"4/26",
                 @"4/27",
                 @"4/28",
                 @"4/29",
                 nil];
    }
    return dates;
}

- (NSArray *)weeklyPrices:(NSString *)tickerSymbol {
    if ([CPDTickerSymbolNOBL isEqualToString:[tickerSymbol uppercaseString]] == YES) {
        return [self weeklyNoblPrices];
    }
    return [NSArray array];
}

- (NSArray *)weeklyNoblPrices {
    static NSArray *prices = nil;
    if (!prices) {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:450.70],
                  [NSDecimalNumber numberWithFloat:320.28],
                  [NSDecimalNumber numberWithFloat:236.00],
                  [NSDecimalNumber numberWithFloat:130.70],
                  [NSDecimalNumber numberWithFloat:590.00],
                  [NSDecimalNumber numberWithFloat:550.00],
                  [NSDecimalNumber numberWithFloat:440.00],
                  nil];
    }
    return prices;
}

@end
