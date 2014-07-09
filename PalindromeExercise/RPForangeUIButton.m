//
//  RPForangeUIButton.m
//  imPrompTo
//
//  Created by Robert Figueras on 6/28/14.
//  Copyright (c) 2014 Appivot LLC. All rights reserved.
//

#import "RPForangeUIButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation RPForangeUIButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // size and shape
        CGRect buttonFrame = self.frame;
        buttonFrame.size = CGSizeMake(232.0, 44.0);
        self.frame = buttonFrame;
        self.layer.cornerRadius = 5.0f;

        // color
        self.backgroundColor = [UIColor colorWithRed:216.0/255 green:64.0/255 blue:38.0/255 alpha:1.0];

        // shadow
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.1;
        self.layer.shadowOffset = CGSizeMake(0.0f, 8.0f);

        // font
        self.titleLabel.font = [UIFont fontWithName:@"Cabin-Bold" size:18];
    }
    return self;
}

@end
