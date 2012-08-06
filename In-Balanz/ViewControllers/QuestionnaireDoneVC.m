//
//  QuestionnaireDoneVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/6/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "QuestionnaireDoneVC.h"

@interface QuestionnaireDoneVC () {
    IBOutlet UILabel *label;
}

@end

@implementation QuestionnaireDoneVC

@synthesize result = _result;

- (void)setResult:(BOOL)result {
    _result = result;
    
    label.text = _result ?
                    @"more than 5/7 answers = YES" :
                    @"most answers = NO";
}

@end
