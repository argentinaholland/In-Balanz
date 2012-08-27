//
//  VideoVC.m
//  In-Balanz
//
//  Created by Matias Altalef on 8/4/12.
//  Copyright (c) 2012 Burnt Soap. All rights reserved.
//

#import "VideoVC.h"

#define kVideoName @"Audiofeed_test"
#define kVideoExtension @"MOV"

@interface VideoVC () {
    IBOutlet UIView *_videoView;
}

- (void)renderVideo;

@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Video";
    [_videoView setBackgroundColor:[UIColor clearColor]];
    [self renderVideo];
}

- (void)renderVideo {
    NSString *bundleURL = [[NSBundle mainBundle] pathForResource:kVideoName ofType:kVideoExtension];
    NSURL *url = [NSURL fileURLWithPath:bundleURL];
    MPMoviePlayerController *playerView = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [playerView.view setFrame:CGRectMake(0, 0, _videoView.frame.size.width, _videoView.frame.size.height)];
    playerView.scalingMode = MPMovieScalingModeAspectFit;
    [playerView prepareToPlay];
    
    [_videoView addSubview:playerView.view];
    playerView.view.layer.cornerRadius = 9.0f;
    _videoView.layer.cornerRadius = 9.0f;
    [playerView play];
}

@end
