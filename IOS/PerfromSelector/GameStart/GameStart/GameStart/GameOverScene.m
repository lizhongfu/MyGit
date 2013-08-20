//
//  GameOverScene.m
//  GameStart
//
//  Created by Zogful.Lee on 13-1-23.
//
//

#import "GameOverScene.h"
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

@implementation GameOverScene
@synthesize layer = _layer;

- (void)dealloc {
    
    [_layer release]; _layer =nil;
    
    [super dealloc];
}

- (id) init {
    
    if (self = [super init]) {
        
        self.layer = [GameOverLayer node];
        
        [self addChild:_layer];
    }
    
    return self;
}

@end


@implementation GameOverLayer
@synthesize label = _label;
@synthesize highscores;

- (void) dealloc {

    [_label release]; _label = nil;
    [highscores release];
    
    [super dealloc];
}

- (id) init {
    
    if (self = [super initWithColor:ccc4(255, 255, 255, 255)]) {
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        self.label = [CCLabelTTF labelWithString:@"" fontName:@"Arial" fontSize:62];
        
        _label.color = ccc3(0, 0, 0);
        _label.position = ccp(winSize.width/2, winSize.height-100);
        [self addChild:_label];
        
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [[SimpleAudioEngine sharedEngine] playEffect:@"success.mp3"];
        
        NSString *_lasts = (NSString *)[ResourceHelper getUserDefaults:kLeve];
        NSString *_lastScore = [[NSString alloc] initWithFormat:@"CURRENT:     %@", _lasts];
        
        NSString *_highs = (NSString *)[ResourceHelper getUserDefaults:kHighLeve];
        if (_highs == nil) {
            NSLog(@"_highs is nil");
            [ResourceHelper setUserDefaults:_lasts forKey:kHighLeve];
        }
        NSString *_hignScore = [[NSString alloc] initWithFormat:@"HIGHLEVEL:   %@", _highs];
        
        if (([_lasts intValue] - [_highs intValue]) > 0) {
            [ResourceHelper setUserDefaults:_lasts forKey:kHighLeve];
        }
        
        NSString *ifGameContinue = (NSString *)[ResourceHelper getUserDefaults:kGameContinue];
        if ([ifGameContinue isEqualToString:@"YES"]) {
            
            //  3秒后开始下一级数
            [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:3], [CCCallFunc actionWithTarget:self selector:@selector(gameOverDone)], nil]];
        } else {
            
            CCLabelTTF *lastscores = [CCLabelTTF labelWithString:@"0" fontName:@"Arial" fontSize:30];
            lastscores.color = ccc3(0, 0, 0);
            lastscores.position = ccp(winSize.width/2, winSize.height-200);
            [self addChild:lastscores];
            
            [lastscores setString:_lastScore];
            id a1 = [CCScaleTo actionWithDuration:0.2f scaleX:1.5f scaleY:0.8f];
            id a2 = [CCScaleTo actionWithDuration:0.2f scaleX:1.0f scaleY:1.0f];
            id a3 = [CCSequence actions:a1,a2,a1,a2,a1,a2,nil];
            [lastscores runAction:a3];
            
        
            NSString *_hignScore = [[NSString alloc] initWithFormat:@"HIGHLEVEL:   %@", _highs];
            if (_highs == nil) {
                _hignScore = @"HIGHLEVEL:   1";
            }
            
            self.highscores = [CCLabelTTF labelWithString:_hignScore fontName:@"Arial" fontSize:30];
            highscores.color = ccc3(0, 0, 0);
            highscores.position = ccp(winSize.width/2, winSize.height-150);
            [self addChild:highscores];
        
            CCMenuItemImage *menu_restart = [CCMenuItemImage itemWithNormalImage:@"restart.png"
                                                                   selectedImage:@"restart.png"
                                                                          target:self
                                                                        selector:@selector(restartGame)];
            
            CCMenu *MyMenu = [CCMenu menuWithItems:menu_restart,nil];
            [MyMenu alignItemsHorizontallyWithPadding:10];
            MyMenu.position = ccp(winSize.width/2, winSize.height-290);
            [self addChild:MyMenu];
        }
        
        [_lastScore release];
        [_hignScore release];
    }
    
    return self;
}

- (void)restartGame {
    //  失败之后重置级数
    [ResourceHelper setUserDefaults:@"1" forKey:kLeve];
	[[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

- (void)gameOverDone {
    
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

@end















