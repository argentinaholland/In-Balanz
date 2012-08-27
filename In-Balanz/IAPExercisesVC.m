//
//  IAPExcercisesVC.m
//  AdemInBalanz
//
//  Created by Nicolas Vidal on 8/26/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "IAPExercisesVC.h"
#import "CustomButton.h"

@interface IAPExercisesVC () {
    NSMutableArray *_exercises;
    IBOutlet UIScrollView *_scroll;
}

- (void)renderExercises;

@end

@implementation IAPExercisesVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _exercises = [NSMutableArray arrayWithObjects:@"Oefening 2.", @"Oefening 3.", @"Oefening 4.", @"Oefening 5.", @"Oefening 6.", @"Oefening 7.", @"Oefening 8.", @"Oefening 9.", nil];
    
    [self renderExercises];
    // Do any additional setup after loading the view from its nib.
}

- (void)renderExercises {
    int height = 70;
    int margin = 10;
    
    [_scroll setContentSize:CGSizeMake(_scroll.frame.size.width, [_exercises count] * height)];
    for (int i = 0; i < [_exercises count]; i++) {
        CustomButton *button = [[[CustomButton alloc] initWithFrame:CGRectMake(margin, i * height, _scroll.frame.size.width - (margin * 2), height)] autorelease];
        [button setTitle:[_exercises objectAtIndex:i] forState:UIControlStateNormal];
        
        [_scroll addSubview:button];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
