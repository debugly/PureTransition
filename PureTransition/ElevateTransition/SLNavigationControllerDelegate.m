//
//  SLNavigationControllerDelegate.m
//  PureTransition
//
//  Created by 许乾隆 on 2017/10/10.
//

#import "SLNavigationControllerDelegate.h"
#import "SLElevatePushAnimator.h"
#import "SLElevatePopAnimator.h"

@interface SLNavigationControllerDelegate()

@property (nonatomic,strong) SLElevatePushAnimator *pushAnimator;
@property (nonatomic,strong) SLElevatePopAnimator  *popAnimator;

@end

@implementation SLNavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimator;
    }else if (operation == UINavigationControllerOperationPush){
        return self.pushAnimator;
    }else{
        return nil;
    }
}

- (SLElevatePushAnimator *)pushAnimator
{
    if (!_pushAnimator) {
        _pushAnimator = [SLElevatePushAnimator new];
    }
    return _pushAnimator;
}

- (SLElevatePopAnimator *)popAnimator
{
    if (!_popAnimator) {
        _popAnimator = [SLElevatePopAnimator new];
    }
    return _popAnimator;
}

@end
