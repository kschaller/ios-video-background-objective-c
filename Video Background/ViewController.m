//
//  ViewController.m
//  Video Background MoviePlayer
//
//  Created by Kai Schaller on 3/11/15.
//  Copyright (c) 2015 Kai Schaller. All rights reserved.
//

#import "ViewController.h"
@import MediaPlayer;

@interface ViewController ()

@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load the video from the app bundle.
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"video" withExtension:@"mov"];
    
    // Create and configure the movie player.
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    
    self.moviePlayer.view.frame = self.view.frame;
    [self.view insertSubview:self.moviePlayer.view atIndex:0];
    
    [self.moviePlayer play];
    
    // Loop video.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loopVideo) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
}

- (void)loopVideo {
    [self.moviePlayer play];
}

@end
