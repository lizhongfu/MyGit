//
//  ZFScrollView.m
//  SumPhone
//
//  Created by Zogful Lee on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZFScrollView.h"

@implementation ZFScrollView

- (id) initWithFrame:(CGRect)frame
         contentSize:(CGSize)contentSize
             bounces:(BOOL)bounces
       pagingEnabled:(BOOL)pagingEnabled
      indicatorStyle:(UIScrollViewIndicatorStyle)indicatorStyle
delaysContentTouches:(BOOL)delaysContentTouches
canCancelContentTouches:(BOOL)canCancelContentTouches
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void) text //文档
{
    /*
     在滚动过程当中,其实是在修改原点坐标
     
     当手指触摸后, scroll view会暂时拦截触摸事件,使用一个
     计时器,假如在计时器到点后,没有发生手指移动事件,
     那么,scroll view发送tracking events到被点击的subview
     假如在计时器到点前,发生了移动事件,那么 scroll view 取消tracking
     自己发生滚动
     
     子类可以重载touchesShouldBegin:withEvent:inContentView: 决定自己是否接收touch事件
     pagingEnabled当值是YES,会自动滚动到subview的边界,默认是NO
     touchesShouldCancelInContentView: 开始发送tracking messages消息给subview的时候
     调用这个方法,决定是否发送tracking messages消息到subview,假如返回NO,发送,YES则不发送
     假如 canCancelContentTouches属性是NO,则不调用这个方法
     来影响如何处理滚动手势
     
     scroll view还处理缩放和平移手势
     要实现缩放和平移,必须实现委托viewForZoomingInScrollView:
     scrollViewDidEndZooming:withView:atScale:
     两个方法,另外 maximumZoomScale和minimumZoomScale两个属性要不一样 
     
     几个属性
     tracking
     当touch后还没有拖动的时候,值是YES,否则NO
     
     
     zoomBouncing
     当内容放大到最大或者最小的时候,值是YES,否则NO
     
     
     zooming
     当正在缩放的时候,值是YES,否则NO
     
     decelerating
     
     当滚动后,手指放开,但是还在继续滚动中,这个时候是 YES,其他是NO
     
     decelerationRate
     
     设置手指放开后的减速率
     
     
     maximumZoomScale
     一个浮点数,表示能放最大的倍数
     
     
     minimumZoomScale 
     一个浮点数,表示能缩最小的倍数
     
     
     pagingEnabled
     当值是YES,会自动滚动到subview的边界,默认是NO
     
     
     scrollEnabled
     决定是否可以滚动
     
     delaysContentTouches
     
     是个布尔值,当值是YES的时候,用户触碰开始,scroll view要延迟一会,看看是否用户有意图滚动,假如滚动了,那么捕捉touch-down事件,否则就不捕捉, 假如值是NO,当用户触碰, scroll view会立即触发touchesShouldBegin:withEvent:inContentView:, 默认是YES
     
     canCancelContentTouches
     当值是YES的时候，用户触碰后，然后在一定时间内没有移动，scrollView发送tracking events，然后用户移动手指足够长度触发滚动事件，这个时候，scrollView发送了touchesCancelled:withEvent: 到subview，然后scroView开始滚动
     假如值是NO,scrollView发送tracking events后，就算用户移动手指，scrollView也不会滚动
     
     contentSize
     里面内容的大小，也就是可以滚动的大小，默认是0，没有滚动效果。
     
     showsHorizontalScrollIndicator
     滚动时,是否显示水平滚动条
     
     showsVerticalScrollIndicator
     滚动时,是否显示垂直滚动条
     
     bounces
     默认是yes,就是滚动超过边界,会反弹有反弹回来的效果,假如是 NO,那么滚动到达边界,那么会连忙停止
     
     bouncesZoom
     和bounces类似,区别在于,这个效果反映在缩放上面,假如缩放超过最大缩放,那么会反弹效果,假如是NO,则到达最大或者最小的时候,立即停止
     
     directionalLockEnabled
     默认是NO, 可以在垂直和水平方向同时运动, 当值是YES, 假如一开始是垂直或者是水平运动,那么接下来会锁定另外一个方向的滚动, 假如一开始是对角方向滚动,则不会禁止某个方向
     
     indicatorStyle
     滚动条的样式,基本只是设置颜色,总共3个颜色,默认,黑色的,白色的
     
     scrollIndicatorInsets
     设置滚动条的位置
     */

}

@end
