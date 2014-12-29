//
//  OGSRiskManagementHomeViewController.h
//  OilAndGasSolution
//
//  Created by Nithin_abraham on 26/08/13.


#import <UIKit/UIKit.h>

@interface OGSRiskManagementHomeViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *reportIncView;
@property (strong, nonatomic) IBOutlet UITextField *incidentTypeTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;
@property (strong, nonatomic) IBOutlet UITextField *welltypeTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerIncidentType;
@property (strong, nonatomic) IBOutlet UILabel *lblRiskTitle;

@property (strong, nonatomic) IBOutlet UIView *viewPicker;
- (IBAction)btnPicker:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *datetimeTextField;
@property (nonatomic,retain)NSMutableArray *reportIncidentArray;
@property (nonatomic,retain)NSMutableArray *wellNamesArray;
@property (strong, nonatomic) IBOutlet UILabel *pickerViewHeading;
@property (strong, nonatomic) IBOutlet UILabel *wellType;
@property (strong, nonatomic) IBOutlet UITextField *wellNameTextField;
@property (strong, nonatomic) IBOutlet UIView *safetyMapsView;
@property (strong, nonatomic) IBOutlet UIView *safetyMeasuresView;
@property (strong, nonatomic) IBOutlet UITableView *headlinesTableView;
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (strong, nonatomic) IBOutlet UITextField *mapLocationTextField;
@property (strong, nonatomic) IBOutlet UITextField *mapTypeTextField;
@property (strong,nonatomic) UIImageView *mapsImage;

- (IBAction)btnDiscard:(id)sender;

@end
