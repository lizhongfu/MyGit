//
//  PageScrollView.h
//  PageControl
//
//  Created by iMac on 11-9-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PageScrollView : UIView<UIScrollViewDelegate> {
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    
    CGRect _pageRegion,_controlRegin;
    NSMutableArray *_pages;
    id _delegate;
    BOOL _showsPageControl;
    int _zeroPage;
}

-(void)layoutViews;
-(void)notifyPageChange;
-(void)layoutScroller;

@property(nonatomic,assign,getter = getPages) NSMutableArray *pages;
@property(nonatomic,assign,getter =getCurrentPage) int currentPage;
@property(nonatomic,assign,getter = getDelegate) id delegate;
@property(nonatomic,assign,getter = getShowsPageControl) BOOL showsPageControl;

@end

@protocol PageScrollViewDelegate <NSObject>

@optional

-(void)pageScrollViewDidChangeCurrentPage:
    (PageScrollView *)pageScrollView currentPage:(int)currentPage;

@end