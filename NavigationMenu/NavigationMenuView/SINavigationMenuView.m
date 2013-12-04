//
//  SINavigationMenuView.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "SINavigationMenuView.h"
#import "SIMenuButton.h"
#import "QuartzCore/QuartzCore.h"
#import "SIMenuConfiguration.h"

@interface SINavigationMenuView  ()
@property (nonatomic, strong) SIMenuButton *menuButton;
@property (nonatomic, strong) SIMenuTable *table;
@property (nonatomic, strong) UIView *menuContainer;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL fullScreen;
@end

@implementation SINavigationMenuView

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    return [self initWithFrame:frame title:title fullScreen:NO];
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)title fullScreen:(BOOL)fullScreen
{
    self = [super initWithFrame:frame];
    if (self) {
        frame.origin.y += 1.0;
        self.menuButton = [[SIMenuButton alloc] initWithFrame:frame];
        self.fullScreen = fullScreen;
        if (fullScreen) {
            [self.menuButton.arrow removeFromSuperview]; // hide arrow since we cover full screen to avoid issues when back in navigation is clicked.
        }
        
        self.menuButton.title.text = _title = title;
        [self.menuButton addTarget:self action:@selector(onHandleMenuTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.menuButton];
    }
    return self;
}

- (void)displayMenuInView:(UIView *)view
{
    self.menuContainer = view;
}

- (void)setTitle:(NSString *)title;
{
    if (title) {
        self.menuButton.title.text = title;
    } else {
        self.menuButton.title.text = _title;
    }
    [self.menuButton layoutSubviews];
}

#pragma mark -
#pragma mark Actions
- (void)onHandleMenuTap:(id)sender
{
    if (self.menuButton.isActive) {
        NSLog(@"On show");
        [self onShowMenu];
    } else {
        NSLog(@"On hide");
        [self onHideMenu];
    }
}

- (void)onShowMenu
{
    if (!self.table) {
        UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
        CGRect frame = mainWindow.frame;
        if (!self.fullScreen) {
            frame.origin.y += self.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
        }
        
        self.table = [[SIMenuTable alloc] initWithFrame:frame items:self.items];
        self.table.menuDelegate = self;
    }
    [self.menuContainer addSubview:self.table];
    [self rotateArrow:M_PI];
    [self.table show];
}

- (void)onHideMenu
{
    [self rotateArrow:0];
    [self.table hide];
}

- (void)rotateArrow:(float)degrees
{
    [UIView animateWithDuration:[SIMenuConfiguration animationDuration] delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.menuButton.arrow.layer.transform = CATransform3DMakeRotation(degrees, 0, 0, 1);
    } completion:NULL];
}

#pragma mark -
#pragma mark Delegate methods
- (void)didSelectItemAtIndex:(NSUInteger)index
{
    self.menuButton.isActive = !self.menuButton.isActive;
    [self onHandleMenuTap:nil];
    [self.delegate didSelectItem:self atIndex:index];
}

- (void)didBackgroundTap
{
    self.menuButton.isActive = !self.menuButton.isActive;
    [self onHandleMenuTap:nil];
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc
{
    self.items = nil;
    self.menuButton = nil;
    self.menuContainer = nil;
}

@end
