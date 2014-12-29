//
//  OGSSecondGraphData.h
//  OilAndGasSolution
//
//  Created by Arjun on 29/08/13.


#import <Foundation/Foundation.h>

@interface OGSSecondGraphData : NSObject

+ (OGSSecondGraphData *)sharedInstance;
- (NSArray *)tickerSymbols;
- (NSArray *)datesInWeek;
- (NSArray *)weeklyPrices:(NSString *)tickerSymbol;

@end
