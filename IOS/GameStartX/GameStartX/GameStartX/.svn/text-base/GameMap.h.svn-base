//
//  GameMap.h
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-4.
//
//

#ifndef GameStartX_GameMap_h
#define GameStartX_GameMap_h

#include "MTGame.h"

using namespace cocos2d;

class GameMap : public CCTMXTiledMap
{
//    只读变量，获取地板层和墙壁层
    CC_PROPERTY_READONLY(CCTMXLayer*, floorLayer, FloorLayer);
    CC_PROPERTY_READONLY(CCTMXLayer*, wallLayer, WallLayer);
public:
    
    GameMap(void);
    ~GameMap(void);
    
//    静态方法，用于生成GameMap实例
    static GameMap* gameMapWithTMXFile(const char *tmxFile);
    
//    cocos2d-x 与 Tilemap 坐标互相转换
    CCPoint tileCoordForPosition(CCPoint tileCoord, CCTMXTiledMap *map);
    CCPoint positionForTileCoord(CCPoint position, CCTMXTiledMap *map);
    
//    TileMap额外的初始化方法
    void extraInit();
    
//    开启各图层的文理抗锯齿
    void enableAnitiAliasForEachLayer();
};

#endif
