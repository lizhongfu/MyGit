//
//  AsyncSocketDemoViewController.m
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import "AsyncSocketDemoViewController.h"

AsyncSocket *asyncSocket = nil;

@implementation AsyncSocketDemoViewController

//@synthesize asyncSocket;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		[self retain];
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void) SendUdpData
{
    const char buf[] = "\x00\x04\x00\x70\x00\x00\x01\x01";
    NSData* sendPack = [NSData dataWithBytes:buf length:8];
    BOOL ok = [asyncUdpSocket sendData:sendPack toHost:@"255.255.255.255" port:8000 withTimeout:-1 tag:0];
    NSLog(@"SendUdpData ok =%d", ok);
}

- (void) createudpgetip
{
    asyncUdpSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    [asyncUdpSocket retain];
    [asyncUdpSocket enableBroadcast:YES error:nil];
    [asyncUdpSocket bindToPort:8000 error:nil];
    [asyncUdpSocket receiveWithTimeout:-1 tag:0]; 
    assert(sendTimer == nil);
    sendTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(SendUdpData) userInfo:nil repeats:YES];
    
    asyncSocket = [[AsyncSocket alloc] initWithDelegate:self];
    [asyncSocket readDataWithTimeout:(NSTimeInterval)-1 tag:(long)0];
    [asyncSocket retain];
    NSLog(@"create asyncSocket: %@", asyncSocket);
}

-(void) onUdpSocket:(AsyncUdpSocket*)sock didReceiveData:(NSData*)data withTag:(long)tag fromHost:(NSString*)host port:(UInt16)port
{
    NSInteger len = [data length];
    Byte *byteData = (Byte*)malloc(len);
    memcpy(byteData, [data bytes], len);
    if (*(byteData+2)==0x80 && *(byteData+3)==0x70)
    {
        NSLog(@"1 onUdpSocket host =%@, port = %d", host, port);
//        NSLog(@"byteData=%0x", *(byteData+i));
    }
    NSLog(@"received data: %@",[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]); 
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createudpgetip];
}
/*
- (void) awakeFromNib {
	NSLog(@"awakeFromNib");
	//[pauseButton setDelegate:self];
}
 */

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
	NSLog(@"AsyncSocket didConnectToHost: %@ port: %d",host, port);
    
    [sock readDataWithTimeout:-1 tag:0];
    asyncSocket = sock;
    
//	[sock readDataWithTimeout:0.5 tag:0];
	
	//NSString *welcomeMsg = @"currentsong\r\n"; 
//	NSData *writeData = [@"currentsong\r\n" dataUsingEncoding:NSUTF8StringEncoding]; 
//	[sock writeData:writeData withTimeout:-1 tag:0];
//	[sock readDataWithTimeout:0.5 tag:0];
	//[mySocket readDataToData:[AsyncSocket CRLFData] withTimeout:-1.0 tag:0];
	
	//NSLog(@"1mySocket: %@", mySocket);
	//mySocket = sock;
	//NSLog(@"2mySocket: %@", mySocket);
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*)data withTag:(long)tag {
	//NSString* result;
    
    [sock readDataWithTimeout:-1 tag:0];
    asyncSocket = sock;
    
	NSString* result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"got data: %@", result);
}

- (void)sendPause {
    BOOL isSuccess;
    NSError *err = nil;
    NSLog(@"asyncSocket: %@", asyncSocket);
    isSuccess = [asyncSocket connectToHost:@"192.168.1.105" onPort:(UInt16)8001 error:&err];
    NSLog(@"2 [asyncSocket isConnected]=%d, isSuccess=%d", [asyncSocket isConnected], isSuccess);
    
    if (isSuccess)
    {
        NSMutableData *data = [[NSMutableData alloc]initWithCapacity:5]; 
        [data appendBytes:"\x00\x01\x01\x03" length:4];
        [data appendBytes:"\x41" length:1];
        [asyncSocket writeData:data withTimeout:-1 tag:0];
        //	[asyncSocket readDataWithTimeout:0.5 tag:0];
    }
}

- (IBAction)touchPauseButton:(id)sender {
	NSLog(@"<TouchPauseButton>");
	[self sendPause];
}

-(void)onSocketDidDisconnect:(AsyncSocket *)sock {
	NSLog(@"onSocketDidDisconnect: sock: %@",sock);
}

-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
	NSLog(@"onSocket:willDisconnectWithError: %@",err);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"viewDidUnload");
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	NSLog(@"viewController dealloc");
	[asyncSocket release];
	[self release];
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{	
    CGPoint firstPoint;
    // get current position of all touches
	NSArray *touchArray = [touches allObjects];
    //    startTime = [[NSDate alloc] init];
	
    finished = NO;
	multitouch = (touches.count > 1);
	pointCount = 1;
    
    // show positon of each touch
	for (UITouch *touch in touchArray)
    {
		firstPoint = [touch locationInView: self.view];
        midPoint = firstPoint;
        NSLog(@"Began (%f, %f)", firstPoint.x, firstPoint.y);

    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    // get current position of all touches
	NSArray *touchArray = [touches allObjects];
    
    pointCount++;
    
    //	if (finished) return;
    // Handle multitouch
	if (touches.count > 1)
	{
        multitouch = YES;
        finished = YES;
    }else
    {
        multitouch = NO;
        finished = YES;
    }
    
    UIButton* button=nil;
    NSArray *buttonArray=nil;
    for(int i=0; i<[[self.view subviews] count]; i++)
    {
        if (touches.count>1) break;
        button = [[self.view subviews] objectAtIndex:i];
        if ([[button description] hasPrefix:@"<UIButton"] == YES)
        {
            buttonArray = [NSArray arrayWithObjects:button, nil];
            //            NSLog(@"Move is UILabel subview count=%d,view=%@", i, buttonArray);
        }
    }
    for (UITouch *touch in touchArray)
    {
        if (touches.count>1) break;
        if (buttonArray==nil || ([buttonArray count]==0) ) break;
        //        NSLog(@"touchArray count=%d, buttonArray count=%d", [touchArray indexOfObject: touch], [buttonArray count]);
        CGPoint point = [touch locationInView: self.view];
        CGPoint newp = {point.x-40, point.y-40};
        if ([buttonArray count] <= [touchArray indexOfObject: touch]) return;
        UIButton *whitePoint = (UIButton *)[buttonArray objectAtIndex: [touchArray indexOfObject: touch]];
        // set new frame
        CGRect frame = whitePoint.frame;
        frame.origin = newp;
        whitePoint.frame = frame;
    }
    
    NSMutableData* data = [[NSMutableData alloc]initWithCapacity:MOUSE_ALL_LEN];
    [data appendBytes:MOUSE_HEAD length:MOUSE_HEAD_LEN];
    //    NSTimeInterval intervalTimeA = [startTime timeIntervalSinceNow];
    // show positon of each touch
	for (UITouch *touch in touchArray)
    {
		CGPoint point = [touch locationInView: self.view];
        NSLog(@"point=[%f, %f], midPoint=[%f,%f]", point.x, point.y, midPoint.x, midPoint.y);
        short x = (point.x-midPoint.x);
        short y = (point.y-midPoint.y);
        NSLog(@"move (%hi, %hi)", x, y);
        
        char *data_xx = malloc(2); 
        short* coorx = (short*)data_xx;
        *coorx = LittleToBig(x);
        NSData *nsdata_x=[NSData dataWithBytes:data_xx length:2];
        //        NSLog(@"nsdata_x=%@", nsdata_x);
        
        char *data_yy = malloc(2); 
        short* coory = (short*)data_yy;
        *coory = LittleToBig(y);
        NSData *nsdata_y=[NSData dataWithBytes:data_yy length:2];
        //        NSLog(@"nsdata_y=%@", nsdata_y);
        
        //if (fabs(intervalTimeA)>0.1667) // 6ci/s
        //        if(fabs(intervalTimeA>0.05)) // 20ci/s
        //if (fabs(intervalTimeA)>0.1) //10ci/s 
        {
            //            intervalTimeA = 0;
            //            startTime = [[NSDate alloc] init];
            
            [data appendBytes:"\x01" length:1];
            [data appendBytes:[nsdata_x bytes] length:2];
            [data appendBytes:[nsdata_y bytes] length:2];
            [data appendBytes:"\x00\x00" length:2];
            [asyncSocket writeData:data withTimeout:-1 tag:0];
            midPoint = point;
        }
        
    }
    [data release];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint endPoint;
    // get current position of all touches
	NSArray *touchArray = [touches allObjects];
    
    NSMutableData* data = [[NSMutableData alloc]initWithCapacity:MOUSE_ALL_LEN];
    [data appendBytes:MOUSE_HEAD length:MOUSE_HEAD_LEN];
    NSMutableData* data2 = [[NSMutableData alloc]initWithCapacity:MOUSE_ALL_LEN];
    [data2 appendBytes:MOUSE_HEAD length:MOUSE_HEAD_LEN];
    
    // show positon of each touch
	for (UITouch *touch in touchArray)
    {
        endPoint = [touch locationInView: self.view];
    }
    
    UIView* button;
    for(int i=0; i<[[self.view subviews] count]; i++)
    {
        if (touches.count>1) break;
        button = [[self.view subviews] objectAtIndex:i];
        if ([[button description] hasPrefix:@"<UIButton"] == YES)
        {
            [button removeFromSuperview];
            NSLog(@"End remove is UIButton");
        }
    }
    
    short x = (endPoint.x-midPoint.x);
    short y = (endPoint.y-midPoint.y);
    
    //    NSLog(@"ended (x, y)=(%hi, %hi)", x, y);
    
    char *data_xx = malloc(2);
    short* coorx = (short*)data_xx;
    *coorx = LittleToBig(x);
    NSData *nsdata_x=[NSData dataWithBytes:data_xx length:2];
    //    NSLog(@"nsdata_x=%@", nsdata_x);
    
    char *data_yy = malloc(2); 
    short* coory = (short*)data_yy;
    *coory = LittleToBig(y);
    NSData *nsdata_y=[NSData dataWithBytes:data_yy length:2];
    //    NSLog(@"nsdata_y=%@", nsdata_y);

        // was not detected as a swipe
        if (!finished && !multitouch) 
        {
            // tap or double tap
            if (pointCount < 3) 
            {
                //单击
                if ([[touches anyObject] tapCount] == 1) 
                {
                    [data appendBytes:"\x03" length:1];
                    [data appendBytes:"\x00\x00" length:2];
                    [data appendBytes:"\x00\x00" length:2];
                    [data appendBytes:"\x00\x00" length:2];
                    [asyncSocket writeData:data withTimeout:-1 tag:0];
                    [data2 appendBytes:"\x04" length:1];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [asyncSocket writeData:data2 withTimeout:-1 tag:0];
                    //                    NSLog(@"UITouchTap");
                    return;
                }
                //双击
                else
                {
                    [data appendBytes:"\x05" length:1];
                    [data appendBytes:"\x00\x00" length:2];
                    [data appendBytes:"\x00\x00" length:2];
                    [data appendBytes:"\x00\x00" length:2];
                    [asyncSocket writeData:data withTimeout:-1 tag:0];
                    [data2 appendBytes:"\x06" length:1];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [data2 appendBytes:"\x00\x00" length:2];
                    [asyncSocket writeData:data2 withTimeout:-1 tag:0];
                    //                    NSLog(@"UITouchDoubleTap");
                    return;
                }
            }
            else
                NSLog(@"UITouchDrag");
        
        [data appendBytes:"\x01" length:1];
        [data appendBytes:[nsdata_x bytes] length:2];
        [data appendBytes:[nsdata_y bytes] length:2];
        [data appendBytes:"\x00\x00" length:2];
        [asyncSocket writeData:data withTimeout:-1 tag:0];
    }
}

@end
