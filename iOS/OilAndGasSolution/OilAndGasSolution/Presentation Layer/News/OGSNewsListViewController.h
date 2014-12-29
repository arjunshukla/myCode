//
//  OGSNewsListViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>

@interface OGSNewsListViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *headlinesTableView;
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (strong, nonatomic) IBOutlet UIView *shareView;
@property (strong, nonatomic) NSNumber *selectedNewsId;
- (IBAction)facebookShare:(id)sender;
- (IBAction)twitterShare:(id)sender;
- (IBAction)mailShare:(id)sender;

@end
