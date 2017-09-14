//
//  AWSketchController.m
//  UIViewAnimation
//
//  Created by Anderson on 2017/9/14.
//  Copyright © 2017年 Anderson. All rights reserved.
//

#import "AWSketchController.h"

@interface AWSketchController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation AWSketchController

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObject:@"绘画直线"];
        [_dataArr addObject:@"绘画曲线"];
        [_dataArr addObject:@"自定义UIImageView"];
        [_dataArr addObject:@"添加水印"];
        [_dataArr addObject:@"绘画进度条"];
        [_dataArr addObject:@"定时器: 雪花效果"];
        [_dataArr addObject:@"绘制饼图"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sketchCell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sketchCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // [self.navigationController pushViewController:[[AWTransformViewController alloc] init] animated:YES];

    if (indexPath.row == 0) {

    }else if (indexPath.row == 1){

    }else if (indexPath.row == 2){

    }else if (indexPath.row == 3){

    }else if (indexPath.row == 4){
        
    }else if (indexPath.row == 5){

    }else if (indexPath.row == 6){
        
    }
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
