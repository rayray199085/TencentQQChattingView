//
//  SCMsgTableViewCell.h
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCMsgFrameItem.h"
#import "SCMsgItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCMsgTableViewCell : UITableViewCell
@property(nonatomic,strong)SCMsgFrameItem *frameItem;
+(instancetype) msgTableViewCellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
