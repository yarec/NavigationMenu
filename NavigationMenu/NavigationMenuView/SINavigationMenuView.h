//
//  SINavigationMenuView.h
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIMenuTable.h"

@class SINavigationMenuView;

@protocol SINavigationMenuDelegate <NSObject>

- (void)didSelectItem:(SINavigationMenuView *)menuView atIndex:(NSUInteger)index;

@end

@interface SINavigationMenuView : UIView <SIMenuDelegate>

@property (nonatomic, weak) id <SINavigationMenuDelegate> delegate;
@property (nonatomic, strong) NSArray *items;

- (id)initWithFrame:(CGRect)frame title:(NSObject *)title;
- (id)initWithFrame:(CGRect)frame title:(NSObject *)title fullScreen:(BOOL)fullScreen;
- (void)displayMenuInView:(UIView *)view;
- (void)setTitle:(NSObject *)title;
- (void)hideMenu;

@end
