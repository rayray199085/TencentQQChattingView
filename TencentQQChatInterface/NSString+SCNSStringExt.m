//
//  NSString+SCNSStringExt.m
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "NSString+SCNSStringExt.h"
@implementation NSString (SCNSStringExt)
-(CGRect)sizeOfTextWithMaxSize:(CGSize)size andWithFont:(UIFont *)font{
    NSDictionary *dict = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
}
+(CGRect)sizeWithText:(NSString *)text andWithMaxSize:(CGSize)size andWithFont:(UIFont *)font{
    return [text sizeOfTextWithMaxSize:size andWithFont:font];
}
@end
