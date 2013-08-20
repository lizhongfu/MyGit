

#import "SuperLoadingBox.h"


@implementation SuperLoadingBox


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		
		UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		indicator.frame =CGRectMake( 70, 10, 50.0, 50.0);
		[indicator startAnimating];
		[self addSubview:indicator];
		[indicator release];
		
		UILabel *theLabel =[[UILabel alloc] initWithFrame:CGRectMake( 130.0, 5, 100, 60)];
		[theLabel setBackgroundColor:[UIColor clearColor]];
		[theLabel setText:@" 加载中..."];
		[theLabel setTextColor:[UIColor whiteColor]];
		[self addSubview:theLabel];
		[theLabel release];
	}
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)willPresentAlertView:(UIAlertView *)alertView {
//	NSLog(@"the");
//}

- (void)dealloc {
    [super dealloc];
}


@end
