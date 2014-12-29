//
//  OGSLoginViewController.h
//  OilAndGasSolution
//


#import <UIKit/UIKit.h>

@protocol OGSLoginDelegate;

@interface OGSLoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, unsafe_unretained) id<OGSLoginDelegate> loginDelegate;
@property (strong, nonatomic) IBOutlet UIScrollView *loginScroll;

- (IBAction)loginBtnClicked:(id)sender;
- (IBAction)cancelBtnClicked:(id)sender;

@end

@protocol OGSLoginDelegate <NSObject>

-(void)loggedInStatus;

@end
