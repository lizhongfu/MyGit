//
//  GameScene.m
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#include "GameScene.h"


GameScene::GameScene(void)
{
    
}

GameScene::~GameScene(void)
{
    
}

bool GameScene::init()
{
//    新建一个GameLayer实例
    GameLayer *gameLayer = (GameLayer *)GameLayer::node();
    this->addChild(gameLayer, kGameLayer, kGameLayer);
    
    ControlLayer *controlLayer = (ControlLayer *)ControlLayer::node();
    this->addChild(controlLayer, kControlLayer, kControlLayer);
    
    return true;
}

CCScene* GameScene::playNewGame()
{
    GameScene *scene = NULL;
    do {
        scene = GameScene::node();
        CC_BREAK_IF(! scene);
    } while (0);
    
    return scene;
}









