//
//  HelloWorldLayer.m
//  GameStart
//
//  Created by Zogful.Lee on 13-1-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
#import "GameOverScene.h"
#import "AppDelegate.h"

#import "ShatteredSprite.h"
#import "CCShake.h"
#import "CCRemoveAndCleanupAction.h"
#import "CCParticleEffectGenerator.h"

#import <math.h>

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer
@synthesize player = _player;

- (void) dealloc
{
    [_targets release]; _targets = nil;
    [_projectiles release]; _projectiles = nil;
    
	[super dealloc];
}

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) )
    {
        self.isTouchEnabled = NO;
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgMus.mp3"];
        
        _targets = [[NSMutableArray alloc] init];
        _projectiles = [[NSMutableArray alloc] init];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"bgImg.png" rect:CGRectMake(0, 0, winSize.width, winSize.height)];
        bg.position = ccp(winSize.width*0.5, winSize.height*0.5);
        [self addChild:bg];
        
        self.player = [CCSprite spriteWithFile:@"Player3.png" rect:CGRectMake(0, 0, 120, 80)];
        _player.position = ccp(_player.contentSize.width*0.5, winSize.height*0.5);
        [self addChild:_player];
        
        
        CCLabelTTF *leve = [CCLabelTTF labelWithString:@"level:" fontName:@"Marker Felt" fontSize:25];
        leve.position = ccp(winSize.width-leve.contentSize.width/2-50, winSize.height-leve.contentSize.height/2);
        [self addChild:leve];
        
        NSString *leveStr = (NSString *)[ResourceHelper getUserDefaults:kLeve];
        leveLabel = [CCLabelBMFont labelWithString:leveStr fntFile:@"bitmapFont.fnt"];
        [self addChild:leveLabel];
        leveLabel.position = ccp(winSize.width-leveLabel.contentSize.width/2, winSize.height-leveLabel.contentSize.height/2);
        
//        倒计时
        CCLabelTTF *labelnum1 = [CCLabelTTF labelWithString:@"1" fontName:@"Marker Felt" fontSize:64];
        labelnum1.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:labelnum1];
        
        CCLabelTTF *labelnum2 = [CCLabelTTF labelWithString:@"2" fontName:@"Marker Felt" fontSize:64];
        labelnum2.position = ccp(winSize.width/2, winSize.height/2);
        labelnum2.visible = NO;
        [self addChild:labelnum2];
        
        CCLabelTTF *labelnum3 = [CCLabelTTF labelWithString:@"3" fontName:@"Marker Felt" fontSize:64];
        labelnum3.position = ccp(winSize.width/2, winSize.height/2);
        labelnum3.visible = NO;
        [self addChild:labelnum3];
        
        CCLabelTTF *labelnum4 = [CCLabelTTF labelWithString:@"GO" fontName:@"Marker Felt" fontSize:64];
        labelnum4.position = ccp(winSize.width/2, winSize.height/2);
        labelnum4.visible = NO;
        [self addChild:labelnum4];
        
        id ac = [labelnum1 runAction:[CCShow action]];
        id ac0 = [labelnum1 runAction:[CCScaleBy actionWithDuration:0.5 scale:2]];
        id ac1 = [labelnum1 runAction:[CCHide action]];
        
        id ac2 = [labelnum2 runAction:[CCShow action]];
        id ac3 = [labelnum2 runAction:[CCScaleBy actionWithDuration:0.5 scale:2]];
        id ac4 = [labelnum2 runAction:[CCHide action]];
        
        id ac5 = [labelnum3 runAction:[CCShow action]];
        id ac6 = [labelnum3 runAction:[CCScaleBy actionWithDuration:0.5 scale:2]];
        id ac7 = [labelnum3 runAction:[CCHide action]];
        
        id ac8 = [labelnum4 runAction:[CCShow action]];
        id ac9 = [labelnum4 runAction:[CCScaleBy actionWithDuration:0.5 scale:2]];
        id ac10 = [labelnum4 runAction:[CCHide action]];
        
        [labelnum1 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.5], ac, ac0, ac1, nil]];
        [labelnum2 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.0], ac2, ac3, ac4, nil]];
        [labelnum3 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:1.5], ac5, ac6, ac7, nil]];
        [labelnum4 runAction:[CCSequence actions:[CCDelayTime actionWithDuration:2.0], ac8, ac9, ac10, nil]];
        
        [self schedule:@selector(gameLogin:) interval:1.0];
        
        [self schedule:@selector(update:)];
        
        [self schedule:@selector(readyFire:) interval:1.0 repeat:0 delay:2.2];
    }
    
    return self;
}

+ (void) refreshLeve {
    
}

- (void) readyFire:(ccTime) dt {
    [[SimpleAudioEngine sharedEngine] playEffect:@"readybullet.mp3"];
    self.isTouchEnabled = YES;
    isGameStart = YES;
}

- (void) gameLogin:(ccTime) dt {
    
    if (isGameStart) {
        [self addTarget];
    }
}

- (void) addTarget {
    
    NSString *targetName = [NSString stringWithFormat:@"Target%d.png", ((arc4random() % 4) + 1)];
    
    CCSprite *target = [CCSprite spriteWithFile:targetName rect:CGRectMake(0, 0, 102, 75)];
    target.tag = 1;
    [_targets addObject:target];
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    float minY = target.contentSize.height*0.5;
    float maxY = winSize.height - target.contentSize.height*0.5;
    int rangeY = maxY - minY;
    float actualY = (arc4random() % rangeY) + minY;
    target.position = ccp(winSize.width + target.contentSize.width*0.5, actualY);
    [self addChild:target];
    
    int leve = [(NSString *)[ResourceHelper getUserDefaults:kLeve] intValue];
    
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration - leve*0.05;
    
    id actionMove = [CCMoveTo actionWithDuration:actualDuration position:ccp(-target.contentSize.width/2, actualY)];
    
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)];
    
    [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) spriteMoveFinished:(id) sender {
    
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite != nil) {

        if (sprite.tag == 1) {
            
            [_targets removeObject:sprite];
            
            [ResourceHelper setUserDefaults:@"NO" forKey:kGameContinue];
            
            GameOverScene *gameOverScene = [GameOverScene node];
            [gameOverScene.layer.label setString:@"You Lose"];
            [[CCDirector sharedDirector] replaceScene:gameOverScene];
        } else if (sprite.tag == 2) {
            [_projectiles removeObject:sprite];
        }
        
        [self removeChild:sprite cleanup:YES];
    }

}

- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"fire.mp3"];
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if (CGRectContainsPoint(CGRectMake(0, 0, _player.contentSize.width*0.5, winSize.height), location)) {
        return;
    }
    
    //旋转精灵
    _player.rotation = -atan((location.y-_player.position.y)/(location.x-_player.position.x)) * 57.3;
    
//    _player.rotation = 90;
    
    NSLog(@"atan:%f", atan((location.y-_player.position.y)/(location.x-_player.position.x)) * 57.3);
    
    CCSprite *projectile = [CCSprite spriteWithFile:@"Projectile1.png" rect:CGRectMake(0, 0, 20, 20)];
    projectile.position = ccp(_player.contentSize.width*0.5, winSize.height*0.5+10);
    projectile.tag = 2;
    [_projectiles addObject:projectile];
    
    int offX = location.x - projectile.position.x;
    int offY = location.y - projectile.position.y;
    
    if (offX <= 0) return;
    
    [self addChild:projectile];
    
    int realX = winSize.width + (projectile.contentSize.width*0.5);
    float ratio = (float) offY / (float) offX;
    int realY = (realX * ratio) + projectile.position.y;
    CGPoint realDest = ccp(realX, realY);
    
    int offRealX = realX - projectile.position.x;
    int offRealY = realY - projectile.position.y;
    
    float length = sqrtf((offRealX * offRealX) + (offRealY * offRealY));
    float velocity = 480/1;
    float realMoveDuration = length/velocity;
    
    [projectile runAction:[CCSequence actions:[CCMoveTo actionWithDuration:realMoveDuration position:realDest], [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)], nil]];
}

- (void) update:(ccTime) dt {
    
    if (!isGameStart) {
        return;
    }
    
    int leve = [(NSString *)[ResourceHelper getUserDefaults:kLeve] intValue];
    
    NSMutableArray *projectileToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *projectile in _projectiles) {
        CGRect projectileRect = CGRectMake(projectile.position.x - (projectile.contentSize.width*0.5), projectile.position.y - (projectile.contentSize.height*0.5), projectile.contentSize.width, projectile.contentSize.height);
        
        NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        for (CCSprite *target in _targets) {
            CGRect targetRect = CGRectMake(target.position.x - (target.contentSize.width/2), target.position.y - (target.contentSize.height/2), target.contentSize.width, target.contentSize.height);
            
            if (CGRectIntersectsRect(projectileRect, targetRect)) {
                
                int ar = arc4random() % 5;
                NSString *musName = [NSString stringWithFormat:@"die%d.mp3", (ar+1)];
                [[SimpleAudioEngine sharedEngine] playEffect:musName];
                
                [targetsToDelete addObject:target];
                
                [self processExplosionEffectWithCan:target];
            }
        }
        
        for (CCSprite *target in targetsToDelete) {
            [_targets removeObject:target];
            [self removeChild:target cleanup:YES];
            
            _projectilesDestroyed++;
            if (_projectilesDestroyed > (3*leve)) {
                
                [self unschedule:@selector(gameLogin:)];
                
                [ResourceHelper setUserDefaults:@"YES" forKey:kGameContinue];
                //等级增加
                int leve = [(NSString *)[ResourceHelper getUserDefaults:kLeve] intValue];
                [ResourceHelper setUserDefaults:[NSString stringWithFormat:@"%d",++leve] forKey:kLeve];
                
                GameOverScene *gameOverScene = [GameOverScene node];
                [gameOverScene.layer.label setString:@"Waiting..."];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
            }
        }
        if (targetsToDelete.count > 0) {
            [projectileToDelete addObject:projectile];
        }
        
        [targetsToDelete release];
    }
    
    for (CCSprite *projectile in projectileToDelete) {
        [_projectiles removeObject:projectile];
        [self removeChild:projectile cleanup:YES];
    }
    [projectileToDelete release];
}

- (void) runShakeScreenEffect
{
//    [self runAction:[CCShake actionWithDuration:2.0f
//                                      amplitude:ccp(5 + CCRANDOM_0_1() * 5, 5 + CCRANDOM_0_1() * 5)
//                                      dampening:YES]];
    
    [self runAction:[CCShake actionWithDuration:2.0f
                                      amplitude:ccp(3 + CCRANDOM_0_1() * 3, 3 + CCRANDOM_0_1() * 3)
                                      dampening:YES]];
}

- (void) playExplosionSE
{
	[[SimpleAudioEngine sharedEngine] playEffect:@"bomb.wav"];
}

- (void) runEffectAtPosition:(CGPoint)position {
    CCEmitterNode *effectEmitter;
    effectEmitter = [CCParticleEffectGenerator getChaoticFlareEffectEmitter];
    NSAssert(effectEmitter != nil, @"CCEmitterNode is nil.");
    effectEmitter.position = position;
	[self addChild:effectEmitter z:1];
}

//使破碎
- (void) runShatterEffectWithCan:(CCSprite *)can
{
	ShatteredSprite *shatter = [ShatteredSprite shatterWithSprite:[CCSprite spriteWithTexture:[can texture]] piecesX:8 piecesY:8 speed:20.0 rotation:0.2 radial:YES];
	shatter.position = can.position;
	shatter.subShatterPercent = 100;
	[self addChild:shatter];
	[shatter runAction:[CCSequence actions:[CCFadeOut actionWithDuration:1.0], [CCRemoveAndCleanupAction action], nil]];
	[self removeChild:can cleanup:YES];
}

#pragma mark 粒子效果
- (void) processExplosionEffectWithCan:(CCSprite *)can
{
	[self runShakeScreenEffect];
	[self playExplosionSE];
    
    [self runEffectAtPosition:can.position];
    [self runShatterEffectWithCan:can];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
