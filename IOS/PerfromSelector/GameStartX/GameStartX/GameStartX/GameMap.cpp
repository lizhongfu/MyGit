//
//  GameMap.cpp
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-4.
//
//

#include "GameMap.h"

GameMap::GameMap(void)
{
    
}

GameMap::~GameMap(void)
{
    
}

//返回地板层
CCTMXLayer* GameMap::getFloorLayer()
{
    return floorLayer;
}

//返回墙壁层
CCTMXLayer* GameMap::getWallLayer()
{
    return wallLayer;
}

GameMap* GameMap::gameMapWithTMXFile(const char *tmxFile)
{
//    new一个对象
    GameMap *pRet = new GameMap();
    
//    调用init方法
    if (pRet->initWithTMXFile(tmxFile))
    {
//        调用额外的init方法
        pRet->extraInit();
        
//        将实例放入aotureleasePool，统一由引擎控制对象的生命周期
        pRet->autorelease();
        
        return pRet;
    }
    
    CC_SAFE_DELETE(pRet);
    return NULL;
}

void GameMap::extraInit()
{
//    开启各个图层的纹理抗锯齿
    enableAnitiAliasForEachLayer();
    
//    初始化地板层和墙壁层对象
    floorLayer = this->layerNamed("floor");
    wallLayer = this->layerNamed("wall");
}

void GameMap::enableAnitiAliasForEachLayer()
{
    CCArray *pChildrenArray = this->getChildren();
    CCSpriteBatchNode *child = NULL;
    CCObject *pObject = NULL;
    
    CCARRAY_FOREACH(pChildrenArray, pObject)
    {
        child = (CCSpriteBatchNode *) pObject;
        if (!child) {
            break;
        }
        
        child->getTexture()->setAliasTexParameters();
    }
}

//从Tilemap坐标转换成cocos2d－x坐标
CCPoint GameMap::positionForTileCoord(CCPoint tileCoord, CCTMXTiledMap *map)
{
    CCPoint pos = CCPoint((tileCoord.x / map->getTileSize().width),
                          ((map->getMapSize().height - tileCoord.y - 1) * map->getTileSize().height));
    
    return pos;
}

//从cocos2d－x坐标转换成Tilemap坐标
CCPoint GameMap::tileCoordForPosition(CCPoint position, CCTMXTiledMap *map)
{
    int x = position.x / map->getTileSize().width;
	int y = (((map->getMapSize().height - 1) * map->getTileSize().height) - position.y) / map->getTileSize().height;
	return ccp(x, y);
}











































