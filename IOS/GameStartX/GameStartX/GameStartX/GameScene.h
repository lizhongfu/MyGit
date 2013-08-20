//
//  GameScene.h
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#ifndef __GAMESCENE_H_
#define __GAMESCENE_H_

#include "MTGame.h"

using namespace cocos2d;

class GameScene : public CCScene
{
public:
    
    GameScene(void);
    ~GameScene(void);
    
//    静态方法用于创建新的游戏主界面的实例
    static CCScene *playNewGame();
    
//    初始化函数
    virtual bool init();
    
//    Scene的静态创建方法
    SCENE_NODE_FUNC(GameScene);
};

#endif