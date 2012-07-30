//
//  ViewController.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "ListViewController.h"

@protocol NavItem;

@interface RootViewController ()
@property (strong, nonatomic) UIViewController<NavItem> *listViewCtrl;
@property (strong, nonatomic) UINavigationController *navCtrl;
@end

@implementation RootViewController

#pragma mark - View Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navCtrl.view.frame = self.view.bounds;
    [self addSubviewController:self.navCtrl];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Child Controllers

- (void)addSubviewController:(UIViewController *)viewCtrl
{
    [self addChildViewController:viewCtrl];
    [viewCtrl didMoveToParentViewController:self];
    [self.view addSubview:viewCtrl.view];
    
}

- (void)removeSubviewController:(UIViewController *)viewCtrl
{
    [viewCtrl.view removeFromSuperview];
    [viewCtrl willMoveToParentViewController:nil];
    [viewCtrl removeFromParentViewController];
}

#pragma mark - Factory Methods

- (UIViewController<NavItem> *)listViewCtrl
{
    if (nil == _listViewCtrl)
    {
        _listViewCtrl = [[ListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _listViewCtrl.title = NSLocalizedString(@"Feeds", nil);
    }
    return _listViewCtrl;
}

- (UINavigationController *)navCtrl
{
    if (nil == _navCtrl)
        _navCtrl = [[UINavigationController alloc] initWithRootViewController:self.listViewCtrl];
    return _navCtrl;
}

@end
