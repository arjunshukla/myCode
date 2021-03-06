//
//  OGSLoginViewController.m
//  OilAndGasSolution
//


#import "OGSLoginViewController.h"
#import "OGSHomeViewController.h"
#import "OGSBusinessClass.h"

@interface OGSLoginViewController () {
    NSTimer *imageTimer;
    int flag;
}

@end

@implementation OGSLoginViewController
@synthesize userNameTextField;
@synthesize passwordTextField;
@synthesize imageView,loginScroll;
@synthesize loginDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    flag = 0;
    [self setImages:0];
    imageTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(setImages:) userInfo:nil repeats:YES];
}
-(void)viewWillDisappear:(BOOL)animated {
    [imageTimer invalidate];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClicked:(id)sender {
    if (userNameTextField.text.length == 0) {
        [self showAlert:@"username"];
    }
    else if (passwordTextField.text.length == 0) {
        [self showAlert:@"password"];
    }
    else {
        if ((![userNameTextField.text isEqualToString:@"admin"] && ![passwordTextField.text isEqualToString:@"password"]) || (![userNameTextField.text isEqualToString:@"user"] && ![passwordTextField.text isEqualToString:@"password"])) {
            [self showAlert:@"incorrect credentials"];
        }
        else {
            [OGSBusinessClass sharedInstance].isLoggedIn = YES;
            [OGSBusinessClass sharedInstance].userType = userNameTextField.text;
            [self dismissViewControllerAnimated:YES completion:^{
                [self.loginDelegate loggedInStatus];
            }];
        }
    }
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    if (UIInterfaceOrientationIsLandscape(fromInterfaceOrientation)) {
        flag = 0;
        imageView.frame = CGRectMake(180, 300, 400, 200);
    }
    else {
        imageView.frame = CGRectMake(300, 300, 400, 200);
        flag = 0;
    }
}
-(void)setImages:(id)sender{
    NSString *imageName;
    if (flag == 0) {
        imageName = @"Login1.png";
        flag++;
    }
    else if (flag == 1) {
        imageName = @"Login2.png";
        flag++;
    }
    else if (flag == 1) {
        imageName = @"Login3.png";
        flag++;
    }
    else {
        imageName = @"Login4.png";
        flag = 0;
    }
    [imageView setImage:[UIImage imageNamed:imageName]];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        self.loginScroll.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
        [self.loginScroll setScrollEnabled:YES];
        [self.loginScroll setContentOffset:CGPointMake(0, textField.frame.origin.y-350) animated:YES];
    }
    else {
        [self.loginScroll setScrollEnabled:NO];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        [self.loginScroll setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)cancelBtnClicked:(id)sender {
    userNameTextField.text = @"";
    passwordTextField.text = @"";
    [OGSBusinessClass sharedInstance].isLoggedIn = NO;
    [self dismissViewControllerAnimated:YES completion:^{
        [self.loginDelegate loggedInStatus];
    }];
}
-(void)showAlert:(NSString *)reason {
    NSString *message=@"";
    if ([reason isEqualToString:@"username"]) {
        message = @"Please provide a Username";
    }
    else if ([reason isEqualToString:@"password"]) {
        message = @"Please provide a password";
    }
    else if ([reason isEqualToString:@"incorrect credentials"]) {
        message = @"You have entered wrong credentials. Please enter the correct details";
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
@end
