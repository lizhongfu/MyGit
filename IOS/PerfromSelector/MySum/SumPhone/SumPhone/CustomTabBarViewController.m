

#import "CustomTabBarViewController.h"

#define SELECTED_VIEW_CONTROLLER_TAG 98456345

static NSArray* tabBarItems = nil;

@implementation CustomTabBarViewController
@synthesize tabBar;

+ (NSString *)friendlyName {
    return @"UITabBar自定义";
}

- (id) init {
    
    if (self = [super init]) {
        UIViewController *detailController1 = [[[UIViewController alloc] init] autorelease];
        detailController1.view.backgroundColor = [UIColor redColor];
        
        UIViewController *detailController2 = [[[UIViewController alloc] init] autorelease];
        detailController2.view.backgroundColor = [UIColor greenColor];
        
        UIViewController *detailController3 = [[[UIViewController alloc] init] autorelease];
        detailController3.view.backgroundColor = [UIColor blueColor];
        
        UIViewController *detailController4 = [[[UIViewController alloc] init] autorelease];
        detailController4.view.backgroundColor = [UIColor cyanColor];
        
        UIViewController *detailController5 = [[[UIViewController alloc] init] autorelease];
        detailController5.view.backgroundColor = [UIColor purpleColor];
        
        tabBarItems = [[NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:@"chat.png", @"image", detailController1, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"compose-at.png", @"image", detailController2, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"messages.png", @"image", detailController3, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"magnifying-glass.png", @"image", detailController4, @"viewController", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"more.png", @"image", detailController5, @"viewController", nil], nil] retain];
    }
    
    return self;
}

- (void) viewWillDisappear:(BOOL)animated {
    [self showTabBar];
}

- (void)viewDidLoad
{kPrintInfo;
    [super viewDidLoad];
    
    [self hideTabBar];
    
    CGRect aRect = self.view.frame;
    float height = aRect.size.height;
    height += 44;
    CGRect newRect = CGRectMake(aRect.origin.x, aRect.origin.y, aRect.size.width, height);
    self.view.frame = newRect;
    
    // Use the TabBarGradient image to figure out the tab bar's height (22x2=44)
    UIImage* tabBarGradient = [UIImage imageNamed:@"TabBarGradient.png"];
    
    // Create a custom tab bar passing in the number of items, the size of each item and setting ourself as the delegate
    self.tabBar = [[[CustomTabBar alloc] initWithItemCount:tabBarItems.count itemSize:CGSizeMake(self.view.frame.size.width/tabBarItems.count, tabBarGradient.size.height*2) tag:0 delegate:self] autorelease];
    
    // Place the tab bar at the bottom of our view
    tabBar.frame = CGRectMake(0,self.view.frame.size.height-(tabBarGradient.size.height*2),self.view.frame.size.width, tabBarGradient.size.height*2);
    [self.view addSubview:tabBar];
    
    // Select the first tab
    [tabBar selectItemAtIndex:0];
    [self touchDownAtItemAtIndex:0];
    
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


#pragma mark -
#pragma mark CustomTabBarDelegate

- (UIImage*) imageFor:(CustomTabBar*)tabBar atIndex:(NSUInteger)itemIndex
{kPrintInfo;
  // Get the right data
  NSDictionary* data = [tabBarItems objectAtIndex:itemIndex];
  // Return the image for this tab bar item
  return [UIImage imageNamed:[data objectForKey:@"image"]];
}//设置tabBar Item上的图片

- (UIImage*) backgroundImage
{kPrintInfo;
  // The tab bar's width is the same as our width
  CGFloat width = self.view.frame.size.width;
  // Get the image that will form the top of the background
  UIImage* topImage = [UIImage imageNamed:@"TabBarGradient.png"];
  
  // Create a new image context
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, topImage.size.height*2), NO, 0.0);
  //UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale) __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_4_0);
	
  // Create a stretchable image for the top of the background and draw it
  UIImage* stretchedTopImage = [topImage stretchableImageWithLeftCapWidth:0 topCapHeight:0];
  [stretchedTopImage drawInRect:CGRectMake(0, 0, width, topImage.size.height)];//一半得高度
  
	
	
  // Draw a solid black color for the bottom of the background
  [[UIColor blackColor] set];
	// Set the color: Sets the fill and stroke colors in the current drawing context. Should be implemented by subclassers.
  CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, topImage.size.height, width, topImage.size.height));
  
  // Generate a new image
  UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return resultImage;
}//bar上图片，一半是黑色图片，下面一半是颜色填充

// This is the blue background shown for selected tab bar items
- (UIImage*) selectedItemBackgroundImage
{kPrintInfo;
  return [UIImage imageNamed:@"TabBarItemSelectedBackground.png"];
}//设置item被选中时候的背景颜色，浅蓝色！

// This is the glow image shown at the bottom of a tab bar to indicate there are new items
- (UIImage*) glowImage
{kPrintInfo;
  UIImage* tabBarGlow = [UIImage imageNamed:@"TabBarGlow.png"];
  
  // Create a new image using the TabBarGlow image but offset 4 pixels down
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(tabBarGlow.size.width, tabBarGlow.size.height - 4.0), NO, 0.0);
  // Draw the image
  [tabBarGlow drawAtPoint:CGPointZero];

  // Generate a new image
  UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return resultImage;
}//底下得那个亮点

// This is the embossed-like image shown around a selected tab bar item
- (UIImage*) selectedItemImage
{kPrintInfo;
  // Use the TabBarGradient image to figure out the tab bar's height (22x2=44)
  UIImage* tabBarGradient = [UIImage imageNamed:@"TabBarGradient.png"];
  CGSize tabBarItemSize = CGSizeMake(self.view.frame.size.width/tabBarItems.count, tabBarGradient.size.height*2);
  UIGraphicsBeginImageContextWithOptions(tabBarItemSize, NO, 0.0);

  // Create a stretchable image using the TabBarSelection image but offset 4 pixels down
  [[[UIImage imageNamed:@"TabBarSelection.png"] stretchableImageWithLeftCapWidth:4.0 topCapHeight:0] drawInRect:CGRectMake(0, 4.0, tabBarItemSize.width, tabBarItemSize.height-4.0)];  

  // Generate a new image
  UIImage* selectedItemImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return selectedItemImage;
}

- (UIImage*) tabBarArrowImage
{kPrintInfo;
  return [UIImage imageNamed:@"TabBarNipple.png"];
}//小箭头

- (void) touchDownAtItemAtIndex:(NSUInteger)itemIndex
{kPrintInfo;
  // Remove the current view controller's view
  UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
  [currentView removeFromSuperview];
  
  // Get the right view controller
  NSDictionary* data = [tabBarItems objectAtIndex:itemIndex];
  UIViewController* viewController = [data objectForKey:@"viewController"];

  // Use the TabBarGradient image to figure（出演，扮演） out the tab bar's height (22x2=44)
  UIImage* tabBarGradient = [UIImage imageNamed:@"TabBarGradient.png"];

  // Set the view controller's frame to account for the tab bar
  viewController.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height-(tabBarGradient.size.height*2));

  // Se the tag so we can find it later
  viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
  
  // Add the new view controller's view
  [self.view insertSubview:viewController.view belowSubview:tabBar];
	
  // In 1 second glow the selected tab
  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(addGlowTimerFireMethod:) userInfo:[NSNumber numberWithInteger:itemIndex] repeats:NO];
  
}//处理ViewController的View,并且让小箭头动起来，延迟一秒

- (void)addGlowTimerFireMethod:(NSTimer*)theTimer
{kPrintInfo;
  // Remove the glow from all tab bar items
  for (NSUInteger i = 0 ; i < tabBarItems.count ; i++)
  {
    [tabBar removeGlowAtIndex:i];
  }
  
  // Then add it to this tab bar item
  [tabBar glowItemAtIndex:[[theTimer userInfo] integerValue]];
}

- (void)dealloc
{
    
    [tabBar release];
    
    [super dealloc];
}

@end
