//
//  AudioPlayerViewController.m
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 07/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AudioPlayerViewController.h"

@implementation AudioPlayerViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupProgressBar {
    UIImage *stretchLeftTrack = [[UIImage imageNamed:@"PROGRESS_BLACK.png"]
                                stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                topCapHeight:(NSInteger)0.0];

    UIImage *stretchyRightTrack = [[UIImage imageNamed:@"PROGRESS_GRAY.png"]
                                 stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                 topCapHeight:(NSInteger)0.0];

    [progresSlider setThumbImage: [UIImage imageNamed:@"PROGRESS_CIRCLE.png"]
                       forState:UIControlStateNormal];

    [progresSlider setMinimumTrackImage:stretchLeftTrack    forState:UIControlStateNormal];
    [progresSlider setMaximumTrackImage:stretchyRightTrack  forState:UIControlStateNormal];
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupProgressBar];
    //[self setupVolumeBar];
}

- (void)viewDidUnload {
    [volumeSlider release];
    volumeSlider = nil;
    
    [progresSlider release];
    progresSlider = nil;
    
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - User interaction events
- (IBAction)progressChanged:(UISlider *)sender {
    
}

- (IBAction)volumeChanged:(UISlider *)sender {
    
}

#pragma mark -
- (void)dealloc {
    [volumeSlider release];
    [progresSlider release];
    [super dealloc];
}

@end
