//
//  MaskDemoViewController.m
//  MaskDemo
//
//  Created by shinren Pan on 2010/12/31.
//  Copyright 2010 home. All rights reserved.
//

#import "MaskDemoViewController.h"

@implementation MaskDemoViewController
@synthesize imageView;


+ (NSString *)friendlyName {
    return @"图片色彩和边框及遮盖";
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[[UIImageView alloc] initWithFrame:BaseFrame] autorelease];
    self.imageView.image = [UIImage imageNamed:@"apple_big.png"];
    [self.view addSubview:self.imageView];
    self.imageView.userInteractionEnabled = YES;
    
    float width = BaseFrame.size.width;
    float height = BaseFrame.size.height;
    
    UIButton *bta = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bta.frame = CGRectMake(width/10, height-2*width/10, width*2/10, width/10);
    [bta setTitle:@"颜色" forState:UIControlStateNormal];
    bta.tag = 111;
    [bta addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btb = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btb.frame = CGRectMake(width*4/10, height-2*width/10, width*2/10, width/10);
    [btb setTitle:@"遮盖" forState:UIControlStateNormal];
     btb.tag = 222;
    [btb addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btc = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btc.frame = CGRectMake(width*7/10, height-2*width/10, width*2/10, width/10);
    [btc setTitle:@"边框圆角" forState:UIControlStateNormal];
    btc.tag = 333;
    [btc addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bta];
    [self.view addSubview:btb];
    [self.view addSubview:btc];
}

-(void) test:(UIButton *)button;
{
	
	UIActionSheet *actionSheet;
	
	switch (button.tag) {
		case 111:
			type = color;
			actionSheet = [[UIActionSheet alloc]initWithTitle:@"改變顏色" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"紅色",@"橙色",@"黃色",@"綠色",@"藍色",@"紫色",@"回復",nil];
			break;
		case 222:
			type = mask;
			actionSheet = [[UIActionSheet alloc]initWithTitle:@"遮罩測試" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"使用圖片遮罩",@"回復",nil];
			break;
		case 333:
			type = frame;
			actionSheet = [[UIActionSheet alloc]initWithTitle:@"邊框圓角" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"加邊框",@"加圓角",@"回復",nil];			
			break;
	}
	[actionSheet showInView:self.view];
	[actionSheet release];
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	UIImage *OriginalImage = [UIImage imageNamed:@"apple_big"];
	switch (type) 
	{
		case color:
			switch (buttonIndex) 
			{
				case 0:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor redColor]];
					break;
				case 1:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor orangeColor]];
					break;
				case 2:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor yellowColor]];
					break;
				case 3:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor greenColor]];
					break;
				case 4:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor blueColor]];
					break;
				case 5:
					imageView.image = [ImageSet colorizeImage:OriginalImage withColor:[UIColor purpleColor]];
					break;
				case 6:
					imageView.image = OriginalImage;
					break;
			}
			break;
		case mask:
			switch (buttonIndex) 
			{
				case 0:
				{
					UIImage *maskImage = [[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"maskImage" ofType:@"png"]]retain];
					imageView.image = [ImageSet maskImage:imageView.image withImage:maskImage];
					[maskImage release];
					break;
				}
				case 1:
					imageView.image = OriginalImage;
					break;
			}
			break;
		case frame:
			switch (buttonIndex) 
			{
				case 0:
					[[imageView layer]setBorderWidth:10];
					[[imageView layer]setBorderColor:[UIColor redColor].CGColor];
					break;
				case 1:
					[[imageView layer]setCornerRadius:10];
					break;
				case 2:
					[[imageView layer]setBorderWidth:0];
					[[imageView layer]setCornerRadius:0];
					break;
			}
			break;
	}
	
}
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	imageView = nil;
	
}


- (void)dealloc {
	[imageView release];
    [super dealloc];
}

@end
