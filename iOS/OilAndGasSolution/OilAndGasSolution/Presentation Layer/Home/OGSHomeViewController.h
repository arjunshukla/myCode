//
//  OGSHomeViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>
#import "OGSLoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OGSHomeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,OGSLoginDelegate>
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) IBOutlet UILabel *lblNews;
@property (strong, nonatomic) IBOutlet UIView *newsFlashView;
@property (strong, nonatomic) IBOutlet UIImageView *newsFlashImage;
@property (strong, nonatomic) IBOutlet UILabel *newsFlashHeadline;
- (IBAction)btnNews:(id)sender;
- (IBAction)btnMaps:(id)sender;
- (IBAction)btnContactUs:(id)sender;
- (IBAction)btnRiskMngmnt:(id)sender;
- (IBAction)btnReports:(id)sender;

- (IBAction)newsClicked:(id)sender;
@end
