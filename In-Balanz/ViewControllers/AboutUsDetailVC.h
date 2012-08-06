//
//  AboutUsDetailVC.h
//  In-Balanz
//
//  Created by Matias Altalef on 8/6/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

typedef enum {
    kAdemTherapie = 1,
    kCounseling = 2,
    kRelatieTherapie = 3,
    kOpJeWerk = 4
} AboutUsDetailType;

#import <UIKit/UIKit.h>
#import "CommonVC.h"

@interface AboutUsDetailVC : CommonVC

@property(nonatomic, assign) AboutUsDetailType type;

@end
