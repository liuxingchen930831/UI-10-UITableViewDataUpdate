//
//  DealTableViewController.m
//  自定义UITableViewCell
//
//  Created by liuxingchen on 16/9/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "DealTableViewController.h"
#import "XCDeal.h"
#import "XCDealCell.h"
@interface DealTableViewController ()

@property(nonatomic,strong)NSArray * deals ;
@end

@implementation DealTableViewController
-(NSArray *)deals
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
- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([XCDealCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"dealCell"];
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.row);
}
@end
