//
//  OGSContactUsViewController.h
//  OilAndGasSolution


#import <UIKit/UIKit.h>

@interface OGSContactUsViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    int regionFlag;
    int countryFlag;
    int stateFlag;
    int cityFlag;
    NSMutableArray *arrRegion;
    NSMutableArray *arrCountry;
    NSMutableArray *arrCity;
}
@property (strong, nonatomic) IBOutlet UITextField *txtRegionOutlet;
@property (strong, nonatomic) IBOutlet UITextField *txtCountryOutlet;
@property (strong, nonatomic) IBOutlet UITextField *txtCityOutlet;

- (IBAction)txtRegionAction:(id)sender;
- (IBAction)txtCountryAction:(id)sender;
- (IBAction)txtCityAction:(id)sender;
- (IBAction)btnReload:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *txtviewAddress;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end
