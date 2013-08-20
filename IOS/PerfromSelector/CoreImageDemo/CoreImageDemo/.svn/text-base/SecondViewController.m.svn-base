//
//  SecondViewController.m
//  CoreImageDemo
//
//  Created by Zogful.Lee on 13-3-25.
//  Copyright (c) 2013年 Zogful.Lee. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    CIContext *context;
    CIFilter  *filter;
    CIImage   *beginImage;
    UIImageOrientation orientation;
    
    IBOutlet UIImageView *myImageView;
    IBOutlet UISlider *amountSlider;
}

@property (nonatomic, retain) UISlider *amountSlider;

@end

@implementation SecondViewController
@synthesize amountSlider;

- (void) dealloc
{
    [context release];
    [filter release];
    [beginImage release];
    [amountSlider release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

-(void)logAllFilters {
    NSArray *properties = [CIFilter filterNamesInCategory:
                           kCICategoryBuiltIn];
    NSLog(@"%@", properties);
    for (NSString *filterName in properties) {
        CIFilter *fltr = [CIFilter filterWithName:filterName];
        NSLog(@"%@：%@", filterName, [fltr attributes]);
    }
}

- (void) viewWillAppear:(BOOL)animated
{
//    [self logAllFilters];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSLog(@"%@", [NSDictionary dictionaryWithObject:@"1" forKey:@"software_renderer"]);
    
    myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    [self.view addSubview:myImageView];
    [myImageView release];
	
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"png"];
    NSURL *fileNameAndPath = [NSURL fileURLWithPath:filePath];
    
    beginImage = [[CIImage imageWithContentsOfURL:fileNameAndPath] retain];
    
    filter = [[CIFilter filterWithName:@"CISepiaTone" keysAndValues: kCIInputImageKey, beginImage,
              @"inputIntensity", @0.8, nil] retain];
    CIImage *outputImage = [filter outputImage];
    
    context = [[CIContext contextWithOptions:nil] retain];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
  
    UIImage *newImage = [UIImage imageWithCGImage:cgimg];
    myImageView.image = newImage;
    
    CFRelease(cgimg);
}

#pragma mark -
#pragma mark UIImagePickerController

- (IBAction)loadPhoto:(id)sender
{
    UIImagePickerController *pickerC = [[UIImagePickerController alloc] init];
    pickerC.delegate = self;
    [self presentViewController:pickerC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *gotImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    orientation = gotImage.imageOrientation;
    
    beginImage = [CIImage imageWithCGImage:gotImage.CGImage];
    [filter setValue:beginImage forKey:kCIInputImageKey];
    [self amountSliderValueChanged:self.amountSlider];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//那就是当你保存一张照片到相册的时候，即使你退出了这个应用，这个过程仍然可以继续。
//这点可能会导致一些问题，因为GPU在当你切换应用的时候会停止当前的工作。如果照片还没有保存完毕就退出了程序，那可能以后就找不到这个要保存的照片了。
//对于这个问题的解决方法是利用CPU的CIRendering上下文。然而默认设备是GPU，而且GPU比CPU快很多。所以你其实可以创建第二个CIContext，只为了保存这个图片。
- (IBAction)savePhoto:(id)sender {

    CIImage *saveToSave = [filter outputImage];
   
    CIContext *softwareContext = [CIContext
                                  contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)} ];
   
    CGImageRef cgImg = [softwareContext createCGImage:saveToSave
                                             fromRect:[saveToSave extent]];//渲染整个图像
   
    ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:cgImg
                                 metadata:[saveToSave properties]
                          completionBlock:^(NSURL *assetURL, NSError *error) {
                              // 5
                              CGImageRelease(cgImg);
                          }];
}

#pragma mark -
#pragma mark UISlider

- (IBAction)amountSliderValueChanged:(UISlider *)slider
{
    float slideValue = slider.value;
    
    [filter setValue:@(slideValue)
              forKey:@"inputIntensity"];
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage
                                     fromRect:[outputImage extent]];
    
    
    //保存朝向
    UIImage *newImage = [UIImage imageWithCGImage:cgimg scale:1.0 orientation:orientation];
//    UIImage *newImage = [UIImage imageWithCGImage:cgimg];
    
    myImageView.image = newImage;
    
    CGImageRelease(cgimg);
}

@end
