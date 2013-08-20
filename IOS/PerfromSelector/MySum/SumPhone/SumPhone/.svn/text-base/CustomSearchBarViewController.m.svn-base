//
//  CustomSearchBarViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomSearchBarViewController.h"

@implementation CustomSearchBarViewController
@synthesize mySearchBar;

+ (NSString *)friendlyName {
    return @"UISearchBarView自定义";
}

//哈哈哈，搜索也可以限制输入内容的！！！！！！！！

- (void) cancelButtonAppear {
	[mySearchBar setShowsCancelButton:YES animated:YES];//设置搜索按钮是否出现
	
    //改变cancel按钮的的文字
	for (id cancelButton in [mySearchBar subviews]) {
		[cancelButton retain];
		if ([cancelButton isKindOfClass:[UIButton class]]) {//哎呀注意啊，class要小写啊
			[(UIButton *)cancelButton setTitle:@"取消" forState:UIControlStateNormal];
			[(UIButton *)cancelButton setBackgroundImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateNormal];
			[(UIButton *)cancelButton setBackgroundImage:[UIImage imageNamed:@"green2.png"] forState:UIControlStateHighlighted];
		}
	}
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	mySearchBar = [[[CustomSearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
	
	mySearchBar.barStyle = UIBarStyleBlack;
	
	mySearchBar.delegate = self; 
	
	mySearchBar.text = @"";
	
    //	mySearchBar.prompt = @"A SearchBar!!!";
	
	mySearchBar.placeholder = @"placeholder";
	
	//mySearchBar.showsBookmarkButton = YES;//搜索栏表尾，书一样的图标
	//mySearchBar.showsSearchResultsButton = YES;//搜索表尾的按钮，三横图标
	
	BOOL isSearchButtonSelected = mySearchBar.searchResultsButtonSelected;
	isSearchButtonSelected;
	
    //mySearchBar.showsCancelButton = NO;
	mySearchBar.tintColor = [UIColor redColor];//这个可以用来改变取消按钮的颜色了！
	
    //mySearchBar.translucent = YES;// Default is NO. Always YES if barStyle is set to UIBarStyleBlackTranslucent
    //　当没有北京图片的时候，就可以有透明效果了	
    
    //mySearchBar.autocorrectionType = UITextAutocorrectionTypeYes;//恶心的恶首字母都大写了
	
    //mySearchBar.autocapitalizationType = UITextAutocapitalizationTypeSentences;
	
	mySearchBar.keyboardType = UIKeyboardTypeAlphabet;
	
    //这三个暂时不知道怎么用
	mySearchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
	
	mySearchBar.selectedScopeButtonIndex = 0;
	
	mySearchBar.showsScopeBar = YES;
	
	
	//改变searchBar的背景图片的两种办法
	//方法一（与UISearchBar自定义的类别一起完成任务）
	[[mySearchBar.subviews objectAtIndex:0] setHidden:YES]; 
	[[mySearchBar.subviews objectAtIndex:0] removeFromSuperview];
    //		
	for (UIView *subView in [mySearchBar subviews]) {
		if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
			[subView removeFromSuperview];
			break;
		}
	}//把背景移出掉
	
	//方法二
    //	[[mySearchBar.subviews objectAtIndex:0] removeFromSuperview];
    //	UIView *segment = [mySearchBar.subviews objectAtIndex:0];
    //	UIImageView	*bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.png"]];
    //	[segment addSubview: bgImage];
    //	
    //	
	[self.view addSubview:mySearchBar];
    [super viewDidLoad];
	
    //	UISearchDisplayController *searchDC = [[[UISearchDisplayController alloc] initWithSearchBar:mySearchBar 
    // contentsController:self] autorelease];
    //	searchDC.searchResultsDelegate = self;
    //	searchDC.searchResultsDataSource = self;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark SearchBar delegate method
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
	
	return YES;
} // return NO to not become first responder

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
	
} // called when text starts editing

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
	
	return YES;
} // return NO to not resign first responder

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
	
} // called when text ends editing

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	
} // called when text changes (including clear)

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) {

	//if ([text __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) isEqualToString:@"\n"]) {
    //		[mySearchBar resignFirstResponder];
    //		return NO;
    //	}//这样可以达到点击搜索，然后取消键盘的效果
	if ([text isEqualToString:@""]) {
		[mySearchBar setShowsCancelButton:NO animated:YES];//设置搜索按钮是否出现
		
	} else {
		[self cancelButtonAppear];
	}//设定当文本输入不为空时cancel按钮才出现
	
	if (range.location >= 5) {
		NSLog(@"writable num have reached");
		return NO;
	}//当输入的文本字数大于５，则制止输入
	
	return YES;
} // called before text changes

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
	[mySearchBar resignFirstResponder];
	[mySearchBar setShowsCancelButton:NO animated:YES];
} // called when keyboard search button pressed

- (void)searchBarBookmarkButdtonClicked:(UISearchBar *)searchBar {
	
} // called when bookmark button pressed

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
	
	mySearchBar.text = @"";
	[mySearchBar resignFirstResponder];
	[mySearchBar setShowsCancelButton:NO animated:YES];//设置搜索按钮是否出现
	
} // called when cancel button pressed

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2) {
	
} // called when search results button pressed

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) {

}

@end
