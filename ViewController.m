//
//  ViewController.m
//  TableViewListExpand
//
//  Created by hzzc on 16/7/4.
//  Copyright © 2016年 hzzc. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "HeaderModel.h"
#import "CellModel.h"



static NSString *CellID = @"CellIdentifily";
static NSString *HeaderID = @"HeaderIdentifily";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *ListTable;
@property(nonatomic, copy)NSMutableArray *TableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ListTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.ListTable.delegate = self;
    self.ListTable.dataSource = self;
    
    [self.ListTable registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    [self.ListTable registerClass:[HeaderView class] forHeaderFooterViewReuseIdentifier:HeaderID];
    
    [self.view addSubview:self.ListTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSMutableArray *)TableArray{
    
    if (_TableArray == nil) {
        _TableArray = [[NSMutableArray alloc]init];
        for (NSInteger i =1; i <= 20; i++) {
            HeaderModel *HDModel = [[HeaderModel alloc]init];
            HDModel.Expand = NO;
            HDModel.Title = [NSString stringWithFormat:@"这是第%ld个Section",i];
            NSMutableArray *ItmeArray = [[NSMutableArray alloc]init];
            
            for (NSInteger j = 1;  j <= 20; j++) {
                CellModel *ClModel = [[CellModel alloc]init];
                ClModel.title = [NSString stringWithFormat:@"这是第%ld个Section第%ld个Row",i, j];
                [ItmeArray addObject:ClModel];
            }
            HDModel.SectionArray = ItmeArray;
            [_TableArray addObject:HDModel];
        }
        
    }

    return _TableArray;
}



#pragma mark - UITableDelegate UITableDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    HeaderModel *model = self.TableArray[section];
    
    return model.Expand ? model.SectionArray.count : 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.TableArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    HeaderModel *HDmodel = self.TableArray[indexPath.section];
    CellModel *clModel = HDmodel.SectionArray[indexPath.row];
    cell.textLabel.text = clModel.title;
    
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HeaderView *Headerview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderID];
    HeaderModel *HDmodel = self.TableArray[section];
    Headerview.model = HDmodel;
    
    Headerview.expand = ^(BOOL isExpand){
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section]
                   withRowAnimation:UITableViewRowAnimationFade];
    };
    
    return Headerview;
}
@end
