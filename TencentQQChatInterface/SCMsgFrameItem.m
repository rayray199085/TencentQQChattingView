//
//  SCMsgFrameItem.m
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCMsgFrameItem.h"

@implementation SCMsgFrameItem
- (void)setMessage:(SCMsgItem *)message{
    _message = message;
    
    CGFloat margin = 10;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGRect timeFrame = [NSString sizeWithText:_message.time andWithMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andWithFont:timeFont];
    CGFloat timeX = (screenWidth - timeFrame.size.width)/ 2;
    CGFloat timeFrameHeight = timeFrame.size.height;
    CGFloat timeFrameWidth = timeFrame.size.width;
    _timeRect = CGRectMake(timeX, margin, timeFrameWidth, timeFrameHeight);
    // icon
    CGFloat iconX = 0;
    CGFloat iconW = 30;
    if(_message.type == SCMsgItemTypeMe){
        iconX = screenWidth - margin - iconW;
    }else{
        iconX = margin;
    }
    if(_message.hideTime){
         _iconRect = CGRectMake(iconX, margin, iconW, iconW);
    }else{
         _iconRect = CGRectMake(iconX, CGRectGetMaxY(_timeRect) + margin, iconW, iconW);
    }
    // text
    CGRect textFrame = [NSString sizeWithText:_message.text andWithMaxSize:CGSizeMake(250, MAXFLOAT) andWithFont:textFont];
    CGFloat textW = textFrame.size.width;
    CGFloat textH = textFrame.size.height;
    CGFloat textPaddingH = 40;
    CGFloat textPaddingV = 30;
    CGFloat textX = 0;
    if(_message.type == SCMsgItemTypeMe){
        textX = _iconRect.origin.x - margin - textW - textPaddingH;
    }else{
        textX = CGRectGetMaxX(_iconRect) + margin;
    }
    _textRect = CGRectMake(textX, _iconRect.origin.y, textW + textPaddingH, textH + textPaddingV);
    //rowHeight
    _rowHeight = MAX(CGRectGetMaxY(_textRect), CGRectGetMaxY(_iconRect)) + margin;
}
@end
