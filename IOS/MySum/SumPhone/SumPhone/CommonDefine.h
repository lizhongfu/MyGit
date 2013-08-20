//
//  CommonDefine.h
//  TCM
//
//  Created by Zogful Lee on 12-4-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


/**************************项目通用***********************/

//	是否输出内存分配释放信息
#define OUTPUT_ALLOC_MSG	0

//  定义默认的框架大小
#define BaseFrame CGRectMake(0, 0, 320, 372)
#define MainScreenFrame [[UIScreen mainScreen] bounds]

//打印信息
#define kPrintInfo printf("%s -- %d\n", __FUNCTION__, __LINE__)

//获取图片
#define GetImageByNameAndType(NAME, TYPE) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:NAME] ofType:TYPE]]

//播放声音
#define playSound(soundId) \
AudioServicesPlaySystemSound(soundId);\
NSString *path = [NSString stringWithFormat:@"%@%@", [[NSBundle mainBundle] resourcePath], @"/info.wav"];\
SystemSoundID soundID;\
NSURL *filePath = [NSURL fileURLWithPath:path isDirectory:NO];\
AudioServicesCreateSystemSoundID((CFURLRef)filePath, &soundID);\


/**************************Views***********************/

//剃度，画圆，声音
#define OUTPUT_CoreGraphics_MainViewController 0



//////////////////  Animation  ///////////////////////////

//>>>>>>添加Label动画
#define LabelTag 100
#define labelXOffset 10
#define labelYOffset 80
#define labelWidth 60
#define labelHeight 30


//////////////////  基本控件  ///////////////////////////

//>>>>>>图片的各种处理
#define BottomBarHeight 88
#define EffectSelectTag 10
#define TranslateSelect 11



/**************************Data***********************/





/**************************Other***********************/
