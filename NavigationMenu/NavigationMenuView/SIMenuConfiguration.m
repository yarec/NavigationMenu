//
//  SIMenuConfiguration.m
//  NavigationMenu
//
//  Created by Ivan Sapozhnik on 2/20/13.
//  Copyright (c) 2013 Ivan Sapozhnik. All rights reserved.
//

#import "SIMenuConfiguration.h"

@implementation SIMenuConfiguration
//Menu width
+ (float)menuWidth
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    return window.frame.size.width;
}

//Menu item height
+ (float)itemCellHeight
{
    return 44.0f;
}

//Animation duration of menu appearence
+ (float)animationDuration
{
    return 0.3f;
}

//Menu substrate alpha value
+ (float)backgroundAlpha
{
    return 0.6;
}

//Menu alpha value
+ (float)menuAlpha
{
    return 0.0;
}

//Value of bounce
+ (float)bounceOffset
{
    return -7.0;
}

//Arrow image near title
+ (UIImage *)arrowImage
{
    return [UIImage imageNamed:@"arrow"];
}

//Distance between Title and arrow image
+ (float)arrowPadding
{
    return 13.0;
}

//Items color in menu
+ (UIColor *)itemsColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)mainColor
{
    return [UIColor whiteColor];
}

+ (float)selectionSpeed
{
    return 0.15;
}

+ (UIColor *)itemTextColor
{
    return [UIColor colorWithRed:0.0/255.0 green:156.0/255.0 blue:173.0/255.0 alpha:1.0];
}

+ (UIColor *)selectionColor
{
    return [UIColor whiteColor];
}

+(UITableViewCellSeparatorStyle)itemCellSeperatorStyle{
    return UITableViewCellSeparatorStyleSingleLine;
}

+(UIColor *)itemCellSeperatorColor{
    return [UIColor colorWithRed:0.0/255.0 green:156.0/255.0 blue:173.0/255.0 alpha:1.0];
}

@end
