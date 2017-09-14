//
//  AWTransformViewController.m
//  UIViewAnimation
//
//  Created by Anderson on 2017/9/14.
//  Copyright © 2017年 Anderson. All rights reserved.
//

#import "AWTransformViewController.h"

@interface AWTransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** <#注释#> */
@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation AWTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.duration = 1.5;
    self.tabBarController.tabBarItem.title = @"形变处理";

}

- (IBAction)moveUp:(id)sender {


    [UIView animateWithDuration:self.duration animations:^{

        // make方法是相对于最开始的位置做形变
        self.imageV.transform = CGAffineTransformMakeTranslation(0, -50);

    }];

}

- (IBAction)moveDown:(id)sender {
    [UIView animateWithDuration:self.duration animations:^{

    // 去掉make, 是相对于一个控件的位置开始做形变
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, 50);
    }];

}

- (IBAction)moveRotation:(id)sender {
    [UIView animateWithDuration:self.duration animations:^{
        self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, M_PI_4);
    }];
}


- (IBAction)moveScale:(id)sender {
    [UIView animateWithDuration:self.duration animations:^{
        self.imageV.transform = CGAffineTransformScale(self.imageV.transform, 0.9, 0.9);
    }];
}

- (IBAction)moveHor:(id)sender {
    [UIView animateWithDuration:self.duration animations:^{
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, -10, 0);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
