//
//  ViewController.m
//  FoldingTableView
//
//  Created by Emma on 2018/10/16.
//  Copyright © 2018年 EmmaCao. All rights reserved.
//

#import "ViewController.h"

#import "Header.h"
#import "OptionalTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbMajor;

@property (nonatomic, copy) NSArray<SectionModel *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tbMajor.allowsMultipleSelection = YES;
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource[section].isExpanded ? self.dataSource[section].cellModels.count : 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataSource[indexPath.section].isExpanded ? 44 : 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *headerID = NSStringFromClass([Header class]);
    Header *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (!headerView) {
        headerView = [[Header alloc] initWithReuseIdentifier:headerID];
    }
    headerView.sectionModel = self.dataSource[section];
    
    headerView.clickBackHeaderView = ^(BOOL isExpand) {
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    headerView.clickCheckBtn = ^(BOOL isSelected) {
        
        NSMutableArray<CellModel *> *cellModelMArr = [NSMutableArray array];
        [self.dataSource[section].cellModels enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CellModel *cellModel = (CellModel *)obj;
            cellModel.selected = isSelected;
            [cellModelMArr addObject:cellModel];
        }];
        self.dataSource[section].cellModels = cellModelMArr;
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    return headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = NSStringFromClass([OptionalTableViewCell class]);
    OptionalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([OptionalTableViewCell class]) owner:self options:nil].firstObject;
    }
    
    cell.cellModel = self.dataSource[indexPath.section].cellModels[indexPath.row];
    cell.textLabel.text = cell.cellModel.title;
    
    if (cell.cellModel.isSelected) {
        
        [self.tbMajor selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }else{
        [self.tbMajor deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OptionalTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cellModel.selected = YES;
    NSMutableArray<CellModel *> *cellMArr = [self.dataSource[indexPath.section].cellModels mutableCopy];
    [cellMArr replaceObjectAtIndex:indexPath.row withObject:cell.cellModel];
    self.dataSource[indexPath.section].cellModels = cellMArr;
    
    __block BOOL flag = NO;
    [cellMArr enumerateObjectsUsingBlock:^(CellModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.isSelected) {
            flag = YES;
        }else{
            flag = NO;
            *stop = YES;
        }
    }];
    if (flag) {
        self.dataSource[indexPath.section].isSelected = YES;
    }
    [self.tbMajor reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OptionalTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cellModel.selected = NO;
    NSMutableArray<CellModel *> *cellMArr = [self.dataSource[indexPath.section].cellModels mutableCopy];
    [cellMArr replaceObjectAtIndex:indexPath.row withObject:cell.cellModel];
    self.dataSource[indexPath.section].cellModels = cellMArr;
    self.dataSource[indexPath.section].isSelected = NO;
    [self.tbMajor reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - 懒加载
-(NSArray<SectionModel *> *)dataSource
{
    if (!_dataSource) {
        CellModel *cellm11 = [CellModel cellModelWithTitle:@"cell11" selected:NO];
        CellModel *cellm12 = [CellModel cellModelWithTitle:@"cell12" selected:NO];
        CellModel *cellm13 = [CellModel cellModelWithTitle:@"cell13" selected:NO];
        SectionModel *model1 = [SectionModel sectionModelWithTitle:@"section1" isExpanded:NO isSeleted:NO cellModels:@[cellm11,cellm12,cellm13]];
        CellModel *cellm21 = [CellModel cellModelWithTitle:@"cell21" selected:NO];
        CellModel *cellm22 = [CellModel cellModelWithTitle:@"cell22" selected:NO];
        CellModel *cellm23 = [CellModel cellModelWithTitle:@"cell23" selected:NO];
        SectionModel *model2 = [SectionModel sectionModelWithTitle:@"section2" isExpanded:NO isSeleted:NO cellModels:@[cellm21,cellm22,cellm23]];
        _dataSource = @[model1, model2];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
