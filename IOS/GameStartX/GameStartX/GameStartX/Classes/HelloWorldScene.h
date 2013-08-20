#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"

typedef enum
{
    kDown  = 0,
    kLeft  = 1,
    kRight = 2,
    kUp    = 3
} HeroDirection;

typedef enum
{
    kNone = 1, //可以通过
    kWall,     //墙
    kEnemy     //敌人
} CollisionType;

using namespace cocos2d;

class HelloWorld : public CCLayer
{
public:
    
    //    动作数组
    CCAnimation **walkAnimations;
    
    //    英雄坐标
    CCSprite *heroSprite;
    
    //    地图
    CCTMXTiledMap *map;
    
    //    精灵是否在移动
    bool isHeroWalking;
    
    
//    构造函数与析构函数
    HelloWorld();
    ~HelloWorld();
    
	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();  

	// there's no 'id' in cpp, so we recommand to return the exactly class pointer
	static cocos2d::CCScene* scene();
	
//	关闭按钮动作方法
	virtual void menuCloseCallback(CCObject* pSender);
    
//    英雄行走结束后的回调方法
    virtual void onWalkDone(CCObject* pSender, void *data);
    
//    根据方向来建立动画
    virtual CCAnimation *creatAnimationByDirection(HeroDirection direction);
    
//    点击方向按钮的相映方法
    virtual void menuCallBackMove(CCObject *pSender);
    
//    设置英雄的面向方向
    void setFaceDirection(HeroDirection direction);
    
//    设置地图移动
    void setSceneScrollPosition(CCPoint position);
    
//    cocos2d-x 与 Tilemap 坐标互相转换
    CCPoint tileCoordForPosition(CCPoint tileCoord);
    CCPoint positionForTileCoord(CCPoint position);
    
//    定时期方法
    void update(ccTime dt);
    
//    检车碰撞方法
    CollisionType checkCollosion(CCPoint heroPosition);
    
	// implement the "static node()" method manually
    //    LAYER的静态创建方法
	LAYER_NODE_FUNC(HelloWorld);
};

#endif // __HELLOWORLD_SCENE_H__
