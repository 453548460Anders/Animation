// 拖拽View


#import "AWMoveView.h"

@implementation AWMoveView

// 当开始触摸屏幕的时候调用该方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);

}

// 当触摸结束的时候调用该方法
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);

}

// 当触摸开始的时候调用该方法
// UITouch对象: 保存与手指相关的信息 -> 触摸的位置, 时间, 阶段
// 当手指移动的时候, 系统会自动更新UITouch对象, 使之能够一直保存该手指的信息
// 当手指移开的时候, 系统会自动销毁UITouch对象
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);

    UITouch *touch = [touches anyObject];

    // 求出手指的偏移量: 手指当前点的X - 手指上一个触摸点的X
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);

}

// 当发生系统事件时候, 就会调用该方法
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __func__);

}


@end
