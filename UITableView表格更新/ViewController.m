//
//  ViewController.m
//  UITableView表格更新
//
//  Created by liuxingchen on 16/9/20.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"
#import "XCDeal.h"
#import "XCDealCell.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * deals ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(NSMutableArray *)deals
{
    if (_deals ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"deal.plist" ofType:nil];
        NSMutableArray *arrayM =[NSMutableArray array];
        NSArray *dealArray =[NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dealArray) {
            XCDeal *deal = [XCDeal dealWithDict:dict];
            [arrayM addObject:deal];
        }
        _deals = arrayM;
    }
    return _deals;
}

- (IBAction)add:(id)sender
{
    XCDeal *deal = [[XCDeal alloc]init];
    deal.title = [NSString stringWithFormat:@"XX饭店大打折 %d折", arc4random_uniform(50)];
    deal.price = [NSString stringWithFormat:@"%d", 10 + arc4random_uniform(100)];
    deal.buyCount = [NSString stringWithFormat:@"%d", arc4random_uniform(1000)];
    deal.icon = @"5ee372ff039073317a49af5442748071";
    //在数据源中插入一条数据在第0个位置
    [self.deals insertObject:deal atIndex:0];
    /**
     刷新tablew数据源 增删该查都需要刷新
     [self.tableView reloadData];
     */
    //tableView表格刷新动画，可以通过该方法插入某些特定的行，并且调用此方法==reloadData刷新属性局方法
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationRight];
}
- (IBAction)remove:(id)sender
{
    //在数据源中删除一条数据在第0个位置
    [self.deals removeObjectAtIndex:0];
    //tableView表格刷新动画，可以通过该方法删除某些特定的行，并且调用此方法==reloadData刷新属性局方法
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
    
}
- (IBAction)update:(id)sender
{
    
    XCDeal *deal = self.deals[3];
    deal.price = [NSString stringWithFormat:@"%d", 10 + arc4random_uniform(100)];
    [self.tableView reloadData];
}
- (IBAction)editing:(id)sender
{
    // 进入编辑模式
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    XCDealCell *cell = [XCDealCell cellWithTableView:tableView];
    //获取模型数据
    cell.deal = self.deals[indexPath.row];
    return cell;
    
}
/**
 * 只要实现了此方法，左侧滑cell就会出现删除按钮
 * 用户提交了添加（点击了添加按钮）\删除（点击了删除按钮）操作时会调用
 */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //从数据源中删除对应的数据
        [self.deals removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }else if(editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"添加--%zd",indexPath.row);
    }
}
/**
 * 这个方法决定了编辑模式时,每一行的编辑类型是 (+)增加 还是(-)删除
 * 如果调用该方法必须写上一句 self.tableView.editing = YES 这行代码是让tableview进入编辑模式
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row % 2 == 0? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}
@end
