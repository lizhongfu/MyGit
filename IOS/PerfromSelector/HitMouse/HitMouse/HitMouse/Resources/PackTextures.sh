#!/bin/sh

#  PackTextures.sh
#  HitMouse
#
#  Created by Zogful.Lee on 13-1-30.
#

#!/bin/sh
TP="/usr/local/bin/HitMouse"
if [ "${ACTION}"="clean" ]
then
echo "cleaning..."
rm Resources/background*
rm Resources/foreground*
rm Resources/sprites*
else
echo "building..."
${TP} --smart-update \
--format cocos2d \
--data Resources/background-hd.plist \
--sheet Resources/background-hd.pvr.ccz \
--dither-fs \
--opt RGB565 \
Art/background/*.png
${TP} --smart-update \
--format cocos2d \
--data Resources/background.plist \
--sheet Resources/background.pvr.ccz \
--dither-fs \
--scale 0.5 \
--opt RGB565 \
Art/background/*.png
${TP} --smart-update \
--format cocos2d \
--data Resources/foreground-hd.plist \
--sheet Resources/foreground-hd.pvr.ccz \
--dither-fs-alpha \
--opt RGBA4444 \
Art/foreground/*.png
${TP} --smart-update \
--format cocos2d \
--data Resources/foreground.plist \
--sheet Resources/foreground.pvr.ccz \
--dither-fs-alpha \
--scale 0.5 \
--opt RGBA4444 \
Art/foreground/*.png
${TP} --smart-update \
--format cocos2d \
--data Resources/sprites-hd.plist \
--sheet Resources/sprites-hd.pvr.ccz \
--dither-fs-alpha \
--opt RGBA4444 \
--auto-sd \ #只要增加这一行就可以自动生成普清的图片了
Art/sprites/*.png
${TP} --smart-update \
--format cocos2d \
--data resources/sprites.plist \
--sheet resources/sprites.pvr.ccz \
--dither-fs-alpha \
--scale 0.5 \
--opt RGBA4444 \
--auto-sd \ #只要增加这一行就可以自动生成普清的图片了
Art/sprites/*.png
fi
exit 0