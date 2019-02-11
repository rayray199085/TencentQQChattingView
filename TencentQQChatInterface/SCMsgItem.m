//
//  SCMsgItem.m
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCMsgItem.h"

@implementation SCMsgItem
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)msgItemWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}
@end
