//
//  MainVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/3/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "MainVC.h"
#import "VideoVC.h"
#import "QuestionnaireVC.h"
#import "AboutUsVC.h"
#import "ExercisesVC.h"
#import "AboutUsDetailVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Startscherm";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (IBAction)videoSelected {
    [self pushVC:[VideoVC class]];
}

- (IBAction)questionnaireSelected {
    [self pushVC:[QuestionnaireVC class]];
}

- (IBAction)aboutUsSelected {
    [self pushVC:[AboutUsVC class]];
}

- (IBAction)exercisesSelected {
    [self pushVC:[ExercisesVC class]];
}

- (IBAction)infoSelected {
    [self pushVC:[AboutUsDetailVC class]];
    
    AboutUsDetailVC *vc = (AboutUsDetailVC *)self.navigationController.topViewController;
    vc.type = kOpJeWerk;
}

@end
