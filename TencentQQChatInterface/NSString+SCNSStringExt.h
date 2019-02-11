//
//  NSString+SCNSStringExt.h
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (SCNSStringExt)
-(CGRect)sizeOfTextWithMaxSize:(CGSize)size andWithFont:(UIFont *)font;
+(CGRect)sizeWithText:(NSString *)text andWithMaxSize:(CGSize)size andWithFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
