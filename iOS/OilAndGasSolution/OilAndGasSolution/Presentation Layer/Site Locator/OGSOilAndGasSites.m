//
//  OGSOilAndGasSites.m
//  OilAndGasSolution


#import "OGSOilAndGasSites.h"

@implementation OGSOilAndGasSites

@synthesize longitude, latitude,address,name,phoneNumber,continent,country,numberOfBarrelsProduced,siteDeveloper,discoveredYear,productionStartYear,abandonedYear,wellId,totalDepth,depthCovered,depthCoveredDays,oilProduced,gasProduced,productionDays,activityHours;

- (CLLocationCoordinate2D)coordinate
{
    coordinate.latitude = [self.latitude doubleValue];
    coordinate.longitude = [self.longitude doubleValue];
    return coordinate;
}

-(NSString *)title
{
    return name;
}

-(NSString *)subtitle
{
    return address;
}

@end
