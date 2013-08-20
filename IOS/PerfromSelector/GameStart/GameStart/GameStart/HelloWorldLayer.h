//
//  HelloWorldLayer.h
//  GameStart
//
//  Created by Zogful.Lee on 13-1-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

enum {
    kPlayer = 100,
    kScoreLabel
};

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
    NSMutableArray *_targets;
    NSMutableArray *_projectiles;
    
    int _projectilesDestroyed;
    BOOL isGameStart;
    CCLabelBMFont *leveLabel;
    CCSprite *_player;
}

@property (nonatomic, retain) CCSprite *player;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

+ (void) refreshLeve;

@end
