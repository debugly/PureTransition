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
    
    UIView *fromView = [fromViewController fromViewForAnimatedTransitioning];
    UIView *toView = [toViewController toViewForAnimatedTransitioning];
    
    UIView *snapshotView = [fromView snapshotViewAfterScreenUpdates:NO];
    
    [toViewController.view addSubview:snapshotView];
    snapshotView.frame = fromView.frame;
    
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];
    /*
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
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.alpha = 1;
        snapshotView.frame = toView.frame;
    } completion:^(BOOL finished) {
        [snapshotView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        //[maskLayer removeFromSuperlayer];
    }];
}

@end
