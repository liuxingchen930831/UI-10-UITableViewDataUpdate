//
//  XCDeal.m
//  自定义UITableViewCell
//
//  Created by liuxingchen on 16/9/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "XCDeal.h"

@implementation XCDeal
+(instancetype)dealWithDict:(NSDictionary *)dict
{
    XCDeal *deal =[[self alloc]init];
    [deal setValuesForKeysWithDictionary:dict];
    return deal;
}
@end
