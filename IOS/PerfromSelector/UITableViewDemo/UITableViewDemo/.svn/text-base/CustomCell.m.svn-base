//
//  CustomCell.m
//  UITableViewDemo
//
//  Created by Zogful.Lee on 13-4-11.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "CustomCell.h"

NSString * const kJKPrepareForReuseNotification = @"JKCallbacksTableViewCell_PrepareForReuse";

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //如果cell 的图片发生改变，当cell重用的时候，刷新图片
        
		[[self imageView] addObserver:self
						   forKeyPath:@"image"
							  options:NSKeyValueObservingOptionOld
							  context:NULL];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
    NSLog(@"observeValueForKeyPath");
    
	if (object == [self imageView] &&
		[keyPath isEqualToString:@"image"] &&
		([change objectForKey:NSKeyValueChangeOldKey] == nil ||
		 [change objectForKey:NSKeyValueChangeOldKey] == [NSNull null]))
    {
		[self setNeedsLayout];
	}
}

- (void)prepareForReuse
{
	[[NSNotificationCenter defaultCenter] postNotificationName:kJKPrepareForReuseNotification
														object:self];
	
	[super prepareForReuse];
}

@end
