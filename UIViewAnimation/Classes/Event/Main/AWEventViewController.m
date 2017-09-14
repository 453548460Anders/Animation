// iOS 中的事件

// 触摸事件
// 加速计事件
// 远程控制事件

// 触摸事件讲解:
// 响应者对象: 继承自UIResponder对象, 并且可以接收和处理事件
// UIResponder内部提供许多处理触摸事件的方法 : 触摸事件

#import "AWEventViewController.h"
#import "AWEventMoveController.h"
#import "AWDrawerController.h"
#import "AWTransformViewController.h"

@interface AWEventViewController () <UITableViewDelegate, UITableViewDataSource>


/** 数据模型 */
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AWEventViewController

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObject:@"View的拖拽"];
        [_dataArr addObject:@"抽屉效果"];
        [_dataArr addObject:@"基本移动效果"];


    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"eventCell"];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[AWEventMoveController alloc] init] animated:YES];
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[[AWDrawerController alloc] init] animated:YES];
    }else if (indexPath.row == 2){
        [self.navigationController pushViewController:[[AWTransformViewController alloc] init] animated:YES];
    }
}




@end
