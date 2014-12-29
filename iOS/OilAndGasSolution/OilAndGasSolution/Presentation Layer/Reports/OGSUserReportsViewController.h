//
//  OGSUserReportsViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>

@interface OGSUserReportsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *wellDetailsTable;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)updateData:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *updateDataView;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel1;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel2;
@property (strong, nonatomic) IBOutlet UILabel *updateLabel3;
@property (strong, nonatomic) IBOutlet UISlider *updateSlider1;
@property (strong, nonatomic) IBOutlet UISlider *updateSlider2;
@property (strong, nonatomic) IBOutlet UISlider *updateSlider3;

@end
