//
//  OGSContactUsViewController.m
//  OilAndGasSolution
//


#import "OGSContactUsViewController.h"

@implementation OGSContactUsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    regionFlag = 1;
    countryFlag = 0;
    stateFlag = 0;
    cityFlag = 0;
    self.picker.hidden = YES;
    self.txtCityOutlet.hidden = YES;
    self.txtCountryOutlet.hidden = YES;
    self.txtviewAddress.hidden = YES;
    self.txtviewAddress.editable = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)txtRegionAction:(id)sender
{
    arrRegion = [[NSMutableArray alloc]initWithObjects: @"Africa",@"America",@"Asia Pacific",@"Australian Sub-continent",@"Europe",nil];
    self.picker.frame = CGRectMake(25, 109, 241, 216);
    self.picker.hidden = NO;
    [self.picker reloadAllComponents];
    if(![self.txtRegionOutlet.text isEqual:NULL])
    {
        self.txtCountryOutlet.hidden = NO;
    }
}

- (IBAction)txtCountryAction:(id)sender
{
    self.txtCountryOutlet.hidden = NO;
    if([self.txtRegionOutlet.text isEqualToString:@"Africa"])
    {
        arrCountry = [[NSMutableArray alloc]initWithObjects:@"Nigeria",@"South Africa",@"Somalia", nil];
        self.picker.frame = CGRectMake(28, 148, 241, 216);
        self.picker.hidden = NO;
        [self.picker reloadAllComponents];
    }
    else if([self.txtRegionOutlet.text isEqualToString:@"Australian Sub-continent"])
    {
        arrCountry = [[NSMutableArray alloc]initWithObjects:@"Australia",@"New Zealand", nil];
    }
    else if([self.txtRegionOutlet.text isEqualToString:@"Asia Pacific"])
    {
        arrCountry = [[NSMutableArray alloc]initWithObjects:@"India",@"Afghanistan",@"Kuwait",@"Saudi Arabia", nil];
    }
    else if ([self.txtRegionOutlet.text isEqualToString:@"America"])
    {
        arrCountry = [[NSMutableArray alloc]initWithObjects:@"Argentina",@"Canada",@"USA", nil];
    }
    else if([self.txtRegionOutlet.text isEqualToString:@"Europe"])
    {
        arrCountry = [[NSMutableArray alloc]initWithObjects:@"Norway",@"U.K", nil];
    }
    else
    {
        //
    }
    self.picker.frame = CGRectMake(25, 109, 241, 216);
    self.picker.hidden = NO;
    [self.picker reloadAllComponents];
    self.txtCityOutlet.hidden = NO;
}


- (IBAction)txtCityAction:(id)sender
{
    NSLog(@"City");
    if([self.txtCountryOutlet.text isEqualToString:@"Argentina"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Buenos Aires", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Buenos Aires, Argentina\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if([self.txtCountryOutlet.text isEqualToString:@"Nigeria"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Abuja", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\nAbuja, Nigeria\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"South Africa"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Cape Town", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\nCape Town, South Africa\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Somalia"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Mogadishu", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\nMogadishu, Somalia\nPhone no:1234567890 ";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Australia"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Sydney", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\nSydney, Australia\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"New Zealand"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Wellington", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\nWellington, New Zealand\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Canada"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Toronto", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Toronto, Canada\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"USA"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"New York", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n New York, United States of America\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Norway"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Oslo", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Oslo, Norway\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"U.K"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"London", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n London, United Kingdom\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"India"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"New Delhi", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n New Delhi,\nDelhi, India\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Afghanistan"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Kabul", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Kabul, Afghanistan\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Kuwait"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Kuwait City", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Kuwait City, Kuwait\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@"Saudi Arabia"])
    {
        arrCity = [[NSMutableArray alloc]initWithObjects:@"Riyadh", nil];
        self.txtviewAddress.text = @"Oil & Gas Poc Ltd.\nXYZ Street,\n Riyadh, Saudi Arabia\nPhone no:1234567890";
        self.txtviewAddress.hidden = NO;
    }
    else
    {
        // dummy loop
    }
    self.picker.frame = CGRectMake(25, 187, 241, 216);
    self.picker.hidden = NO;
    [self.picker reloadAllComponents];
}

- (IBAction)btnReload:(id)sender
{
    self.txtRegionOutlet.text = @"";
    self.txtRegionOutlet.hidden = NO;
    self.txtCountryOutlet.text = @"";
    self.txtCountryOutlet.hidden = YES;
    self.txtCityOutlet.text = @"";
    self.txtCityOutlet.hidden = YES;
    self.txtviewAddress.hidden = YES;
    self.picker.hidden = YES;
    
    [arrRegion removeAllObjects];
    [arrCountry removeAllObjects];
    [arrCity removeAllObjects];
//    self.txtStateOutlet.text = @"";
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if([self.txtRegionOutlet.text isEqualToString:@""])
    {
        return [arrRegion count];
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@""])
    {
        return [arrCountry count];
    }
    else
    {
        return 1;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if([self.txtRegionOutlet.text isEqualToString:@""])
    {
        return [arrRegion objectAtIndex:row];
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@""])
    {
        return [arrCountry objectAtIndex:row];
    }
    else if ([self.txtCityOutlet.text isEqualToString:@""])
    {
        return [arrCity objectAtIndex:row];
    }
    else
    {
        return @"None";
    }
    
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if([self.txtRegionOutlet.text isEqualToString:@""])
    {
        self.txtRegionOutlet.text = [arrRegion objectAtIndex:row];
    }
    else if ([self.txtCountryOutlet.text isEqualToString:@""])
    {
        self.txtCountryOutlet.text = [arrCountry objectAtIndex:row];
    }
    else if ([self.txtCityOutlet.text isEqualToString:@""])
    {
        self.txtCityOutlet.text = [arrCity objectAtIndex:row];
    }
    
    self.picker.hidden = YES;
}

#pragma mark -
#pragma mark TextField delegate methods


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([self.txtRegionOutlet.text isEqualToString:@""])
    {
        [self txtRegionAction:self];
    }
    else if([self.txtCountryOutlet.text isEqualToString:@""])
    {
        [self txtCountryAction:self];
    }
    else if([self.txtCityOutlet.text isEqualToString:@""])
    {
        [self txtCityAction:self];
    }
    else
    {
        // dummy loop
    }
    
    return NO;
}

@end
