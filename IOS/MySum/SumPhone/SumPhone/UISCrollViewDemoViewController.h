
#import <UIKit/UIKit.h>
#import "ViewBase.h"
#import "UIScrollView-Extensions.h"

@interface UISCrollViewDemoViewController : ViewBase <UIScrollViewDelegate> {
	UIScrollView *myScrollView;
	UIPageControl *pageControl;
	NSInteger offX;
}

@property (nonatomic, retain) UIScrollView *myScrollView;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (assign) NSInteger offX;

@end

