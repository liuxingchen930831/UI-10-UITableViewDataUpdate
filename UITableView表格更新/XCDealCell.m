//
//  XCDealCell.m
//  自定义UITableViewCell
//
//  Created by liuxingchen on 16/9/19.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCDealCell.h"
#import "XCDeal.h"
#import "Masonry.h"
@implementation XCDealCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat margin = 10;
        
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        self.iconView = image;
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(margin);
            make.top.mas_equalTo(self.contentView).offset(margin);
            make.bottom.mas_equalTo(self.contentView).offset(-margin);
            make.width.mas_equalTo(100);
        }];
        
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        
        self.titleView = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(image.mas_right).offset(margin);
            make.top.mas_equalTo(self.contentView).offset(margin);
            make.right.mas_equalTo(self.contentView).offset(-margin);
        }];
        
        
        UILabel *buyCountLabel = [[UILabel alloc]init];
        [self.contentView addSubview:buyCountLabel];
        
        buyCountLabel.textColor = [UIColor orangeColor];
        self.buyCount = buyCountLabel;
        [buyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLabel);
            make.top.mas_equalTo(titleLabel.mas_bottom).offset(margin);
            make.bottom.mas_equalTo(self.contentView).offset(-margin);
            make.width.mas_equalTo(150);
        }];
        
        UILabel *pirceLabel =[[UILabel alloc]init];
        [self.contentView addSubview:pirceLabel];
        pirceLabel.textAlignment = NSTextAlignmentRight;
        
        pirceLabel.textColor = [UIColor grayColor];
        self.pirceView = pirceLabel;
        [pirceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).offset(-margin);
            make.bottom.mas_equalTo(self.contentView).offset(-margin);
            make.width.mas_equalTo(80);
        }];
    }
    return  self;
}

-(void)setDeal:(XCDeal *)deal
{
    _deal = deal;
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.buyCount.text = [NSString stringWithFormat:@"%@人已购买", deal.buyCount];
    self.pirceView.text = [NSString stringWithFormat:@"￥%@", deal.price];
    self.titleView.text = deal.title;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    //封装cell创建过程
    static NSString *ID = @"dealCell";
    XCDealCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell ==nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
@end
