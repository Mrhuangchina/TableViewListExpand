//
//  HeaderView.m
//  TableViewListExpand
//
//  Created by hzzc on 16/7/4.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "HeaderView.h"
#import "ViewController.h"

@interface HeaderView()
@property (nonatomic, strong)UIImageView *arrowImage;
@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation HeaderView


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
    self.contentView.backgroundColor = [UIColor redColor];
    
    self.arrowImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brand_expand"]];
    self.arrowImage.frame = CGRectMake(10, 16, 15, 8);
    [self.contentView addSubview:self.arrowImage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kWidth, kHeight);
    [button addTarget:self
            action:@selector(buttonAction:)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:button];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 0, 200, kHeight)];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.titleLabel];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, kHeight-0.5, kWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    
    return self;
}



-(void)setModel:(HeaderModel *)model{
    
    if (_model != model) {
        _model = model;
    }
    
    if (model.Expand) {
        self.arrowImage.transform = CGAffineTransformIdentity;
    }else{
        self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
    }
    self.titleLabel.text = model.Title;
}



-(void)buttonAction:(UIButton *)button{
    
    self.model.Expand = !self.model.Expand;
    [UIView animateWithDuration:0.3 animations:^{
        if (self.model.Expand) {
            self.arrowImage.transform = CGAffineTransformIdentity;
        }else{
            self.arrowImage.transform = CGAffineTransformMakeRotation(M_PI);
        }
        
    }];
    
    if (self.expand) {
        self.expand(self.model.Expand);
    }
    
}

@end
