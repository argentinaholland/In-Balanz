//
//  AboutUsVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/4/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "AboutUsVC.h"
#import "AboutUsDetailVC.h"

#import "QuartzCore/QuartzCore.h"
#import "MapKit/MapKit.h"

@interface AboutUsVC () {
    IBOutlet MKMapView *map;
}

@end

@implementation AboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Over ons";
    
    map.region = MKCoordinateRegionForMapRect(MKMapRectMake(137800000, 87800000, 1000000, 1000000));
    
    map.layer.cornerRadius = 25;
}

- (IBAction)buttonTouched:(UIButton *)sender {
    [self pushVC:[AboutUsDetailVC class]];
    AboutUsDetailVC *vc = (AboutUsDetailVC *)self.navigationController.topViewController;
    vc.type = sender.tag;
}

@end
