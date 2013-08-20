//
//  ControlLayer.h
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-3.
//
//

#ifndef GameStartX_ControlLayer_h
#define GameStartX_ControlLayer_h

#include "MTGame.h"

using namespace cocos2d;

class ControlLayer : public CCLayer
{
public:
    
    ControlLayer(void);
    ~ControlLayer(void);
    
    virtual bool init();
    
    void menuCallBackMove(CCObject *pSender);
    
    void menuCloseCallBack(CCObject *pSender);
    
    LAYER_NODE_FUNC(ControlLayer);
};

#endif
