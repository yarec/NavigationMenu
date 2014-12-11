//
//  SAMenuCell.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/19/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "SIMenuCell.h"
#import "SIMenuConfiguration.h"
#import "UIColor+Extension.h"
#import <QuartzCore/QuartzCore.h>

@interface SIMenuCell ()
@property (nonatomic, strong) UIView *cellSelection;
@end

@implementation SIMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor color:[SIMenuConfiguration itemsColor] withAlpha:[SIMenuConfiguration menuAlpha]];
        self.textLabel.textColor = [SIMenuConfiguration itemTextColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        
        self.selectionStyle = UITableViewCellEditingStyleNone;

        self.cellSelection = [[UIView alloc] initWithFrame:self.bounds];
        self.cellSelection.backgroundColor = [SIMenuConfiguration selectionColor];
        [self.contentView insertSubview:self.cellSelection belowSubview:self.textLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setSelected:(BOOL)selected withCompletionBlock:(void (^)())completion
{
    [UIView animateWithDuration:[SIMenuConfiguration selectionSpeed] animations:^{
        
    } completion:^(BOOL finished) {
        completion();
    }];
}

- (void)dealloc
{
    self.cellSelection = nil;
}

@end
