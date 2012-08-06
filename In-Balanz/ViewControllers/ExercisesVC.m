//
//  ExercisesVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/4/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "ExercisesVC.h"
#import "ExercisesDetailVC.h"

@interface ExercisesVC ()

@end

@implementation ExercisesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Oefeningen";
}

- (IBAction)morningExercisesSelected {
    [self pushVC:[ExercisesDetailVC class]];
    ExercisesDetailVC *vc = (ExercisesDetailVC  *)self.navigationController.topViewController;
    vc.morning = YES;
}

- (IBAction)eveningExercisesSelected {
    [self pushVC:[ExercisesDetailVC class]];
    ExercisesDetailVC *vc = (ExercisesDetailVC  *)self.navigationController.topViewController;
    vc.morning = NO;
    
}

- (IBAction)buySelected {
    
}

@end
