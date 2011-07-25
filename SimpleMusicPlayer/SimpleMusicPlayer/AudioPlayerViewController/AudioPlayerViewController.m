//
//  AudioPlayerViewController.m
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 07/25/11.
//

#import "AudioPlayerViewController.h"

@implementation AudioPlayerViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupProgressBar {
    UIImage *stretchLeftTrack = [[UIImage imageNamed:@"progress-background.png"]
                                 stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                 topCapHeight:(NSInteger)0.0];
    
    UIImage *stretchyRightTrack = [[UIImage imageNamed:@"progressbra-front.png"]
                                   stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                   topCapHeight:(NSInteger)0.0];
    
    [progresSlider setThumbImage: [UIImage imageNamed:@"progress-point.png"]
                       forState:UIControlStateNormal];
    
    [progresSlider setMinimumTrackImage:stretchLeftTrack    forState:UIControlStateNormal];
    [progresSlider setMaximumTrackImage:stretchyRightTrack  forState:UIControlStateNormal];
    
}

- (void)setupVolumeBar {
    UIImage *stretchLeftTrack = [[UIImage imageNamed:@"volume_BLACK.png"]
                                stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                topCapHeight:(NSInteger)0.0];

    UIImage *stretchyRightTrack = [[UIImage imageNamed:@"volume_GRAY.png"]
                                 stretchableImageWithLeftCapWidth:(NSInteger)10.0
                                 topCapHeight:(NSInteger)0.0];

    [volumeSlider setThumbImage: [UIImage imageNamed:@"volume_CIRCLE.png"]
                       forState:UIControlStateNormal];

    [volumeSlider setMinimumTrackImage:stretchLeftTrack    forState:UIControlStateNormal];
    [volumeSlider setMaximumTrackImage:stretchyRightTrack  forState:UIControlStateNormal];
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupProgressBar];
    [self setupVolumeBar];
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
