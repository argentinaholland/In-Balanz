//
//  AboutUsDetailVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/6/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "AboutUsDetailVC.h"

#import "QuartzCore/QuartzCore.h"

@interface AboutUsDetailVC () {
    IBOutlet UIImageView *image;
    IBOutlet UITextView *text;
}

@end

@implementation AboutUsDetailVC

@synthesize type = _type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    text.layer.cornerRadius = 20;
}


- (void)setType:(AboutUsDetailType)type {
    _type = type;
    if (_type == kOpJeWerk) {
        self.title = @"Op je Werk";
        text.hidden = YES;
        image.hidden = NO;
    } else {
        text.hidden = NO;
        image.hidden = YES;
        
        /*  */ if (_type == kRelatieTherapie) {
            self.title = @"Relatie therapie";
            text.text = @"lorem ipsum relatie therapie...";
        } else if (_type == kCounseling) {
            self.title = @"Counseling";
            text.text = @"lorem ipsum counseling...";
        } else if (_type == kAdemTherapie) {
            self.title = @"Adem therapie";
            text.text = @"lorem ipsum adem therapie...";
        }
    }
        
}

@end
