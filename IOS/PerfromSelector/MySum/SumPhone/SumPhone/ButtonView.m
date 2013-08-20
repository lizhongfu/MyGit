//
//  ButtonView.m
//  Button Cluster
//
//  Created by tin on 10-3-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ButtonView.h"
#import "MainViewController.h"



@implementation ButtonView

@synthesize z,oldPosition,oldTransform,oldAlpha;


- (id)initWithID: (NSString*)_ID{
	
    if (self = [super initWithFrame:CGRectMake(0, 0, 64, 64)]) {
		
        // Initialization code
		ID=_ID;
		[self setBackgroundColor:[UIColor clearColor]];
		
		UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 64,30)];
		UILabel *lable2=[[UILabel alloc]initWithFrame:CGRectMake(0, 27, 64,30)];
		
		[lable1 setBackgroundColor:[UIColor clearColor]];
		[lable2 setBackgroundColor:[UIColor clearColor]];
		
	    lable1.textAlignment=lable2.textAlignment=UITextAlignmentCenter;
		
		lable1.text=@"Button";
		lable2.text=ID;
		
		[self addSubview:lable1];
		[self addSubview:lable2];
		
		[lable1 release];
		[lable2 release];
		

		
    }
	
    return self;
}




- (void)drawRect:(CGRect)rect {
	
    // Drawing code
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// And draw with a green fill color
	CGContextSetRGBFillColor(context, 0.3, 1.0, 0.1, 1.0);
	CGContextFillEllipseInRect(context, CGRectMake(0, 0, 64.0, 64.0));
	
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
    
//    如果不加这行，那么触摸就不传递了，MainViewController的touche end方法就不会执行了。
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	
	[MainViewController focusButton:self];
	
	NSLog(@"HiHi~~ You touched Button%@",ID);
	
	
	
}



-(void)moveToX:(float)_x Y:(float)_y{
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
	
    float zRatio=self.z/320;
	
    self.center=CGPointMake(self.center.x+_x*zRatio,self.center.y+_y*zRatio);
	
	
	
	// update button's position when it out of mainView bounds.
	
	
	if(self.center.x < -100){
		
		self.center=CGPointMake(self.center.x+480,self.center.y);
		
	}else if (self.center.x > 420){
		
		self.center=CGPointMake(self.center.x-480,self.center.y);
		
	}
	
	
	
	if(self.center.y < -100){
		
		self.center=CGPointMake(self.center.x,self.center.y+640);
		
	}else if (self.center.y > 580){
		
		self.center=CGPointMake(self.center.x,self.center.y-640);
		
	}
    

}

-(void)scale:(float)scaleValue{
#if OUTPUT_CoreGraphics_MainViewController
    kPrintInfo;
#endif
    
	CGAffineTransform transform=self.transform;
	transform=CGAffineTransformScale(transform, scaleValue, scaleValue);
	self.transform=transform;	
	
}




- (void)dealloc {
    [super dealloc];
}


@end
