//
//  SAMenuButton.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "SIMenuButton.h"
#import "SIMenuConfiguration.h"

@implementation SIMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        frame.origin.y -= 2.0;
        self.title = [[UILabel alloc] initWithFrame:frame];
        self.title.textAlignment = NSTextAlignmentCenter;
        NSDictionary *currentStyle = [[UINavigationBar appearance] titleTextAttributes];
        self.title.textColor = currentStyle[UITextAttributeTextColor];
        self.title.font = currentStyle[UITextAttributeFont];

        self.arrow = [[UIImageView alloc] initWithImage:[SIMenuConfiguration arrowImage]];
        [self.title addSubview:self.arrow];
        
        [self addSubview:self.title];
    }
    return self;
}

- (UIImageView *)defaultGradient
{
    return nil;
}

- (void)layoutSubviews
{
    [self.title sizeToFit];
    CGRect frame = self.title.frame;
    frame.size.width += CGRectGetWidth(self.arrow.frame)*3;
    self.title.frame = frame;
    self.title.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height-2.0)/2 + 1);
    self.arrow.frame = CGRectMake(CGRectGetWidth(frame) - CGRectGetWidth(self.arrow.frame), CGRectGetHeight(frame) - CGRectGetHeight(self.arrow.frame) - 3.0, CGRectGetWidth(self.arrow.frame), CGRectGetHeight(self.arrow.frame));
}

#pragma mark -
#pragma mark Handle taps
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isActive = !self.isActive;
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

@end
