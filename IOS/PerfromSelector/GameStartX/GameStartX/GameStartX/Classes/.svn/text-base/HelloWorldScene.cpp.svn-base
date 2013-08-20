#include "HelloWorldScene.h"
#include "SimpleAudioEngine.h"

using namespace cocos2d;
using namespace CocosDenshion;//音频播放命名空间

HelloWorld::HelloWorld()
{
    
}

HelloWorld::~HelloWorld(void)
{
    for (int i = 0; i < 4; i++) {
        
//        释放数组中的元素
        CC_SAFE_RELEASE(walkAnimations[i]);
    }
    
//    释放数组本身
    CC_SAFE_DELETE_ARRAY(walkAnimations);
    
    this->unscheduleAllSelectors();
}

CCScene* HelloWorld::scene()
{
	CCScene *scene = CCScene::node();
	
	HelloWorld *layer = HelloWorld::node();
	scene->addChild(layer);

	return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
	//////////////////////////////
	// 1. super init first
	if ( !CCLayer::init() )
	{
		return false;
	}

	/////////////////////////////
	// 2. add a menu item with "X" image, which is clicked to quit the program
	//    you may modify it.

	// add a "close" icon to exit the progress. it's an autorelease object
	CCMenuItemImage *pCloseItem = CCMenuItemImage::itemFromNormalImage(
										"CloseNormal.png",
										"CloseSelected.png",
										this,
										menu_selector(HelloWorld::menuCloseCallback) );
	pCloseItem->setPosition( ccp(CCDirector::sharedDirector()->getWinSize().width - 20, 20) );

	// create menu, it's an autorelease object
	CCMenu* pMenu = CCMenu::menuWithItems(pCloseItem, NULL);
	pMenu->setPosition( CCPointZero );
	this->addChild(pMenu, 1);

	map = CCTMXTiledMap::tiledMapWithTMXFile("0.tmx");
    this->addChild(map);
    
//    对地图的每个图层的文理开启抗锯齿效果，解决地图滚动发生抖动
    CCArray *pChildrenArray = map->getChildren();
    CCSpriteBatchNode *child = NULL;
    CCObject *pObject = NULL;
    CCARRAY_FOREACH(pChildrenArray, pObject)//遍历数组
    {
        child = (CCSpriteBatchNode *) pObject;
        if (!child) break;
        
        child->getTexture()->setAntiAliasTexParameters();
    }
    
    walkAnimations = new CCAnimation*[4];//数组指针
    walkAnimations[0] = creatAnimationByDirection(kDown);
    walkAnimations[1] = creatAnimationByDirection(kLeft);
    walkAnimations[2] = creatAnimationByDirection(kRight);
    walkAnimations[3] = creatAnimationByDirection(kUp);
    
    heroSprite = CCSprite::spriteWithSpriteFrame(walkAnimations[0]->getFrames()->getObjectAtIndex(0));
    heroSprite->setAnchorPoint(CCPointZero);
    heroSprite->setPosition(ccp(1, 11));
    this->addChild(heroSprite);

    CCMenuItem *down = CCMenuItemFont::itemFromString("down", this, menu_selector(HelloWorld::menuCallBackMove));
    CCMenuItem *left = CCMenuItemFont::itemFromString("left", this, menu_selector(HelloWorld::menuCallBackMove));
    CCMenuItem *right = CCMenuItemFont::itemFromString("right", this, menu_selector(HelloWorld::menuCallBackMove));
    CCMenuItem *up = CCMenuItemFont::itemFromString("up", this, menu_selector(HelloWorld::menuCallBackMove));
    
    CCMenu *menu = CCMenu::menuWithItems(down, left, right, up, NULL);
    down->setTag(kDown);
    left->setTag(kLeft);
    right->setTag(kRight);
    up->setTag(kUp);
    
    menu->alignItemsHorizontallyWithPadding(50);
    this->addChild(menu);
    
    schedule(schedule_selector(HelloWorld::update));
	
	return true;
}

cocos2d::CCAnimation *HelloWorld::creatAnimationByDirection(HeroDirection direction)
{
    CCTexture2D *heroTexture = CCTextureCache::sharedTextureCache()->addImage("hero.png");
    
    CCSpriteFrame *frame0, *frame1, *frame2, *frame3;
    frame0 = CCSpriteFrame::frameWithTexture(heroTexture, cocos2d::CCRectMake(32*0, 32*direction, 32, 32));
    frame1 = CCSpriteFrame::frameWithTexture(heroTexture, cocos2d::CCRectMake(32*1, 32*direction, 32, 32));
    frame2 = CCSpriteFrame::frameWithTexture(heroTexture, cocos2d::CCRectMake(32*2, 32*direction, 32, 32));
    frame3 = CCSpriteFrame::frameWithTexture(heroTexture, cocos2d::CCRectMake(32*3, 32*direction, 32, 32));
    
    CCMutableArray<CCSpriteFrame *> *animFrames = new CCMutableArray<CCSpriteFrame *>(4);
    animFrames->addObject(frame0);
    animFrames->addObject(frame1);
    animFrames->addObject(frame2);
    animFrames->addObject(frame3);
    
    CCAnimation *animation = new CCAnimation();
    animation->initWithFrames(animFrames, 0.2f);
    animFrames->release();
    
    return animation;
}

void HelloWorld::menuCallBackMove(CCObject *pSender)
{
    if (isHeroWalking) {
        return;
    }
    
    CCNode *node = (CCNode *) pSender;
    int targetDirection = node->getTag();//行走的方向
    
    CCPoint moveByPosition;
    
    switch (targetDirection) {
        case kDown:
            moveByPosition = CCPoint(0, -32);
            break;
        case kLeft:
            moveByPosition = CCPoint(-32, 0);
            break;
        case kRight:
            moveByPosition = CCPoint(32, 0);
            break;
        case kUp:
            moveByPosition = CCPoint(0, 32);
            break;
        default:
            break;
    }
    
    CCPoint targetPosition = ccpAdd(heroSprite->getPosition(), moveByPosition);
    if (checkCollosion(targetPosition) == kWall) {
        setFaceDirection((HeroDirection)targetDirection);
        return;
    }
    
//    利用CCSpawn将行走与移动同时执行
    CCAction *action = CCSequence::actions(
                        CCSpawn::actions(
                                         CCAnimate::actionWithAnimation(walkAnimations[targetDirection], false),
                                         CCMoveBy::actionWithDuration(0.28f, moveByPosition), NULL),
                                         CCCallFuncND::actionWithTarget(this, callfuncND_selector(HelloWorld::onWalkDone), (void *)targetDirection),
                                           NULL);
    
    heroSprite->runAction(action);
    isHeroWalking = true;
}

void HelloWorld::setFaceDirection(HeroDirection direction)
{
	heroSprite->setTextureRect(CCRectMake(0, 32*direction, 32, 32));
}

void HelloWorld::onWalkDone(CCObject* pSender, void *data)
{
    int direction = (int) data;
    setFaceDirection((HeroDirection)direction);
    
    isHeroWalking = false;
    
    setSceneScrollPosition(heroSprite->getPosition());
}

void HelloWorld::menuCloseCallback(CCObject* pSender)
{
	CCDirector::sharedDirector()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
	exit(0);
#endif
}

//从Tilemap坐标转换成cocos2d－x坐标
CCPoint HelloWorld::positionForTileCoord(CCPoint tileCoord)
{
    CCPoint pos = CCPoint((tileCoord.x / map->getTileSize().width),
                          ((map->getMapSize().height - tileCoord.y - 1) * map->getTileSize().height));
    
    return pos;
}

//从cocos2d－x坐标转换成Tilemap坐标
CCPoint HelloWorld::tileCoordForPosition(CCPoint position)
{
    int x = position.x / map->getTileSize().width;
	int y = (((map->getMapSize().height - 1) * map->getTileSize().height) - position.y) / map->getTileSize().height;
	return ccp(x, y);
}

void HelloWorld::setSceneScrollPosition(CCPoint position)
{
    CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
    
//    计算地图Tilemap的尺寸，单位是像素
    CCSize mapSizeInPixel = CCSizeMake(map->getMapSize().width * map->getTileSize().width,
                                       map->getMapSize().height * map->getTileSize().height);
    
//    取勇士当前x坐标和屏幕中心点x的最大值，如果勇士的x值较大，则会滚动
    float x = MAX(position.x, screenSize.width/2.0f);
    float y = MAX(position.y, screenSize.height/2.0f);
    
//    地图总宽度大于屏幕宽度的时候才有可能滚动
    if (mapSizeInPixel.width > screenSize.width) {
//        场景滚动的最大距离不能超过地图总宽度减去屏幕宽度的／2 ,要联想实际场景才能明白
        x = MIN(x, mapSizeInPixel.width - screenSize.width/2.0f);
    }
    
    if (mapSizeInPixel.height > screenSize.height) {
        y = MIN(y, mapSizeInPixel.height - screenSize.height/2.0f);
    }
    
//    勇士的实际位置
    CCPoint heroPosition = ccp(x, y);
    
    CCPoint screenCenter = ccp(screenSize.width/2.0f, screenSize.height/2.0f);
    
//    计算勇士实际位置和中心点位置的距离
    CCPoint scrollPosition = ccpSub(screenCenter, heroPosition);
    
//    将精灵移动到相映位置
    this->setPosition(scrollPosition);
    CCLog("%f, %f", scrollPosition.x, scrollPosition.y);
}

void HelloWorld::update(ccTime dt)
{
    if (isHeroWalking) {
        setSceneScrollPosition(heroSprite->getPosition());
    }
}

CollisionType HelloWorld::checkCollosion(CCPoint heroPosition)
{
    CCPoint tileCoord = tileCoordForPosition(heroPosition);
    
//    如果勇士超出地图边界，则阻止其移动
    if (heroPosition.x < 0 || tileCoord.x > map->getMapSize().width - 1 ||
        tileCoord.y < 0 || tileCoord.y > map->getMapSize().height - 1) {
        return kWall;
    }
    
    int tileGid = map->layerNamed("wall")->tileGIDAt(tileCoord);
    
//    没有图块则返回0，如果tileGid不为0,表明遇到墙了。
    if (tileGid) {
        return kWall;
    }
    
    return kNone;
}







