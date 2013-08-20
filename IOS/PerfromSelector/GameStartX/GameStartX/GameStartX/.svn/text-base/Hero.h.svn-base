//
//  Hero.h
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-4.
//
//

#ifndef GameStartX_Hero_h
#define GameStartX_Hero_h

#include "MTGame.h"

using namespace cocos2d;

class Hero : public CCNode
{
public:
    
    Hero(void);
    ~Hero(void);
    
//    静态方法，用于创建勇士实例
    static Hero* heroWithinLayer();
    
//    初始化方法
    bool heroInit();
    
//    用于显示勇士形象的精灵
    CCSprite *heroSprite;
    
//    标示勇士是否在移动状态
    bool isHeroMoving;
    
//    让勇士向指定的方向移动一格
    void move(HeroDirection direction);
    
//    移动完成后的回调函数
    void onMoveDone(CCNode *pTarget, void* data);
    
//    设置勇士的朝向
    void setFaceDirection(HeroDirection direction);
    
    CCPoint targetPosition;
};

#endif
