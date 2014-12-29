//
//  OGSRiskVIewIncidentViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>

@interface OGSRiskVIewIncidentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *viewIncidentsView;
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;

@property (strong, nonatomic) IBOutlet UITableView *headlinesTableView;

@end
