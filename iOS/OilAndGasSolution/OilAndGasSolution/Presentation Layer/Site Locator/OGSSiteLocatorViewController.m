//
//  OGSSiteLocatorViewController.m
//  OilAndGasSolution
//


#import "OGSSiteLocatorViewController.h"
#import "OGSOilAndGasSites.h"
#import "OGSBusinessClass.h"

#define METERS_PER_MILE 1609.344
@interface OGSSiteLocatorViewController () {
   // NSArray *sitesList;
    UIPopoverController *siteDetailPopOver;
    UIPopoverController *siteListPopOver;
    NSMutableArray *searchedSitesList;
    BOOL isSearched;
    UILabel *noDataMessage;
    UIView *someView;
    NSArray *attributesArray;
    OGSOilAndGasSites *selectedSite;
}

@end

@implementation OGSSiteLocatorViewController
@synthesize locationList,locationMapView;
@synthesize siteDetails;
@synthesize sitesSearchBar,filterByPlaceView,selectedFilter,siteDetailsTable;
@synthesize unfilterBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Site Locator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *siteListBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Sites"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self action:@selector(sitesClicked:)];
    UIBarButtonItem *filterBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Filter"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self action:@selector(filterClicked:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:siteListBarBtn,filterBarBtn, nil];
    selectedFilter.text = @"World";
    
    // Do any additional setup after loading the view from its nib.
}
/*
 -(void)setImages:(id)sender {
 CLLocationCoordinate2D latlng = self.locationMapView.region.center;
 NSLog(@"%f, %f",latlng.latitude,latlng.longitude);
 MKCoordinateSpan span =  self.locationMapView.region.span;
 
 NSLog(@"%f, %f",span.latitudeDelta, span.longitudeDelta);
 }
 */
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    attributesArray = [[NSArray alloc] initWithObjects:@"Well Id", @"Name",/* @"Developed By", @"Country", @"Discovered In", @"Production Started In", @"Abandoned In", @"Current production of oil\n (Barrels/day)",*/ @"Well Status", @"Total Depth (Feet)", @"Latitude", @"Longitude",/* @"", @"", @"", @"", @"",*/ nil];
    
    [self loadMapView];
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    }
    else {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
        self.locationMapView.frame = CGRectMake(10, 75, 740, 800);
        self.locationList.hidden = YES;
    }
    // [self.locationList selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload {
    [self setSiteDetails:nil];
    [super viewDidUnload];
}
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == siteDetailsTable) {
        return 6;
    }
    else {
        if (isSearched) {
            return [searchedSitesList count];
        }
        return [[OGSBusinessClass sharedInstance].sitesList count];
    }
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == siteDetailsTable) {
        return @"Details";
    }
    else{
        if (isSearched) {
            return [NSString stringWithFormat:@"%d number of oil wells found",[searchedSitesList count]];
        }
    }
    return @"";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == siteDetailsTable) {
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
    else {
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.imageView.image = [UIImage imageNamed:@"newsListing_Cell.png"];
        if (indexPath.row%2==0) {
            cell.backgroundColor = [UIColor clearColor];
        }
        OGSOilAndGasSites *site;
        if (isSearched) {
            site = [searchedSitesList objectAtIndex:indexPath.row];
        }
        else {
            site = [[OGSBusinessClass sharedInstance].sitesList objectAtIndex:indexPath.row];
        }
        
        cell.textLabel.text = site.name;
        [cell.textLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0f]];
        cell.textLabel.numberOfLines = 2;
        
        if (indexPath.row%2==0) {
            cell.textLabel.backgroundColor = [UIColor colorWithRed:61.0/255.0 green:115.0/255.0 blue:125.0/255.0 alpha:0.8];
        }
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (tableView == self.locationList) {
        if (isSearched) {
            selectedSite = [searchedSitesList objectAtIndex:indexPath.row];
        }
        else {
            selectedSite = [[OGSBusinessClass sharedInstance].sitesList objectAtIndex:indexPath.row];
        }
        MKCoordinateRegion newRegion;
        newRegion.center.latitude = [selectedSite.latitude doubleValue];
        newRegion.center.longitude = [selectedSite.longitude doubleValue];
        newRegion.span.latitudeDelta = 0.5;
        newRegion.span.longitudeDelta = 0.5;
        [self.locationMapView setRegion:newRegion animated:YES];
        [self showDetails:selectedSite];
        [self.siteDetailsTable reloadData];
        [siteListPopOver dismissPopoverAnimated:YES];
    }
}

-(void)loadMapView {
    //  NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(setImages:) userInfo:nil repeats:YES];
    NSArray *tempSitesList;
    if (isSearched) {
        tempSitesList = [NSArray arrayWithArray:searchedSitesList];
    }
    else {
        tempSitesList = [NSArray arrayWithArray:[OGSBusinessClass sharedInstance].sitesList];
    }
    if ([tempSitesList count] == 0) {
        NSArray* currentAnnotations = [self.locationMapView annotations];
        [self.locationMapView removeAnnotations:currentAnnotations];
        [self.locationMapView setVisibleMapRect:MKMapRectWorld animated:YES];
    }
    else{
        for (int i=0; i<[tempSitesList count]; i++) {
            if (isSearched) {
                double centreLat=0;
                double centreLng=0;
                double latDelta=0;
                double lngDelta=0;
                if ([self.selectedFilter.text isEqualToString:@"Asia-Pacific"]) {
                    centreLat = 18.841762;
                    centreLng = 106.347906;
                    latDelta = 121.464097/2;
                    lngDelta = 147.458212/2;
                }
                else if ([self.selectedFilter.text isEqualToString:@"Americas"]) {
                    centreLat =10.162745;
                    centreLng = -85.463845;
                    latDelta =127.982369/2;
                    lngDelta =156.853710/2;
                }
                else if ([self.selectedFilter.text isEqualToString:@"Europe"]) {
                    centreLat =51.852257;
                    centreLng =22.560121;
                    latDelta =46.935334/2;
                    lngDelta =69.427740/2;
                }
                else if ([self.selectedFilter.text isEqualToString:@"Africa"]) {
                    centreLat = 0.154503;
                    centreLng =16.808321;
                    latDelta =77.190664/2;
                    lngDelta =77.508333/2;
                }
                MKCoordinateRegion newRegion;
                newRegion.center.latitude = centreLat;
                newRegion.center.longitude = centreLng;
                NSArray* currentAnnotations = [self.locationMapView annotations];
                [self.locationMapView removeAnnotations:currentAnnotations];
                [self.locationMapView setShowsUserLocation:YES];
                newRegion.span.latitudeDelta = latDelta;
                newRegion.span.longitudeDelta = lngDelta;
                [self.locationMapView setRegion:newRegion animated:YES];
            }
            else {
                [self.locationMapView setVisibleMapRect:MKMapRectWorld animated:YES];
            }
            NSArray* currentAnnotations = [self.locationMapView annotations];
            [self.locationMapView removeAnnotations:currentAnnotations];
        }
        [self.locationMapView addAnnotations:[NSArray arrayWithArray:tempSitesList]];
    }
    [self.locationMapView reloadInputViews];
    
}
- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString *AnnotationViewID = @"annotationViewID";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.locationMapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    annotationView.pinColor = MKPinAnnotationColorGreen;
    annotationView.canShowCallout = NO;
    annotationView.animatesDrop = YES;
    return annotationView;
}
/*Mapkit delegate funcion which is invoked when we select an annotation*/
- (void)mapView:(MKMapView *)mpView didSelectAnnotationView:(MKAnnotationView *)view {
    //Getting the details of the annotation which is clicked.
    selectedSite = (OGSOilAndGasSites *)view.annotation;
    int index = 0;
    if (isSearched) {
        for (int i = 0; i<[searchedSitesList count]; i++) {
            OGSOilAndGasSites *site = [searchedSitesList objectAtIndex:i];
            if ([selectedSite.name isEqualToString:site.name]) {
                index = i;
            }
        }
    }
    else {
         index = [[selectedSite.wellId substringFromIndex:7] intValue];
    }
   
    [self.locationList selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = [selectedSite.latitude doubleValue];
    newRegion.center.longitude = [selectedSite.longitude doubleValue];
    newRegion.span.latitudeDelta = 0.5;
    newRegion.span.longitudeDelta = 0.5;
    [self.locationMapView setRegion:newRegion animated:YES];
    [self showDetails:selectedSite];
    [self.siteDetailsTable reloadData];
    
}
-(void)showDetails:(OGSOilAndGasSites *)site {
    if (!siteDetailPopOver) {
        UIViewController *detailVC = [[UIViewController alloc] init];
        [detailVC.view addSubview:self.siteDetails];
        siteDetailPopOver = [[UIPopoverController alloc] initWithContentViewController:detailVC];
        [siteDetailPopOver setPopoverContentSize:self.siteDetails.frame.size];
    }
    CGRect popOverRect;
    
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        popOverRect = CGRectMake((self.locationMapView.frame.size.width/2+self.locationMapView.frame.origin.x-10),(self.locationMapView.frame.origin.y + self.locationMapView.frame.size.height/2)-175,self.siteDetails.frame.size.width,self.siteDetails.frame.size.height);
    }
    else {
        popOverRect = CGRectMake((self.locationMapView.frame.size.width/2+self.locationMapView.frame.origin.x-10),(self.locationMapView.frame.origin.y + self.locationMapView.frame.size.height/2)-175,self.siteDetails.frame.size.width,self.siteDetails.frame.size.height);
        
    }
    [siteDetailPopOver presentPopoverFromRect:popOverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    if (UIInterfaceOrientationIsLandscape(fromInterfaceOrientation)) {
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
        self.locationMapView.frame = CGRectMake(10, 75, 740, 800);
        self.locationList.hidden = YES;
    }
    else {
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        if ([siteListPopOver isPopoverVisible]) {
            [siteListPopOver dismissPopoverAnimated:YES];
        }
        siteListPopOver = nil;
        self.locationList.hidden = NO;
        [self.view addSubview:self.locationList];
        [self.view addSubview:self.sitesSearchBar];
        self.locationList.frame = CGRectMake(10, 119, 300, 575);
        self.locationMapView.frame = CGRectMake(312, 75, 695, 575);
        self.sitesSearchBar.frame = CGRectMake(10, 75, 300, 44);
    }
    if (someView) {
        [someView removeFromSuperview];
        someView = nil;
        [self filterClicked:0];
    }
    if ([siteDetailPopOver isPopoverVisible]) {
        [siteDetailPopOver dismissPopoverAnimated:YES];
    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar {
    [self.sitesSearchBar resignFirstResponder];
    [self displaySearchResults:self.sitesSearchBar.text];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] == 0) {
        [self performSelector:@selector(hideKeyboardWithSearchBar:) withObject:self.sitesSearchBar afterDelay:0];
    }
}

- (void)hideKeyboardWithSearchBar:(UISearchBar *)searchBar
{
    
    isSearched = NO;
    searchedSitesList = nil;
    if ([self.locationList isHidden]) {
        self.locationList.hidden = NO;
    }
    if (noDataMessage) {
        [noDataMessage removeFromSuperview];
        noDataMessage = nil;
    }
    [self.locationList reloadData];
    [self loadMapView];
}
-(void)displaySearchResults:(NSString *)searchtext {
    searchedSitesList = [[NSMutableArray alloc] init];
    for (int i =0; i<[[OGSBusinessClass sharedInstance].sitesList count]; i++) {
        OGSOilAndGasSites *site = [[OGSBusinessClass sharedInstance].sitesList objectAtIndex:i];
        NSString *search = [searchtext uppercaseString];
        NSString *name = [site.name uppercaseString];
        NSRange stringRange = [name rangeOfString:search];
        if (stringRange.location != NSNotFound) {
            [searchedSitesList addObject:site];
        }
    }
    isSearched = YES;
    if ([searchedSitesList count] == 0) {
        /*if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
         noDataMessage = [[UILabel alloc] initWithFrame:CGRectMake(55, 100, 200, 100)];
         noDataMessage.text = @"Your search did not match any of the oil fields.";
         noDataMessage.textColor = [UIColor whiteColor];
         [noDataMessage setBackgroundColor:[UIColor clearColor]];
         noDataMessage.numberOfLines = 3;
         [self. addSubview:noDataMessage];
         }
         else {
         noDataMessage = [[UILabel alloc] initWithFrame:CGRectMake(55, self.view.frame.size.height/2-175, 200, 100)];
         noDataMessage.text = @"Your search did not match any of the oil fields.";
         noDataMessage.textColor = [UIColor whiteColor];
         [noDataMessage setBackgroundColor:[UIColor clearColor]];
         noDataMessage.numberOfLines = 3;
         [self.view addSubview:noDataMessage];
         }
         */
        // self.locationList.hidden = YES;
        [self loadMapView];
    }
    else {
        [siteListPopOver dismissPopoverAnimated:YES];
        [self.locationList reloadData];
        [self loadMapView];
    }
    
}
/*
 -(void)shareClicked:(id)sender {
 [self showSharePopOver];
 }
 */
-(void)sitesClicked:(id)sender {
    [self showSitesPopOver];
}
/*
 -(void)showSharePopOver {
 UIViewController *shareViewController = [[UIViewController alloc] init];
 [shareViewController.view addSubview:self.shareView];
 //[newsListViewController.view setFrame:CGRectMake(0, 0, self.headlinesTableView.frame.size.width, self.headlinesTableView.frame.size.height)];
 if(!sharePopOver)
 {
 sharePopOver = [[UIPopoverController alloc] initWithContentViewController:shareViewController];
 [sharePopOver setPopoverContentSize:self.shareView.frame.size];
 }
 self.locationList.hidden = NO;
 [sharePopOver presentPopoverFromBarButtonItem:[self.navigationItem.rightBarButtonItems objectAtIndex:1] permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
 
 }
 */
-(void)showSitesPopOver {
    
    //[newsListViewController.view setFrame:CGRectMake(0, 0, self.headlinesTableView.frame.size.width, self.headlinesTableView.frame.size.height)];
    if(!siteListPopOver)
    {
        UIViewController *sitesListViewController = [[UIViewController alloc] init];
        UIView *sitesListView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 630)];
        self.locationList.frame = CGRectMake(0, 50, 300, 575);
        self.sitesSearchBar.frame = CGRectMake(0, 0, 300, 44);
        [sitesListView addSubview:self.sitesSearchBar];
        [sitesListView addSubview:self.locationList];
        [sitesListViewController.view addSubview:sitesListView];
        siteListPopOver = [[UIPopoverController alloc] initWithContentViewController:sitesListViewController];
        [siteListPopOver setPopoverContentSize:sitesListView.frame.size];
    }
    self.locationList.hidden = NO;
    [siteListPopOver presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}
-(void)filterClicked:(id)sender {
    someView  = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:someView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.view.frame;
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [someView addSubview:btn];
    [someView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5]];
    [someView addSubview:self.filterByPlaceView];
    [someView bringSubviewToFront:self.filterByPlaceView];
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        self.filterByPlaceView.frame = CGRectMake(124, 350, 500, 350);
    }
    else{
        self.filterByPlaceView.frame = CGRectMake(262, 200, 500, 350);
    }
    if (isSearched) {
        self.unfilterBtn.hidden = NO;
    }
    else {
        self.unfilterBtn.hidden = YES;
    }
}
-(void)btnClicked:(id)sender {
    [someView removeFromSuperview];
    someView = nil;
}
- (IBAction)selectContinent:(id)sender {
    [someView removeFromSuperview];
    someView = nil;
    searchedSitesList = [[NSMutableArray alloc] init];
    NSString *selectedFilterText = @"";
    if ([sender tag] == 0) {
        selectedFilterText = @"Asia-Pacific";
    }
    else if ([sender tag] == 1) {
        selectedFilterText = @"Africa";
    }
    else if ([sender tag] == 2) {
        selectedFilterText = @"Europe";
    }
    else {
        selectedFilterText = @"Americas";
    }
    for (int i = 0; i<[[OGSBusinessClass sharedInstance].sitesList count]; i++) {
        OGSOilAndGasSites *site = [[OGSBusinessClass sharedInstance].sitesList objectAtIndex:i];
        if ([selectedFilterText isEqualToString:site.continent]) {
            [searchedSitesList addObject:site];
        }
    }
    isSearched = YES;
    self.selectedFilter.text = selectedFilterText;
    if ([searchedSitesList count] == 0) {
        /*if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
         noDataMessage = [[UILabel alloc] initWithFrame:CGRectMake(55, 100, 200, 100)];
         noDataMessage.text = @"Your search did not match any of the oil fields.";
         noDataMessage.textColor = [UIColor whiteColor];
         [noDataMessage setBackgroundColor:[UIColor clearColor]];
         noDataMessage.numberOfLines = 3;
         [self. addSubview:noDataMessage];
         }
         else {
         noDataMessage = [[UILabel alloc] initWithFrame:CGRectMake(55, self.view.frame.size.height/2-175, 200, 100)];
         noDataMessage.text = @"Your search did not match any of the oil fields.";
         noDataMessage.textColor = [UIColor whiteColor];
         [noDataMessage setBackgroundColor:[UIColor clearColor]];
         noDataMessage.numberOfLines = 3;
         [self.view addSubview:noDataMessage];
         }
         */
        // self.locationList.hidden = YES;
        [self loadMapView];
    }
    else {
        [siteListPopOver dismissPopoverAnimated:YES];
        [self.locationList reloadData];
        [self loadMapView];
    }
}
/*
 -(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
 {
 CGPoint pt = [[touches  anyObject]locationInView:self.locationMapView];
 CLLocationCoordinate2D latLong = [self.locationMapView convertPoint:pt toCoordinateFromView:self.locationMapView];
 //add code here for annotation
 }
 */
- (IBAction)worldSelected:(id)sender {
    isSearched = NO;
    self.sitesSearchBar.text = @"";
    self.selectedFilter.text = @"World";
    [self.locationList reloadData];
    [someView removeFromSuperview];
    someView = nil;
    self.unfilterBtn.hidden = YES;
    [self loadMapView];
}

- (IBAction)facebookShare:(id)sender {
}

- (IBAction)twitterShare:(id)sender {
}

- (IBAction)mailShare:(id)sender {
}
@end
