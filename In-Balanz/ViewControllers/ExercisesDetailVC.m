//
//  ExercisesDetailVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/6/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "ExercisesDetailVC.h"
#import "QuartzCore/QuartzCore.h"

@interface ExercisesDetailVC () {
    IBOutlet UIButton *backButton;
    IBOutlet UIImageView *arrow;
    IBOutlet UILabel *titleLabel;
    IBOutlet UITextView *textView;
}

@end

@implementation ExercisesDetailVC

@synthesize morning = _morning;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textView.layer.cornerRadius = 6;
    
    UIBarButtonItem *firstButton = [[[UIBarButtonItem alloc] initWithTitle:@"Staand"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(firstButtonSelected)]
                                    autorelease];
    
    UIBarButtonItem *secondButton = [[[UIBarButtonItem alloc] initWithTitle:@"Zittend"
                                                                      style:UIBarButtonItemStyleBordered
                                                                     target:self
                                                                     action:@selector(secondButtonSelected)]
                                     autorelease];
    
    UIBarButtonItem *thirdButton = [[[UIBarButtonItem alloc] initWithTitle:@"Liggend in uw bed"
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(thirdButtonSelected)]
                                    autorelease];
    
    self.toolbarItems = [NSArray arrayWithObjects:firstButton, secondButton, thirdButton, nil];
    
    
    UIImage *imgButton = [UIImage imageNamed:@"stretchableBackButton.png"];
    CGFloat left = 0.6 * (imgButton.size.width - 1);
    CGFloat right = imgButton.size.width - left - 1;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, left, 0, right);
    
    imgButton = [imgButton resizableImageWithCapInsets:insets];
    
    [backButton setBackgroundImage:imgButton forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController setToolbarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setToolbarHidden:YES animated:YES];
}

- (IBAction)backSelected {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)firstButtonSelected {
    
    CGRect frame = arrow.frame;
    frame.origin.x = 30;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         arrow.frame = frame;
                     }
                     completion:nil];
}

- (IBAction)secondButtonSelected {
    
    CGRect frame = arrow.frame;
    frame.origin.x = 90;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         arrow.frame = frame;
                     }
                     completion:nil];
}

- (IBAction)thirdButtonSelected {
    
    CGRect frame = arrow.frame;
    frame.origin.x = 180;
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         arrow.frame = frame;
                     }
                     completion:nil];
}

- (void)setMorning:(BOOL)morning {
    _morning = morning;
    
    titleLabel.text = _morning ? @"Ochtend" : @"Avond";
}


@end
