//
//  HAViewController.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "HAViewController.h"

@implementation HAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.navigationItem) {
        CGRect frame = CGRectMake(0.0, 0.0, 200.0, self.navigationController.navigationBar.bounds.size.height);
        SINavigationMenuView *menu = [[SINavigationMenuView alloc] initWithFrame:frame title:@"Menu"];
        [menu displayMenuInView:self.view];
        menu.items = @[@"News", @"Top Articles", @"Messages", @"Account", @"Settings", @"Return to Initial Value"];
        menu.delegate = self;
        self.navigationItem.titleView = menu;
    }
}

- (void)didSelectItem:(SINavigationMenuView *)menuView atIndex:(NSUInteger)index
{
    NSLog(@"did selected item at index %d", index);
    NSString *title = nil;
    if (index < 5) {
        title = [menuView.items objectAtIndex:index];
    }
    [menuView setTitle:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
