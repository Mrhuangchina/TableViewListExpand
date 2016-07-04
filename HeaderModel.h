//
//  HeaderModel.h
//  TableViewListExpand
//
//  Created by hzzc on 16/7/4.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeaderModel : NSObject

@property (nonatomic,copy)NSString *Title;
@property (nonatomic,assign)BOOL Expand;
@property (nonatomic,copy)NSMutableArray *SectionArray;


@end
