//
//  SLDetailViewController.m
//  PureTransition_Example
//
//  Created by 许乾隆 on 2017/10/10.
//  Copyright © 2017年 sohu-inc.com. All rights reserved.
//

#import "SLDetailViewController.h"

@interface SLDetailViewController ()

@property (weak, nonatomic) UIImageView *animationDest;

@end

@implementation SLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"to"]];
    [self.view addSubview:bgView];
    bgView.frame = self.view.bounds;
    
    UIImageView *animationDest = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beauty"]];
    animationDest.frame = CGRectMake((self.view.bounds.size.width - 239)/2.0, 35, 239, 408);
    [bgView addSubview:animationDest];
    
    _animationDest = animationDest;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)toViewForAnimatedTransitioning
{
    return _animationDest;
}

- (UIView *)fromViewForAnimatedTransitioning
{
    return _animationDest;
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
