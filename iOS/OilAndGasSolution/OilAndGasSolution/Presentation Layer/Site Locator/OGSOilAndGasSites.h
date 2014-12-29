//
//  OGSOilAndGasSites.h
//  OilAndGasSolution
//


#import <MapKit/MapKit.h>

@interface OGSOilAndGasSites : MKAnnotationView {
    NSString *address;
    NSString *name;
    NSString *phoneNumber;
    NSNumber *latitude;
    NSNumber *longitude;
    NSString *continent;
    NSString *country;
    CLLocationCoordinate2D coordinate;
    NSString *discoveredYear;
    NSString *abandonedYear;
    NSString *siteDeveloper;
    NSString *numberOfBarrelsProduced;
    NSString *productionStartYear;
    NSString *wellId;
    NSNumber *totalDepth;
    NSNumber *activityHours;
    NSNumber *depthCovered;
    NSNumber *depthCoveredDays;
    NSNumber *oilProduced;
    NSNumber *gasProduced;
    NSNumber *productionDays;
}

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *continent;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *productionStartYear;
@property (nonatomic, strong) NSString *discoveredYear;
@property (nonatomic, strong) NSString *abandonedYear;
@property (nonatomic, strong) NSString *siteDeveloper;
@property (nonatomic, strong) NSString *numberOfBarrelsProduced;
@property (nonatomic, strong) NSString *wellId;
@property (nonatomic, strong) NSNumber *totalDepth;
@property (nonatomic, strong) NSNumber *activityHours;
@property (nonatomic, strong) NSNumber *depthCovered;
@property (nonatomic, strong) NSNumber *depthCoveredDays;
@property (nonatomic, strong) NSNumber *oilProduced;
@property (nonatomic, strong) NSNumber *gasProduced;
@property (nonatomic, strong) NSNumber *productionDays;

@end
