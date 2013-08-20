

#import "UISCrollViewDemoViewController.h"
#define XXX 40
#define kPrintfInfo printf("%s line: %d\n", __FUNCTION__, __LINE__)

@implementation UISCrollViewDemoViewController

@synthesize myScrollView, pageControl, offX;

+ (NSString *)friendlyName {
    return @"UIScrollView自己的Demo";
}

- (void)dealloc {
    [super dealloc];
	
    [pageControl release];
	[myScrollView release];
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	

}

- (void)viewDidLoad {
	offX = 0;
    [super viewDidLoad];
    self.view.frame = BaseFrame;
	
	myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(80, 20, 160, 240)];
	//myScrollView.backgroundColor = [UIColor redColor];
	for (int i=0; i<6; i++) {
		UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.PNG", i]]];
		imageView.frame = CGRectMake((160 * i), 0, 160, 240);
		imageView.tag = i+1;
		imageView.contentMode = UIViewContentModeScaleAspectFit;
		[myScrollView addSubview:imageView];
		[imageView release];
	}
	
	/*************************************属性部分**************************************/
	
	
	myScrollView.contentSize = CGSizeMake(160*6, 240);//可以滚动的区域
	//myScrollView.contentOffset = CGPointMake(480, 0);//当前定点相对于 scrollView 原点的偏移量，x／y方向都可以偏移
	//myScrollView.contentInset = UIEdgeInsetsMake(120, 0, 120, 0);//显示图片放到scrollView中的相对位置，距离滚动视图各个边缘距离多少(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) 
	
	//myScrollView.pagingEnabled = YES;//一页页的翻动效果
	//myScrollView.scrollEnabled = NO;//禁止滚动
	
	myScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;//翻页指针的样式，只要针对背景而定
	myScrollView.decelerationRate = UIScrollViewDecelerationRateFast;//当翻页效果取消后滚动，设置手指离开后视图滚动停止的速度
	myScrollView.delegate = self;
	
	myScrollView.directionalLockEnabled = YES;
	//默认是 NO, 可以在垂直和水平方向同时运动 , 当值是 YES, 假如一开始是垂直或者是水平 运动,那么接下来会锁定另外一个方向的滚动 , 假如一开始是对角方向滚动 ,则不会禁止某个 方向
	
	//myScrollView.bounces = NO;
	//默认是 yes,就是滚动超过边界 ,会反弹有反弹回来的效果 ,假如是 NO,那么滚动到达边界 ,那么会连忙停止
	
	//myScrollView.alwaysBounceVertical = YES;//可以垂直方向反弹
	//myScrollView.alwaysBounceHorizontal = YES;//可以水平方向反弹
	
	//myScrollView.showsVerticalScrollIndicator = NO;//垂直方向的滚动指针是否显示
	//myScrollView.showsHorizontalScrollIndicator = NO;//水平方向的滚动指针是否显示
	
	myScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 20, 20, 0);// 设置滚动指针相对于滚动视图得位置
	
	
	/*************************************方法部分**************************************/
	
	
	//[myScrollView setContentOffset:CGPointMake(320, 0) animated:YES];//可以动态设置偏移量到想要得视图
	
	//[myScrollView scrollRectToVisible:CGRectMake(160, 0, 80, 1) animated:YES];//猜想：当可以随便滚动时候，可以确定的显示一个框架
	
	//[myScrollView flashScrollIndicators];//闪烁进度条指针
	
	NSLog(@"tracking is:%d", (int)myScrollView.tracking);//当 touch 后还没有拖动的时候,值是 YES,否则 NO
	
	NSLog(@"tracking is:%d", (int)myScrollView.dragging);//滚动时候yes
	
	NSLog(@"tracking is:%d", (int)myScrollView.decelerating);//returns YES if user isn't dragging (touch up) but scroll view is still moving
	
	
	myScrollView.delaysContentTouches = YES;
	//是个布尔值 ,当值是 YES 的时候 ,用户触碰开始 ,scroll view 要延迟一会 ,看看是否用户有意图 滚动,假如滚动了,那么捕捉 touch-down 事件,否则就不捕捉, 
	//假如值是 NO,当用户触碰, scroll view 会立即触发 touchesShouldBegin:withEvent:inContentView:, 默认是 YES
	
//	进阶问题:关于UIScrollView 的事件处理   
	
//	如SDK描述,UIScrollView 内部有一个timer,会来截取event . 当发生touch事件以后, 如果此UIScrollView的 delaysContentTouches == YES. 
//	那么这个touch会被UIScrollView拦截,150ms后,判断手指有没有移动,移动则拦截此事件,不让其传向inner view,并且开始UIScrollView的划动. 
//	如果没有动,则将此touch传给inner view,不划动.
//	
//	问题: 由于UITouch 会在传送过程中发生"突变",而且UITouch不能copy. 那么,UIScrollView是怎么实现这个过程的.
//	
//	
//	迷惑:  1. delaysContentTouches == YES. 时候, 当touch事件发生以后, UIScrollView在150ms的判断(是否划动)时间内,
//	并没有调用touchesBegan,touchesEnded,touchesMoved等,那么他是怎么窃取这个touch的?
//	
//	2.如果在touchesBegan 中得到 touch = [touches anyObject] , 然后将 150ms后再将这个touch给他的inner view使用,
//	但是此时这个touch已经突变,传过去已经不能按预期效果使用.
	
	myScrollView.canCancelContentTouches = YES;
	//当值是 YES 的时候,用户触碰后,然后在一定时间内没有移动, scrollView 发送 tracking events ,然后用户移动手指足够长
	//度触发滚动事件,这个时候, scrollView 发送 了 touchesCancelled:withEvent: 到subview,然后scroView开始滚动
	//假如值是 NO,scrollView 发送 tracking events 后,就算用户移动手指 ,scrollView 也不会滚动
	
	//myScrollView.minimumZoomScale = 1.0;//一个浮点数 ,表示能缩最小的倍数
	//myScrollView.maximumZoomScale = 0.9;//一个浮点数 ,表示能放最大的倍数
	//myScrollView.zoomScale = 0.5;
	
	//[myScrollView setZoomScale:0.1 animated:YES];
	
	myScrollView.bouncesZoom = YES;//缩放时候得反弹效果
	
	NSLog(@"zooming is:%d", (int)myScrollView.zooming);//正在缩放时候yes
	
	NSLog(@"zooming is:%d", (int)myScrollView.zoomBouncing);//缩放到最大最小时候是yes
	
	myScrollView.scrollsToTop = YES;
	
	[self.view addSubview:myScrollView];
	
	
	pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
	pageControl.hidesForSinglePage = YES;
	pageControl.userInteractionEnabled = NO;
//	pageControl.backgroundColor = [UIColor redColor];
	[myScrollView addSubview:pageControl];
}



- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
	kPrintfInfo;
	return NO;
}// default returns YES

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    kPrintfInfo;
	return YES;
}// not called if canCancelContentTouches is NO. default returns YES if view isn't UIControl


//手指触摸并将要滑动被调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	kPrintfInfo;
}

//手指触摸并滑动被调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	kPrintfInfo;
	  UISlider *slider = (UISlider *)[self.view viewWithTag:123];
	  slider.value = myScrollView.contentOffset.x/myScrollView.contentSize.width;
}

//手指拖拽结束
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	kPrintfInfo;		
}

//手指离开后，将要减速滚动时候被调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
	kPrintfInfo;
}

//减速滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	kPrintfInfo;
	int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
	pageControl.currentPage = index;
}

//正在缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2) {
	kPrintfInfo;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	kPrintfInfo;
}// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

//返回正在缩放的view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	kPrintfInfo;
	return [scrollView viewWithTag:1];
}

//将要开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2) {
	kPrintfInfo;
}// called before the scroll view begins zooming its content

// scale between minimum and maximum. called after any 'bounce' animations
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
	kPrintfInfo;
}

// return a yes if you want to scroll to the top. if not defined, assumes YES
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
	kPrintfInfo;
	return YES;
}

// called when scrolling animation finished. may be called immediately if already at top
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
	kPrintfInfo;
} 


@end
