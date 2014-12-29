//
//  OGSUserReportsViewController.m
//  OilAndGasSolution
//

#import "OGSUserReportsViewController.h"
#import "OGSOilAndGasSites.h"
#import "OGSBusinessClass.h"

@interface OGSUserReportsViewController () {
    NSArray *attributesArray;
    OGSOilAndGasSites *selectedSite;
    UIView *someView;
    BOOL isProductionUpdate;
}

@end

@implementation OGSUserReportsViewController
@synthesize updateDataView,wellDetailsTable,updateLabel1,updateLabel2,updateLabel3,updateSlider1,updateSlider2,updateSlider3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    attributesArray = [[NSArray alloc] initWithObjects:@"Well Id", @"Name",/* @"Developed By", @"Country", @"Discovered In", @"Production Started In", @"Abandoned In", @"Current production of oil\n (Barrels/day)",*/ @"Well Status", @"Total Depth (Feet)", @"Latitude", @"Longitude",/* @"", @"", @"", @"", @"",*/ nil];
    selectedSite = [[OGSBusinessClass sharedInstance].sitesList objectAtIndex:0];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row%2==0) {
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [attributesArray objectAtIndex:indexPath.row];
    [cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
    cell.textLabel.numberOfLines = 2;
    switch (indexPath.row) {
        case 0:
            cell.detailTextLabel.text = selectedSite.wellId;
            break;
        case 1:
            cell.detailTextLabel.text = selectedSite.name;
            break;
        case 2:
            cell.detailTextLabel.text = @"Active";
            break;
        case 3:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",selectedSite.totalDepth];
            break;
        case 4:
            
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",selectedSite.latitude];
            break;
        case 5:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",selectedSite.longitude];
            break;
        default:
            break;
    }
    if (indexPath.row%2==0) {
        cell.textLabel.backgroundColor = [UIColor colorWithRed:61.0/255.0 green:115.0/255.0 blue:125.0/255.0 alpha:0.8];
    }
    return cell;
    
}
- (IBAction)sliderValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    if (slider.tag == 0) {
        if (isProductionUpdate) {
            int depthCovered = (int)(slider.value*[selectedSite.totalDepth intValue]);
            self.updateLabel1.text = [NSString stringWithFormat:@"%d",depthCovered];
        }
        else {
            int oilProduced = (int)(slider.value*[selectedSite.totalDepth intValue]);
            self.updateLabel1.text = [NSString stringWithFormat:@"%d",oilProduced];
        }
    }
    else if (slider.tag == 1) {
        if (isProductionUpdate) {
            int depthCoveredDays = (int)(slider.value*365);
            self.updateLabel2.text = [NSString stringWithFormat:@"%d",depthCoveredDays];
        }
        else {
            int gasProduced = (int)(slider.value*[selectedSite.totalDepth intValue]);
            self.updateLabel2.text = [NSString stringWithFormat:@"%d",gasProduced];
        }
    }
    else {
        int productionDays = (int)(slider.value*365);
        self.updateLabel3.text = [NSString stringWithFormat:@"%d",productionDays];
    }
}

- (IBAction)updateData:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 0) {
        isProductionUpdate = NO;
        self.updateDataView.frame = CGRectMake(50, 100, 700, 500);
        self.updateSlider1.value = (float)[selectedSite.oilProduced intValue]/[selectedSite.totalDepth intValue];
        self.updateSlider2.value = (float)[selectedSite.gasProduced intValue]/[selectedSite.totalDepth intValue];
        self.updateSlider3.value = (float)[selectedSite.productionDays intValue]/365;
        self.updateLabel1.text = [NSString stringWithFormat:@"%@",selectedSite.oilProduced];
        self.updateLabel2.text = [NSString stringWithFormat:@"%@",selectedSite.gasProduced];
        self.updateLabel3.text = [NSString stringWithFormat:@"%@",selectedSite.productionDays];
    }
    else {
        isProductionUpdate = YES;
        self.updateSlider1.value = (float)[selectedSite.depthCovered intValue]/[selectedSite.totalDepth intValue];
        self.updateSlider2.value = (float)[selectedSite.depthCoveredDays intValue]/365;
        self.updateDataView.frame = CGRectMake(50, 100, 700, 350);
        self.updateLabel1.text = [NSString stringWithFormat:@"%@",selectedSite.depthCovered];
        self.updateLabel2.text = [NSString stringWithFormat:@"%@",selectedSite.depthCoveredDays];
         self.updateLabel3.text = @"";
    }
    someView = [[UIView alloc] initWithFrame:self.view.frame];
    [someView setBackgroundColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.3]];
    UIButton *someBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    someBtn.frame= self.view.frame;
    [someBtn addTarget:self action:@selector(doneBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [someView addSubview:someBtn];
    [someView addSubview:self.updateDataView];
    [self.view addSubview:someView];
}
-(void)doneBtnClicked:(UIButton *)sender {
    if (someView) {
        [someView removeFromSuperview];
    }
    if (isProductionUpdate) {
        selectedSite.depthCovered = [NSNumber numberWithInt:[updateLabel1.text intValue]];
        selectedSite.depthCoveredDays = [NSNumber numberWithInt:[updateLabel2.text intValue]];
    }
    else {
        selectedSite.oilProduced = [NSNumber numberWithInt:[updateLabel1.text intValue]];
        selectedSite.gasProduced = [NSNumber numberWithInt:[updateLabel2.text intValue]];
        selectedSite.depthCoveredDays = [NSNumber numberWithInt:[updateLabel2.text intValue]];
    }
    [self updateWellData:selectedSite];
}
-(void)updateWellData:(OGSOilAndGasSites *)site {
    NSMutableArray *replacementSites = [NSMutableArray arrayWithArray:[OGSBusinessClass sharedInstance].sitesList];
    [replacementSites replaceObjectAtIndex:0 withObject:site];
    [OGSBusinessClass sharedInstance].sitesList = [[NSArray alloc] initWithArray:replacementSites];
    [[NSUserDefaults standardUserDefaults] setObject:[OGSBusinessClass sharedInstance].sitesList forKey:@"sitesList"];
}

@end
