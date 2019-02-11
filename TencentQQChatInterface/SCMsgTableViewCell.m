//
//  SCMsgTableViewCell.m
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCMsgTableViewCell.h"
@interface SCMsgTableViewCell()
@property(nonatomic,weak)UILabel *timeLbl;
@property(nonatomic,weak)UIImageView *iconIv;
@property(nonatomic,weak)UIButton *textBtn;
@end
@implementation SCMsgTableViewCell
#pragma mark - add custom subViews to the cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //time
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.font = timeFont;
        [self.contentView addSubview:timeLabel];
        self.timeLbl = timeLabel;
        //icon
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconIv = iconImageView;
        //text
        UIButton *textButton = [[UIButton alloc]init];
        textButton.titleLabel.numberOfLines = 0;
        textButton.titleLabel.font = textFont;
        textButton.contentEdgeInsets = UIEdgeInsetsMake(15, 20, 15, 20);
        [self.contentView addSubview:textButton];
        self.textBtn = textButton;
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

#pragma mark - init the subViews' data and frame
- (void)setFrameItem:(SCMsgFrameItem *)frameItem{
    _frameItem = frameItem;
    [self setFrameItemData];
    [self setFrameItemRect];
}

-(void)setFrameItemData{
    SCMsgItem *item = self.frameItem.message;
    _timeLbl.hidden = item.hideTime;
    _timeLbl.text = item.time;
    UIImage *normalImage, *highlightedImage;
    if(item.type == SCMsgItemTypeMe){
        _iconIv.image = [UIImage imageNamed:@"me"];
        normalImage = [UIImage imageNamed:@"chat_send_nor"];
        highlightedImage = [UIImage imageNamed:@"chat_send_press_pic"];
        [_textBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        _iconIv.image = [UIImage imageNamed:@"other"];
        normalImage = [UIImage imageNamed:@"chat_recive_nor"];
        highlightedImage = [UIImage imageNamed:@"chat_recive_press_pic"];
        [_textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    normalImage = [normalImage stretchableImageWithLeftCapWidth:normalImage.size.width / 2 topCapHeight:normalImage.size.height / 2];
    highlightedImage = [highlightedImage stretchableImageWithLeftCapWidth:highlightedImage.size.width / 2 topCapHeight:highlightedImage.size.height / 2];
    [_textBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [_textBtn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [_textBtn setTitle:item.text forState:UIControlStateNormal];
}
-(void)setFrameItemRect{
    _timeLbl.frame = self.frameItem.timeRect;
    _iconIv.frame = self.frameItem.iconRect;
    _textBtn.frame = self.frameItem.textRect;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype) msgTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"message_cell";
    SCMsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[SCMsgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
@end
