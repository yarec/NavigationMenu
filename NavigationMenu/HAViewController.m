//
//  HAViewController.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "HAViewController.h"

@interface HAViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation HAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (self.navigationItem) {
        CGRect frame = CGRectMake(0.0, 0.0, 200.0, self.navigationController.navigationBar.bounds.size.height);
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"All" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        SINavigationMenuView *menu = [[SINavigationMenuView alloc] initWithFrame:frame title:title];
        [menu displayMenuInView:self.navigationController.view];
        menu.items = @[@"News", @"Top Articles", @"Messages", @"Account", @"Settings",
                       @"Long Long Long Long Long Long Long Long Long String",
                       @"Return to Initial Value", @"Top Articles", @"Top Articles", @"Top Articles", @"Top Articles", @"Top Articles", @"Top Articles", @"Top Articles"];
        menu.delegate = self;
        self.navigationItem.titleView = menu;
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d",indexPath.row];
    
    return cell;
}

- (void)didSelectItem:(SINavigationMenuView *)menuView atIndex:(NSUInteger)index
{
    NSLog(@"did selected item at index %d", index);
    NSString *title = nil;
    if (index < 6) {
        title = [menuView.items objectAtIndex:index];
    }
    [menuView setTitle:title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
