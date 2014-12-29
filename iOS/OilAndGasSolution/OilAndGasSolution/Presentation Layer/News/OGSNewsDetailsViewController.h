//
//  OGSNewsDetailsViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>
/*#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>*/

@interface OGSNewsDetailsViewController : UIViewController /*<MFMailComposeViewControllerDelegate>*/
@property (strong, nonatomic) IBOutlet UILabel *headerLbl;
@property (strong, nonatomic) IBOutlet UITextView *newsDetailsTextView;
@property (strong, nonatomic) NSString *headerLblText;
@property (strong, nonatomic) IBOutlet UIButton *shareBtn;
@property (nonatomic) int index;
- (IBAction)shareBtnClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *sharePopUp;
- (IBAction)facebookShare:(id)sender;
- (IBAction)emailShare:(id)sender;

- (IBAction)twitterShare:(id)sender;

@end
