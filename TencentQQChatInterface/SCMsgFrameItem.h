//
//  SCMsgFrameItem.h
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCMsgItem.h"
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "NSString+SCNSStringExt.h"
#define timeFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:13]

NS_ASSUME_NONNULL_BEGIN

@interface SCMsgFrameItem : NSObject
@property(nonatomic,strong)SCMsgItem *message;
@property(nonatomic,assign, readonly)CGRect timeRect;
@property(nonatomic,assign, readonly)CGRect iconRect;
@property(nonatomic,assign, readonly)CGRect textRect;
@property(nonatomic,assign, readonly)CGFloat rowHeight;
@end

NS_ASSUME_NONNULL_END
