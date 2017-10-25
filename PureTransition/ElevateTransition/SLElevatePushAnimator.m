//
//  SLElevatePushAnimator.m
//  PureTransition_Example
//
//  Created by 许乾隆 on 2017/10/10.
//  Copyright © 2017年 sohu-inc.com. All rights reserved.
//

#import "SLElevatePushAnimator.h"

@implementation SLElevatePushAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<SLElevateToAnimatorProtocol>* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController<SLElevateFromAnimatorProtocol>* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    ///通过协议拿到做动画的view和动画的目的地；
    UIView *fromView = [fromViewController fromViewForAnimatedTransitioning];
    UIView *toView = [toViewController toViewForAnimatedTransitioning];
    
    ///为 fromView 截图
    UIView *snapshotView = [fromView snapshotViewAfterScreenUpdates:NO];
    
    ///把截图糊在 toViewController的上面，大小和fromView一样大，这样看到的必然是截图了
    [toViewController.view addSubview:snapshotView];
    snapshotView.frame = fromView.frame;
    
    ///把转场view加到上下文容器上；
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];
    /*
     原本是想通过 layer去做这个动画的，结果发现在使用的时候，如果 fromView 是 AVPlayerLayer 所在 view 的父视图时，拿到的 layer.contents 是空的，即父视图的 layer.contents 为空，在实际情况中，UI层级是很复杂的，所以改用上面的截图方案；
     UIImage *image = [view sc_captureImage];
     UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
     CAShapeLayer *maskLayer = [CAShapeLayer layer];
     fromView.layer.contents = fromView.layer.contents;
     maskLayer.position = fromView.layer.position;
     maskLayer.bounds = fromView.bounds;
     maskLayer.backgroundColor = [[UIColor redColor]CGColor];
     [toViewController.view.layer addSublayer:maskLayer];
     
     NSMutableArray *animationArr = [NSMutableArray arrayWithCapacity:2];
     
     {
     ///大小不相等，需要做大小变换的动画
     
     CGRect fromRect = fromView.bounds;
     CGRect toRect = toView.bounds;
     
     if (!CGRectEqualToRect(fromRect, toRect)) {
     CABasicAnimation *animator = [CABasicAnimation animationWithKeyPath:@"bounds"];
     animator.fromValue = [NSValue valueWithCGRect:fromRect];
     animator.toValue = [NSValue valueWithCGRect:toRect];
     animator.fillMode = kCAFillModeForwards;
     animator.removedOnCompletion = NO;
     animator.duration = [self transitionDuration:nil];
     [animationArr addObject:animator];
     }
     }
     
     {
     ///大小不相等，需要做大小变换的动画
     CGPoint fromPosition = fromView.layer.position;
     CGPoint toPosition = toView.layer.position;
     
     if (!CGPointEqualToPoint(fromPosition, toPosition)) {
     
     CABasicAnimation *animator = [CABasicAnimation animationWithKeyPath:@"position"];
     animator.fromValue = [NSValue valueWithCGPoint:fromPosition];
     animator.toValue = [NSValue valueWithCGPoint:toPosition];
     animator.fillMode = kCAFillModeForwards;
     animator.removedOnCompletion = NO;
     animator.duration = [self transitionDuration:nil];
     [animationArr addObject:animator];
     }
     }
     
     if (animationArr.count > 0) {
     CAAnimationGroup *translationGroup = [CAAnimationGroup animation];
     translationGroup.duration = [self transitionDuration:nil];
     translationGroup.animations = [animationArr copy];
     translationGroup.fillMode = kCAFillModeForwards;
     translationGroup.removedOnCompletion = NO;
     [maskLayer addAnimation:translationGroup forKey:@"group"];
     }
     */
    
    ///做alpha渐变动画
    toViewController.view.alpha = 0;
    ///将截图做个动画，移动到目的地；
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.alpha = 1;
        snapshotView.frame = toView.frame;
    } completion:^(BOOL finished) {
        ///动画完毕了，就可以吧截图去掉了
        [snapshotView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        //[maskLayer removeFromSuperlayer];
    }];
}

@end
