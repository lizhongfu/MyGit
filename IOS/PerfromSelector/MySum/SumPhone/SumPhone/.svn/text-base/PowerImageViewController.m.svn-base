//
//  PowerImageViewController.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PowerImageViewController.h"

@implementation ProcessingImageView
@synthesize delegate;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([(NSObject*)delegate respondsToSelector:@selector(tapOnCallback:)])
	{
		[delegate tapOnCallback:self];
	}
}
@end

@implementation PowerImageViewController

@synthesize navBar;
@synthesize bottomScroll;
@synthesize effectSelect;
@synthesize translateSelect;
@synthesize effectSelectData;
@synthesize translateSelectData;
@synthesize imagePickerController;
@synthesize currentImage;
@synthesize imageV;

+ (NSString *)friendlyName {
    return @"UIImage强大总结";
}

- (void) dealloc {
    [navBar release];
    [bottomScroll release];
    [effectSelect release];
    [translateSelect release];
    [effectSelectData release];
    [translateSelectData release];
    [imagePickerController release];
    [currentImage release];
    [imageV release];
    
    [super dealloc];
}

- (id) init {
    
    if (self = [super init]) {
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    show = YES;
    
    CGRect mainScreenFrame = [UIScreen mainScreen].bounds;
    self.imageV = [[[ProcessingImageView alloc] initWithFrame:mainScreenFrame] autorelease];
    self.imageV.userInteractionEnabled = YES;
    self.imageV.contentMode = UIViewContentModeScaleAspectFit;  
    self.imageV.delegate = self;
    [self.view addSubview:self.imageV];
    
    [self hideViews];
    
    [self initNarBar];
    
    [self initBottomScrollView];
 
}

///////////////////////////  初始化 ScrollView ////////////////////////////////////

- (void) initBottomScrollView {
    CGRect mainScreenFrame = [UIScreen mainScreen].bounds;
    float wide = mainScreenFrame.size.width;
    float height = mainScreenFrame.size.height;
    float scrollHeight = BottomBarHeight;
    
    self.bottomScroll = [[[ZFScrollView alloc] initWithFrame:CGRectMake(0, height-scrollHeight, wide, scrollHeight)
                                                         contentSize:CGSizeMake(wide, scrollHeight) 
                                                             bounces:YES 
                                                       pagingEnabled:NO 
                                                      indicatorStyle:UIScrollViewIndicatorStyleBlack 
                                                delaysContentTouches:YES 
                                             canCancelContentTouches:YES] autorelease];
    
    bottomScroll.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomScroll];
    
//    table数据源
    NSArray *tableData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PowerImage-info" ofType:@"plist"]];
    
    for (int i=0; i<[tableData count]; i++) {
        if (i == 0) {
            self.effectSelectData = [NSMutableArray arrayWithArray:[tableData objectAtIndex:i]];
        } else {
            self.translateSelectData = [NSMutableArray arrayWithArray:[tableData objectAtIndex:i]];
        }
    }
    
    
    self.effectSelect = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MainScreenFrame.size.width/2-1, BottomBarHeight) style:UITableViewStylePlain];
    self.effectSelect.tag = EffectSelectTag;
    self.effectSelect.backgroundColor = [UIColor blackColor];
    self.effectSelect.showsVerticalScrollIndicator = NO;
    self.effectSelect.delegate = self;
    self.effectSelect.dataSource = self;
    
    self.translateSelect = [[UITableView alloc] initWithFrame:CGRectMake(MainScreenFrame.size.width/2+1, 0, MainScreenFrame.size.width/2-1, BottomBarHeight) style:UITableViewStylePlain];
    self.translateSelect.tag = TranslateSelect;
    self.translateSelect.backgroundColor = [UIColor blackColor];
    self.translateSelect.showsVerticalScrollIndicator = NO;
    self.translateSelect.delegate = self;
    self.translateSelect.dataSource = self;
    
    [self.bottomScroll addSubview:self.effectSelect];
    [self.bottomScroll addSubview:self.translateSelect];
}

/////////////////////////// UITableViewDataSource  ////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == EffectSelectTag) {
        return [self.effectSelectData count];
    }
    
    return [self.translateSelectData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *effectIdentifier = @"effect";  
    static NSString *translateIdentifier = @"translate"; 
    
    UITableViewCell *cell = nil;
    
    NSString *cellReuseMark = nil;
    NSString *cellText = nil;
    
    if (tableView.tag == EffectSelectTag) {
        
        cellReuseMark = effectIdentifier;
        cellText = [self.effectSelectData objectAtIndex:indexPath.row];
    } else if (tableView.tag == TranslateSelect) {
        
        cellReuseMark = translateIdentifier;
        cellText = [self.translateSelectData objectAtIndex:indexPath.row];
    }
    
    cell = [tableView dequeueReusableCellWithIdentifier:  
            cellReuseMark]; 
    
    if (cell == nil) {    
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  
                                       reuseIdentifier:cellReuseMark] autorelease];  
    } 

    cell.textLabel.text = cellText;  
    cell.textLabel.textColor = [UIColor redColor]; 
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    return cell; 
}

/////////////////////////// UITableViewDelegate  ////////////////////////////////////

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return BottomBarHeight/2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView.tag == EffectSelectTag) {
        [self effectChange:indexPath.row];
    } else {
        [self translate:indexPath.row];
    }
}

///////////////////////////  初始化 navBar  ////////////////////////////////////

- (void) initNarBar {
    
    self.navBar = [[ZFNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44) 
                                                   title:@"Photo Tool" 
                                      rightBarButtonItem:@"Save" 
                                           rightBtAction:@selector(save:)
                                       leftBarButtonItem:@"Start" 
                                            leftBtAction:@selector(begin:)
                                         ButtonItemStyle:UIBarButtonItemStyleBordered
                                                  target:self];
    [self.view addSubview:self.navBar];
}

///////////////////////////  ZFNavigationBarItem start响应方法  ////////////////////////////////////

-(void)begin:(id)sender
{
	UIActionSheet *ac = nil;
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		ac = [[UIActionSheet alloc] initWithTitle:@"-Photo Source-" 
                                         delegate:self 
                                cancelButtonTitle:@"Cancel" 
                           destructiveButtonTitle:nil 
                                otherButtonTitles:@"Photo Lib",@"Camera",nil];
	}
	else 
	{
		ac = [[UIActionSheet alloc] initWithTitle:@"-Photo Source-" 
                                         delegate:self 
                                cancelButtonTitle:@"Cancel" 
                           destructiveButtonTitle:nil 
                                otherButtonTitles:@"Photo Lib",nil];
	}
	ac.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	[ac showInView:self.view];
	[ac release];
}

///////////////////////////  UIActionSheet 委托方法 ////////////////////////////////////

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	self.imagePickerController = [[UIImagePickerController alloc] init];
	self.imagePickerController.delegate = self;
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		if(buttonIndex == 0)
		{
			imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			[self presentModalViewController:self.imagePickerController animated:YES];
		}
		if(buttonIndex == 1) 
		{
			UIView *cameraView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
			cameraView.backgroundColor = [UIColor clearColor];
			cameraView.autoresizesSubviews = YES;
			
			UIView *bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0.0, cameraView.frame.size.height-53.0, cameraView.frame.size.width, 53.0)];
			bottomBar.backgroundColor = [UIColor whiteColor];
			bottomBar.autoresizesSubviews = YES;
			
			UIButton *snapBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			[snapBtn setTitle:@"Snap" forState:UIControlStateNormal];
			snapBtn.frame = CGRectMake(5.0, 9.0, 60.0, 33.0);
			[snapBtn addTarget:self action:@selector(snap:) forControlEvents:UIControlEventTouchUpInside];
			
			UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
			[closeBtn setTitle:@"Cancel" forState:UIControlStateNormal];
			closeBtn.frame = CGRectMake(bottomBar.frame.size.width-60.0-5.0, 9.0, 60.0, 33.0);
			[closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
			
			[bottomBar addSubview:snapBtn];
			[bottomBar addSubview:closeBtn];
			
			[cameraView addSubview:bottomBar];
			[bottomBar release];
			
			imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
			imagePickerController.showsCameraControls = NO;
			imagePickerController.cameraOverlayView = cameraView;
			[cameraView release];
			[self presentModalViewController:imagePickerController animated:YES];
		}
	}
	else 
	{
		if(buttonIndex == 0)
		{
			imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
			[self presentModalViewController:imagePickerController animated:YES];
		}
	}
}

-(void)effectChange:(int) tag
{
	int effectTag = tag;
	if(currentImage)
	{
		UIImage *outImage = nil;
		if(effectTag == 0)
		{
			self.imageV.image = currentImage;
		}
		
		if(effectTag == 1)
		{
			outImage = [ImageUtil blackWhite:currentImage];
		}
		if(effectTag == 2)
		{
			outImage = [ImageUtil cartoon:currentImage];
		}
		if(effectTag == 3)
		{
			outImage = [ImageUtil bopo:currentImage];
		}
		if(effectTag == 4)
		{
			outImage = [ImageUtil memory:currentImage];
		}
		if(effectTag == 5)
		{
			outImage = [ImageUtil scanLine:currentImage];
		}
        if(effectTag == 6)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_lomo];
		}
        if(effectTag == 7)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_heibai];
		}
        if(effectTag == 8)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_huajiu];
		}
        if(effectTag == 9)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_gete];
		}
        if(effectTag == 10)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_ruise];
		}
        if(effectTag == 11)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_danya];
		}
        if(effectTag == 12)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_jiuhong];
		}
        if(effectTag == 13)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_qingning];
		}
        if(effectTag == 14)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_langman];
		}
        if(effectTag == 15)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_guangyun];
		}
        if(effectTag == 16)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_landiao];
		}
        if(effectTag == 17)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_menghuan];
		}
        if(effectTag == 18)
		{
			outImage = [ImageUtil processImage:currentImage withColorMatrix:colormatrix_yese];
		}
		if(outImage)
		{
			self.imageV.image = outImage;
		}
	}
} 

- (void) translate:(int) tag {
    
    NSInteger num = tag;
    UIImageView *imageView = self.imageV;
    CGRect newRect = CGRectMake(100, 100, 100, 100);
    CGSize newSize = CGSizeMake(imageView.frame.size.width/2, imageView.frame.size.height/2);
    
	switch (num) {
		case 0:{
        
			UIImage *smallImage = [currentImage imageAtRect:newRect];
			imageView.image = smallImage;
		}
			break;
		case 1:{
			UIImage *smallImage = [currentImage imageByScalingProportionallyToMinimumSize:newSize];
            
			imageView.image = smallImage;
		}
			
			break;
		case 2:{
			UIImage *smallImage = [currentImage imageByScalingProportionallyToSize:newSize];
			imageView.image = smallImage;
		}
			
			break;
		case 3:{
			UIImage *smallImage = [currentImage imageByScalingToSize:newSize];
			imageView.image = smallImage;
		}
			
			break;
		case 4:{
			UIImage *otherImage = [currentImage imageRotatedByRadians:M_PI/2];
			imageView.image = otherImage;
		}
			
			break;
		case 5:{
			UIImage *otherImage = [currentImage imageRotatedByDegrees:60.0f];
			imageView.image = otherImage;
		}
        case 6:{
			
            SSPhotoCropperViewController *photoCropper =
            [[SSPhotoCropperViewController alloc] initWithPhoto:currentImage
                                                       delegate:self
                                                         uiMode:SSPCUIModePresentedAsModalViewController
                                                showsInfoButton:YES];
            [photoCropper setMinZoomScale:0.75f];
            [photoCropper setMaxZoomScale:1.50f];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:photoCropper];
            [self presentModalViewController:nc animated:YES];
            [photoCropper release];
            [nc release];
		}
			
			break;
		default:
			break;
	}
}

///////////////////////////  UIImagePickerController 委托方法 ////////////////////////////////////

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	if ([mediaType isEqualToString:@"public.image"])
	{
		UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
		NSLog(@"found an image");
		
		UIImage *resizedImg = [ImageUtil image:image fitInSize:MainScreenFrame.size];
		currentImage = [resizedImg retain];
        
//        CGRect imageVFrame = imageV.frame;
//        CGRect newRect = CGRectMake(imageVFrame.frame.origin.x, )
        
		self.imageV.image = resizedImg;
        
	}
	//picker.cameraViewTransform = CGAffineTransformIdentity;
	[picker release];
    
	[self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker release];
	[self dismissModalViewControllerAnimated:YES];
}

///////////////////////////  自定义的方法 ////////////////////////////////////

-(void)snap:(id)sender
{
	if(imagePickerController)
	{
		[imagePickerController takePicture];
	}
}

-(void)close:(id)sender
{
	if(imagePickerController)
	{
		[self dismissModalViewControllerAnimated:YES];
		[imagePickerController release];
	}
}

-(void)save:(id)sender
{
	if(self.imageV.image)
	{
		UIImageWriteToSavedPhotosAlbum(self.imageV.image, self,@selector(image:didFinishSavingWithError:contextInfo:),NULL); 
	}
    
    [self showViews];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) image: (UIImage *)image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo;
{
	UIAlertView *al = [[UIAlertView alloc] initWithTitle:nil message:@"保存成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
	[al show];
	[al release];
}

-(void)tapOnCallback:(ProcessingImageView*)imageView
{
	[UIView beginAnimations:@"aa" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.3];

	if(show)
	{
		self.navBar.alpha = 0.0;
		self.bottomScroll.alpha = 0.0;
	}
	else 
	{
		self.navBar.alpha = 1.0;
		self.bottomScroll.alpha = 1.0;
	}
	[UIView commitAnimations];
	show = !show;
}

///////////////////////////  初始化时隐藏内容  ////////////////////////////////////

- (void) hideViews {
    
//  隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
//  隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    
//  隐藏标签栏
    [self hideTabBar];
}

- (void) showViews {
    
    //  隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    //  隐藏导航栏
    [self.navigationController setNavigationBarHidden:NO];
    
    //  隐藏标签栏
    [self showTabBar];
}

///////////////////////////  tabBarController 隐藏 和 显示  ////////////////////////////////////

- (void)hideTabBar {
	if (self.tabBarController.tabBar.hidden == YES) {
		return;
	}
	
	UIView *contentView;
	
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
	
	contentView.frame = CGRectMake(contentView.bounds.origin.x, 
								   contentView.bounds.origin.y, 
								   contentView.bounds.size.width, 
								   contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);        
	
	self.tabBarController.tabBar.hidden = YES;
}

- (void)showTabBar
{
	if (self.tabBarController.tabBar.hidden == NO)
    {
		return;
	}
	
	UIView *contentView;
	
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];      
    
	contentView.frame = CGRectMake(contentView.bounds.origin.x, 
								   contentView.bounds.origin.y, 
								   contentView.bounds.size.width, 
								   contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
	
	self.tabBarController.tabBar.hidden = NO;
}

///////////////////////////  SSPhotoCropperDelegate  ////////////////////////////////////

#pragma -
#pragma SSPhotoCropperDelegate Methods

- (void) photoCropper:(SSPhotoCropperViewController *)photoCropper
         didCropPhoto:(UIImage *)photo
{
    self.imageV.image = photo;
    [photoCropper dismissModalViewControllerAnimated:YES];
}

- (void) photoCropperDidCancel:(SSPhotoCropperViewController *)photoCropper
{
    [photoCropper dismissModalViewControllerAnimated:YES];
}

@end
