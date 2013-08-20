//
//  PageScrollView.m
//  PageControl
//
//  Created by iMac on 11-9-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PageScrollView.h"


@implementation PageScrollView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self!=nil)
    {
        _pages=nil;
        _zeroPage=0;
        
        CGRect screenFrame = [[UIScreen mainScreen] bounds];
        _pageRegion=CGRectMake(0, -20, screenFrame.size.width, screenFrame.size.height-60);
        //_pageRegion=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height-60);
        //_controlRegin=CGRectMake(frame.origin.x, frame.size.height-60, frame.size.width, 60);
        NSLog(@"x-%f,y-%f,w-%f,h-%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height);
        _controlRegin=CGRectMake(-50,724-60,1024,60);
        self.delegate=nil;
        
        scrollView=[[UIScrollView alloc]initWithFrame:_pageRegion];
        scrollView.pagingEnabled=YES;
        scrollView.delegate=self;
        [self addSubview:scrollView];
        
        pageControl=[[UIPageControl alloc]initWithFrame:_controlRegin];
        [pageControl addTarget:self action:@selector(pageControlDidChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
        pageControl.hidden=TRUE;
    }
    return self;
}

-(void)setPages:(NSMutableArray *)pages
{
    if(_pages!=nil)
    {
        for(int i=0;i<[_pages count];i++)
        {
            [[_pages objectAtIndex:i] removeFromSuperview];
        }
    }
    _pages=pages;
    scrollView.contentOffset=CGPointMake(0, 0);
    if([_pages count]<3)
    {
        scrollView.contentSize=CGSizeMake(_pageRegion.size.width*[_pages count], _pageRegion.size.height);
    }
    else
    {
        scrollView.contentSize=CGSizeMake(_pageRegion.size.width*3, _pageRegion.size.height);
        scrollView.showsHorizontalScrollIndicator=NO;
    }
    pageControl.numberOfPages=[_pages count];
    pageControl.currentPage=0;
    [self layoutViews];
}

-(void)layoutViews
{
    if([_pages count]<=3)
    {
        for(int i=0;i<[_pages count];i++)
        {
            UIView *page=[_pages objectAtIndex:i];
            CGRect bounds=page.bounds;
            CGRect frame=CGRectMake(_pageRegion.size.width*i, 0, _pageRegion.size.width, _pageRegion.size.height);
            page.frame=frame;
            page.bounds=bounds;
            [scrollView addSubview:page];
        }
        return;
    }
    
    for(int i=0;i<[_pages count];i++)
    {
        UIView *page=[_pages objectAtIndex:i];
        CGRect bounds=page.bounds;
        CGRect frame=CGRectMake(0, 0, _pageRegion.size.width, _pageRegion.size.height);
        page.frame=frame;
        page.bounds=bounds;
        page.hidden=YES;
        [scrollView addSubview:page];
    }
    [self layoutScroller];
}

-(void)layoutScroller
{
    UIView *page;
    CGRect bounds,frame;
    int pageNum=[self getCurrentPage];
    
    if([_pages count]<=3)
    {
        return;
    }
    NSLog(@"laying out scroller for page %d\n",pageNum);
    
    if(pageNum==0)
    {
        for(int i=0;i<3;i++)
        {
            page=[_pages objectAtIndex:i];
            bounds=page.bounds;
            frame=CGRectMake(_pageRegion.size.width*i, 0, _pageRegion.size.width, _pageRegion.size.height);
            NSLog(@"\tOffset for Page %d=%f\n",i,frame.origin.x);
            page.frame=frame;
            page.bounds=bounds;
            page.hidden=NO;
        }
        page=[_pages objectAtIndex:3];
        page.hidden=YES;
        _zeroPage=0;
    }
    else if(pageNum==[_pages count]-1)
    {
        for(int i=pageNum-2;i<=pageNum;i++)
        {
            page=[_pages objectAtIndex:i];
            bounds=page.bounds;
            frame=CGRectMake(_pageRegion.size.width*(2-(pageNum-i)), 0, _pageRegion.size.width, _pageRegion.size.height);
            NSLog(@"\tOffset for page %d =%f\n",i,frame.origin.x);
            page.frame=frame;
            page.bounds=bounds;
            page.hidden=NO;
        }
        page=[_pages objectAtIndex:[_pages count]-3];
        page.hidden=YES;
        _zeroPage=pageNum-2;
    }
    else
    {
        for(int i=pageNum-1;i<=pageNum+1;i++)
        {
            page=[_pages objectAtIndex:i];
            bounds=page.bounds;
            frame=CGRectMake(_pageRegion.size.width*(i-(pageNum-1)), 0, _pageRegion.size.width, _pageRegion.size.height);
            NSLog(@"\tOffset for page %d = %f\n",i,frame.origin.x);
            page.frame=frame;
            page.bounds=bounds;
            page.hidden=NO;
        }
        for(int i=0;i<[_pages count];i++)
        {
            if(i<pageNum-1||i>pageNum+1)
            {
                page=[_pages objectAtIndex:i];
                page.hidden=YES;
            }
        }
        scrollView.contentOffset=CGPointMake(_pageRegion.size.width, 0);
        _zeroPage=pageNum-1;
    }
}

-(id)getDelegate
{
    return _delegate;
}

-(void)setDelegate:(id)delegate
{
    _delegate=delegate;
}

-(BOOL)getShowsPageControl
{
    return _showsPageControl;
}

-(void)setShowsPageControl:(BOOL)showsPageControl
{
    _showsPageControl=showsPageControl;
    if(_showsPageControl==NO)
    {
        _pageRegion=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        pageControl.hidden=YES;
        scrollView.frame=_pageRegion;
    }
    else
    {
        _pageRegion=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height-60);
        pageControl.hidden=NO;
        scrollView.frame=_pageRegion;
    }
}

-(NSMutableArray *)getPages
{
    return _pages;
}

-(void)setCurrentPage:(int)page
{
    [scrollView setContentOffset:CGPointMake(0,0)];
    _zeroPage=page;
    [self layoutScroller];
    pageControl.currentPage=page;
}

-(int)getCurrentPage
{
    return (int)(scrollView.contentOffset.x/_pageRegion.size.width)+_zeroPage;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControl.currentPage=self.currentPage;
    [self layoutScroller];
    [self notifyPageChange];
}

-(void)pageControlDidChange:(id)sender
{
    UIPageControl *control=(UIPageControl *)sender;
    if(control==pageControl)
    {
        [scrollView setContentOffset:CGPointMake(_pageRegion.size.width*(control.currentPage-_zeroPage), 0)
         animated:YES
         ];
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self layoutScroller];
    [self notifyPageChange];
}

-(void)notifyPageChange
{
    if(self.delegate!=nil)
    {
        if([_delegate conformsToProtocol:@protocol(PageScrollViewDelegate)])
        {
            if([_delegate respondsToSelector:@selector(pageScrollViewDidChangeCurrentPage:currentPage:)])
            {
                [self.delegate pageScrollViewDidChangeCurrentPage:(PageScrollView *)self currentPage:self.currentPage];
            }
        }
    }
}


- (void)dealloc
{
    [pageControl release];
    [scrollView release];
    [super dealloc];
}
@end
