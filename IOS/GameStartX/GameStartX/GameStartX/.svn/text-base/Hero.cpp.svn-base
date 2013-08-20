//
//  Hero.cpp
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-4.
//
//

#include "Hero.h"

Hero::Hero()
{
    
}

Hero::~Hero()
{
    
}

bool Hero::heroInit()
{
//    heroSprite = CCSprite::spriteWithSpriteFrame();
    heroSprite->setAnchorPoint(CCPointZero);
    this->addChild(heroSprite);
    
    isHeroMoving = false;
    
    return true;
}

Hero* Hero::heroWithinLayer()
{
//    调用构造函数
    Hero *pRet = new Hero();
    
    if (pRet && pRet->heroInit())
    {
        pRet->autorelease();
        return pRet;
    }
    
    CC_SAFE_DELETE(pRet);
    return NULL;
}

void Hero::move(HeroDirection direction)
{
    if (isHeroMoving)
        return;
    
    CCPoint moveByPosition;
    switch (direction) {
        case kDown:
            moveByPosition = ccp(0, -32);
            break;
        case kLeft:
            moveByPosition = ccp(-32, 0);
            break;
        case kRight:
            moveByPosition = ccp(32, 0);
            break;
        case kUp:
            moveByPosition = ccp(0, 32);
            break;
        
        default:
            break;
    }
    
//    计算目标坐标，用当前勇士坐标加上移动坐标
    targetPosition = ccpAdd(this->getPosition(), moveByPosition);
    
//    if (che) {
//        <#statements#>
//    }
}
















































