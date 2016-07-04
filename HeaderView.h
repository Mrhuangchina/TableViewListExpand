//
//  HeaderView.h
//  TableViewListExpand
//
//  Created by hzzc on 16/7/4.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderModel.h"

typedef void(^Expand) (BOOL isExpand);

@interface HeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong)HeaderModel *model;
@property(nonatomic, copy)Expand expand;

@end
