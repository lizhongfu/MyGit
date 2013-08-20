//
//  BlockViewController.m
//  SumPhone
//
//  Created by Zogful.Lee on 12-7-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BlockViewController.h"

static int globle = 100;

@interface BlockViewController ()

@end

@implementation BlockViewController

+ (NSString *)friendlyName {
    return @"Block学习";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = BaseFrame;
    
//////////////////////////////////////////////////////////////////////////////////////////
    
    void (^blocks)(void) = ^(void) { 
        puts("Hello World"); 
    };  
    blocks();
    
//////////////////////////////////////////////////////////////////////////////////////////
    
    void (^p[2])(void) = {
        ^(void) { puts("ping ping"); },
        ^(void) { puts(", my first love!"); }
    };
    p[0]();p[1]();
    //    char *str1 = "ping ping";
    //    char *str2 = ", my first love!";
    //    strcat(str1, str2);
    //    puts(str1);
    
    //    char str1[10]=" ,ping ping";
    //    char str2[20]="my first love!";
    //    strcpy(str2+strlen(str2),str1);
    //    printf("%s",str2);
    
//////////////////////////////////////////////////////////////////////////////////////////
 
    
    int local = 50;
    void (^plus)(void) = ^(void) { printf("globle + local = %d\r\n", globle + local); };
    plus();
    
    void (^changeGloble)(void) = ^(void) { ++globle; printf("globle:%d\n", globle); };
    changeGloble();
    
//////////////////////////////////////////////////////////////////////////////////////////

    
    /*    块可变变量
     如果某个局部变量使用__block存储修饰符，则表示块应使用此变量的引用，并可更改它的值。对变量的任何改变都只在块的语法作用域内部，以及该作用域中定义的其它块中起作用。*/
    __block int aLocal = 80;
    void (^changeALocal)(void) = ^(void) { ++aLocal; printf("globle:%d\n", aLocal); };
    changeALocal();
    
//////////////////////////////////////////////////////////////////////////////////////////

    
    static void (^showResule)(int) = ^(int i) {
        if (i > 0) {
            puts("Hello world");
            showResule(--i);
        }
    };
    showResule(3);
    
//////////////////////////////////////////////////////////////////////////////////////////
    /*    通常情况下，如果您希望将块作为参数传给函数或方法，则可以使用内联方式创建 。
     
     下面的例子判断 NSSet对象中是否包含某个局部变量指定的单词。如果包含，另外一个局部变量(found) 将被设置成为YES（然后停止查找）。在本例中，found被声明为__block 变量。*/
    
    __block BOOL found = NO;
    NSSet *aSet = [NSSet setWithObjects: @"Alpha", @"Beta", @"Gamma", @"X", nil];
    NSString *string = @"gamma";
    
    [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if ([obj localizedCaseInsensitiveCompare:string] == NSOrderedSame) {
            *stop = YES;
            found = YES;
        }
    }];
    
    printf("found:%d\n", found);
}


@end
