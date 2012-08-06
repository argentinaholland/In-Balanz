//
//  CustomButton.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/4/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)setup {
    UIImage *imgNormal = [UIImage imageNamed:@"button.normal.png"];
    CGFloat left = 0.5 * (imgNormal.size.width - 1);
    UIEdgeInsets insets = UIEdgeInsetsMake(0, left, 0, left);
    
    imgNormal = [imgNormal resizableImageWithCapInsets:insets];
    UIImage *imgHighlighted = [[UIImage imageNamed:@"button.pressed.png"] resizableImageWithCapInsets:insets];
    
    [self setBackgroundImage:imgNormal forState:UIControlStateNormal];
    [self setBackgroundImage:imgHighlighted forState:UIControlStateHighlighted];
    
    if (self.frame.size.height != imgNormal.size.height) {
        CGRect frame = self.frame;
        frame.size.height = imgNormal.size.height;
        self.frame = frame;
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

@end
