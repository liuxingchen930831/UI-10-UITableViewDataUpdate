//
//  XCDealCell.h
//  自定义UITableViewCell
//
//  Created by liuxingchen on 16/9/19.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XCDeal;
@interface XCDealCell : UITableViewCell
@property(nonatomic,strong)XCDeal * deal ;
@property (weak, nonatomic)  UIImageView *iconView;
@property (weak, nonatomic)  UILabel *titleView;
@property (weak, nonatomic)  UILabel *buyCount;
@property (weak, nonatomic)  UILabel *pirceView;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
