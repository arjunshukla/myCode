//
//  OGSBusinessClass.m
//  OilAndGasSolution


#import "OGSBusinessClass.h"

static OGSBusinessClass *singletonInstance = nil;

@implementation OGSBusinessClass
@synthesize userType;
@synthesize isLoggedIn;
@synthesize sitesList;

+(OGSBusinessClass *)sharedInstance {
    @synchronized(self) {
		if (singletonInstance == nil) {
			singletonInstance = [[OGSBusinessClass alloc] init];
		}
        return singletonInstance;
    }
}
@end
