//
//  SCMsgItem.h
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    SCMsgItemTypeMe = 0,
    SCMsgItemTypeYou = 1
}SCMsgItemType;
@interface SCMsgItem : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)SCMsgItemType type;
@property(nonatomic,assign)BOOL hideTime;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)msgItemWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
