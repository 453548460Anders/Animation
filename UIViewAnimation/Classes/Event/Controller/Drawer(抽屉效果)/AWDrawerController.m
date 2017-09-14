//
//  AWDrawerController.m
//  UIViewAnimation
//
//  Created by Anderson on 2017/9/14.
//  Copyright © 2017年 Anderson. All rights reserved.
//

#import "AWDrawerController.h"
#define screenW [UIScreen mainScreen].bounds.size.width
@interface AWDrawerController ()

@property (nonatomic, weak) UIView *leftV;
@property (nonatomic, weak) UIView *rightV;
@property (nonatomic, weak) UIView *mainV;

@end

@implementation AWDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpView];
    [self setUpGes];

}

- (void)setUpView {
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    [leftV setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:leftV];
    self.leftV = leftV;

    UIView *rightV = [[UIView alloc] initWithFrame:self.view.bounds];
    [rightV setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:rightV];
    self.rightV = rightV;

    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    [mainV setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:mainV];
    self.mainV = mainV;
}

- (void)setUpGes{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:pan];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];

}

#define targetL -280
#define targetR 280

- (void)pan:(UIPanGestureRecognizer *)ges{
    CGPoint transP = [ges translationInView:self.mainV];
    // 如果不需要修改高度, 可以使用此方法
    // self.mainV.transform = CGAffineTransformTranslate(self.mainV.transform, transP.x, 0);

    self.mainV.frame = [self frameWithOffsetX:transP.x];

    if (self.mainV.frame.origin.x > 0) {
        // 向右拖动
        self.rightV.hidden = YES;
    }else if (self.mainV.frame.origin.x < 0 ){
        // 向左拖动
        self.rightV.hidden = NO;
    }

    // 手指松开的时候, 自动定位
    CGFloat target = 0;
    if (ges.state == UIGestureRecognizerStateEnded) {
        if (self.mainV.frame.origin.x > screenW / 2.0) { // 判断当前View在右面(View的X有没有屏幕宽度的一半)
            target = targetR;
        }else if (CGRectGetMaxX(self.mainV.frame) < screenW / 2.0){ // 判断当前View在左面(View的最大X, 有没有小于屏幕宽度的一半)
            target = targetL;
        }
        CGFloat offsetX = target - self.mainV.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            self.mainV.frame = [self frameWithOffsetX:offsetX];
        }];
    }

    // 复位操作
    [ges setTranslation:CGPointZero inView:self.mainV];
}

#define maxY 120
- (CGRect)frameWithOffsetX:(CGFloat )offX{
    CGRect frame = self.mainV.frame;
    frame.origin.x += offX;

    CGFloat y = fabs(frame.origin.x * maxY / screenW);
    frame.origin.y = y;

    CGFloat height = [UIScreen mainScreen].bounds.size.height - 2 * y;
    frame.size.height = height;

    return frame;
}

#pragma mark - tap
- (void)tap:(UITapGestureRecognizer *)tap{
    [UIView animateWithDuration:0.5 animations:^{
        self.mainV.frame = self.view.bounds;
    }];
}

@end
