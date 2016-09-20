//
//  XCDeal.h
//  自定义UITableViewCell
//
//  Created by liuxingchen on 16/9/18.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCDeal : NSObject
@property (strong, nonatomic) NSString *buyCount;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *icon;
+(instancetype)dealWithDict:(NSDictionary *)dict;
@end
