//
//  SLRootViewController.m
//  PureTransition
//
//  Created by sohu-inc.com on 10/10/2017.
//  Copyright (c) 2017 sohu-inc.com. All rights reserved.
//

#import "SLRootViewController.h"
#import "SLDetailViewController.h"

@interface SLRootViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation SLRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tappedMyCat:(UITapGestureRecognizer *)sender
{
    SLDetailViewController *detailVC = [[SLDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (UIView *)fromViewForAnimatedTransitioning
{
    return self.cat;
}

- (UIView *)toViewForAnimatedTransitioning
{
    return self.cat;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
