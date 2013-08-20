//
//  GameConstants.h
//  GameStartX
//
//  Created by Zogful.Lee on 13-2-3.
//
//

#ifndef GameStartX_GameConstants_h
#define GameStartX_GameConstants_h

typedef enum {
	kDown =  0,//œÚœ¬∑ΩœÚ
	kLeft = 1,//œÚ◊Û∑ΩœÚ
	kRight= 2,//œÚ”“∑ΩœÚ
	kUp = 3,//œÚ…œ∑ΩœÚ
	kNormal,
} HeroDirection;//”¬ ø∑ΩœÚ

typedef enum
{
	kNone = 1,//ø…“‘Õ®––
	kWall,//«Ω
	kEnemy,//µ–»À
	kItem,//ŒÔ∆∑
	kDoor,//√≈
	kNPC,//npc
	kTeleport,//¥´ÀÕµ„
} CollisionType;//≈ˆ◊≤¿‡–Õ

typedef enum
{
	aDown = 0,//œÚœ¬––◊ﬂ∂Øª≠
	aLeft,//œÚ◊Û––◊ﬂ∂Øª≠
	aRight,//œÚ”“––◊ﬂ∂Øª≠
	aUp,//œÚ…œ––◊ﬂ∂Øª≠
	aFight,//µ∂π‚∂Øª≠
} AnimationKey;//∂Øª≠ƒ£∞Êº¸÷µ

enum
{
	kZMap = 0,//µÿÕºµƒzOrder
	kZNPC,
	kZTeleport,
	kZHero,//”¬ øæ´¡ÈµƒzOrder
	kZTip,//Ã· æ–≈œ¢µƒzOrder
};//GameLayer÷–∏˜≤ø∑÷µƒœ‘ æzOrderº∞tag

enum
{
	kGameLayer = 0,
	kControlLayer,
	kFadeLayer,
};

#endif
