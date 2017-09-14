//
//  AWLineView.m
//  UIViewAnimation
//
//  Created by Anderson on 2017/9/14.
//  Copyright © 2017年 Anderson. All rights reserved.
//

#import "AWLineView.h"

@implementation AWLineView

// 什么作用 : 专门用来绘图使用的方法
// 何时调用 : View显示的时候, 调用该方法
- (void)drawRect:(CGRect)rect {
    // Drawing code

    // 0> 绘制曲线

    // 1> 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2> 绘制图片
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 120)];

    // controlPoint: 控制点(弧度) -> 决定曲线向哪个地方弯曲
    [path addQuadCurveToPoint:CGPointMake(180, 200) controlPoint:CGPointMake(88, 88)];

    // 3> 将绘制号的内容保存到上下文当中
    CGContextAddPath(ctx, path.CGPath);

    // 4> 绘图
    CGContextStrokePath(ctx);
}

// 绘制直线
- (void)drawLine{
    // 1> 获取上下文 (为什么没有*, 因为CGContextRef 是一个指向结构体的指针)
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 2> 绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];

    // 2.1> 开始画线, 绘制起点
    [path moveToPoint:CGPointMake(10, 10)];

    // 2.2> 绘制一根线到终点
    [path addLineToPoint:CGPointMake(100, 100)];

    // 2.3> 在绘制另外一根线到终点
    [path addLineToPoint:CGPointMake(33, 80)];

    // 2.4> 设置线宽
    CGContextSetLineWidth(ctx, 3);
    // 2.5> 设置线的连接样式
    // kCGLineJoinMiter : 默认样式
    // kCGLineJoinRound : 圆角
    // kCGLineJoinBevel : (切掉)平角
    CGContextSetLineJoin(ctx, kCGLineJoinRound);

    // 2.6> 设置线的顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);

    // 2.7> 设置线的颜色
    [[UIColor redColor] setStroke];
    // [[UIColor redColor] setFill];
    // [[UIColor redColor] set]; // 自动设置需要的颜色

    // 3> 把绘制的内容保存到上下文中
    CGContextAddPath(ctx, path.CGPath);

    // 4> 把上下文的内容显示到View上面(渲染到View的Layer上面)
    CGContextStrokePath(ctx);
    // CGContextFillPath(ctx);

}


@end
