//
//  AWDrawRect.m
//  UIViewAnimation
//
//  Created by Anderson on 2017/9/14.
//  Copyright © 2017年 Anderson. All rights reserved.
//

#import "AWDrawRect.h"

@implementation AWDrawRect


- (void)drawRect:(CGRect)rect {

    [self drawPie];
}

- (void)drawPie{
    NSArray *data = @[@25, @15, @33, @27];
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    CGFloat radius = self.bounds.size.width * 0.5 - 5.5;
    CGFloat beginA = 0;
    CGFloat endA = 0;
    CGFloat radian = 0;
    for (NSNumber *num in data) {
        beginA = endA;
        radian = num.intValue / 100.0 * M_PI * 2.0;
        endA = beginA + radian;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:beginA endAngle:endA clockwise:YES];
        [[self randomColor] set];
        [path addLineToPoint:center];
        [path fill];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
    [self setNeedsDisplay];
}


//生成一个随机的颜色
- (UIColor *)randomColor {

    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;

    return  [UIColor colorWithRed:r green:g blue:b alpha:1];
}

// 绘制矩形 & 圆角矩形
- (void)drawRect{

    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(12, 12, 55, 55)];
    // 圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(12, 12, 55, 55) cornerRadius:20];

    CGContextAddPath(ctx, path.CGPath);

    // 描边形式
    CGContextStrokePath(ctx);
    // 填充形式
    // CGContextFillPath(ctx);

}

// 绘制圆形
- (void)drawCircle{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 20, 100, 80)];

    [[UIColor greenColor] set];

    // stroke/fill方法: 底层也是调用之前的1, 2, 3, 4 步骤
    [path stroke];
    // [path fill];
}

// 绘制弧度
- (void)drawRadian{
    // ArcCenter : 弧所在的圆心(注意圆形不要使用center, 因为center是相对于父控件而言, 坐标系不用)
    // radius : 半径
    // startAngle : 开始角度
    // endAngle : 结束角度
    // clockwise : 绘制方向(Yes-> 顺时针)
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:M_PI_2 clockwise:YES];

    // 添加一根线到圆心
    [path addLineToPoint:CGPointMake(100, 100)];

    // 关闭路径: 从路径的终点 向 路径的起点 连接一根线
    [path closePath];

    [path stroke];

    // fill 之前, 系统会自动关闭路径, 调用closePath方法
    // [path fill];
}




@end
