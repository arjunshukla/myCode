//
//  OGSGraphData.h
//  OilAndGasSolution
//
//  Created by Arjun on 29/08/13.
//  
#import <Foundation/Foundation.h>

@interface OGSGraphData : NSObject
+ (OGSGraphData *)sharedInstance;
- (NSArray *)tickerSymbols;
- (NSArray *)datesInWeek;
- (NSArray *)weeklyPrices:(NSString *)tickerSymbol;

@end
