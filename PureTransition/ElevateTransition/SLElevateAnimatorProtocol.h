//
//  SLElevateAnimatorProtocol.h
//  PureTransition
//
//  Created by 许乾隆 on 2017/10/10.
//  Copyright © 2017年 sohu-inc.com. All rights reserved.
//

#ifndef SLElevateAnimatorProtocol_h
#define SLElevateAnimatorProtocol_h

@protocol SLElevateFromAnimatorProtocol <NSObject>
@required

/**
 返回fromVC做动画的view
 
 @return a view
 */
- (UIView *)fromViewForAnimatedTransitioning;

@end

@protocol SLElevateToAnimatorProtocol <NSObject>
@required

/**
 返回toVC做动画的view
 
 @return a view
 */
- (UIView *)toViewForAnimatedTransitioning;

@end

#endif /* SLElevateAnimatorProtocol_h */
