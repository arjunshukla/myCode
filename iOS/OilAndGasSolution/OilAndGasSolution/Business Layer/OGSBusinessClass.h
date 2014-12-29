//
//  OGSBusinessClass.h
//  OilAndGasSolution
//

#import <Foundation/Foundation.h>

@interface OGSBusinessClass : NSObject

@property (nonatomic, strong) NSString *userType;
@property (nonatomic, assign) BOOL isLoggedIn;
@property (nonatomic, strong) NSArray *sitesList;

+(OGSBusinessClass *) sharedInstance;

@end
