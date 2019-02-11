//
//  ViewController.m
//  TencentQQChatInterface
//
//  Created by Stephen Cao on 11/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "ViewController.h"
#import "SCMsgItem.h"
#import "SCMsgFrameItem.h"
#import "SCMsgTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray *msgFrameList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *sound;
@property (weak, nonatomic) IBOutlet UIButton *emoj;
@property (weak, nonatomic) IBOutlet UIButton *plus;
@property (weak, nonatomic) IBOutlet UITextField *inputText;

- (IBAction)addMore:(id)sender;
- (IBAction)playSound:(id)sender;
- (IBAction)displayEmoj:(id)sender;
-(void)scrollToTheLastItem;
@end

@implementation ViewController
#pragma mark - load data from property list
- (NSMutableArray *)msgFrameList{
    if(_msgFrameList == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempList = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCMsgItem *item = [SCMsgItem msgItemWithDictionary:dict];
            SCMsgFrameItem *frameItem = [[SCMsgFrameItem alloc]init];
            SCMsgItem *lastMsgItem = (SCMsgItem *) [[tempList lastObject] message];
            if([item.time isEqualToString:lastMsgItem.time]){
                item.hideTime = YES;
            }
            frameItem.message = item;
            [tempList addObject:frameItem];
        }
        _msgFrameList = tempList;
    }
    return _msgFrameList;
}
#pragma mark - initialize
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0];
    self.tableView.allowsSelection = NO;
    
    NSNotificationCenter *centre = [NSNotificationCenter defaultCenter];
    [centre addObserver:self selector:@selector(keyboardWillChangeFrameWithNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - bottom bar button methods
- (IBAction)playSound:(id)sender {
}
- (IBAction)displayEmoj:(id)sender {
}
- (IBAction)addMore:(id)sender {
}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.msgFrameList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCMsgFrameItem *frameItem = self.msgFrameList[indexPath.row];
    SCMsgTableViewCell *cell = [SCMsgTableViewCell msgTableViewCellWithTableView:tableView];
    cell.frameItem = frameItem;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCMsgFrameItem *frameItem = self.msgFrameList[indexPath.row];
    return frameItem.rowHeight;
}
-(void)keyboardWillChangeFrameWithNotification:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardFrame.origin.y - self.view.frame.size.height);
    }];
    [self scrollToTheLastItem];
}
-(void)scrollToTheLastItem{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.msgFrameList.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
#pragma mark - textField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *inputContent = self.inputText.text;
    [self sendANewMessage:inputContent andWithType:SCMsgItemTypeMe];
    [self sendANewMessage:@"What????" andWithType:SCMsgItemTypeYou];
     self.inputText.text = nil;
    return YES;
}
-(void)sendANewMessage:(NSString *)inputContent andWithType:(SCMsgItemType)type{
    SCMsgItem *item = [[SCMsgItem alloc]init];
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    item.time = [formatter stringFromDate:currentDate];
    item.type = type;
    item.text = inputContent;
    SCMsgFrameItem *frameItem = [[SCMsgFrameItem alloc]init];
    SCMsgFrameItem *lastFrameItem = self.msgFrameList.lastObject;
    if([lastFrameItem.message.time isEqualToString:item.time]){
        item.hideTime = YES;
    }
    frameItem.message = item;
    [self.msgFrameList addObject:frameItem];
    [self.tableView reloadData];
    [self scrollToTheLastItem];
}
@end
