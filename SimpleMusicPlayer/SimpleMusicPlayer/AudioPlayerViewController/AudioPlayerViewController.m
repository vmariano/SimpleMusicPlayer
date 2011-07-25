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

#pragma mark - Graphic bars setup
- (void)setupProgressBar {
    UIImage *stretchLeftTrack = [[UIImage imageNamed:@"progress-front.png"]
            stretchableImageWithLeftCapWidth:(NSInteger) 10.0
                                topCapHeight:(NSInteger) 0.0];

    UIImage *stretchyRightTrack = [[UIImage imageNamed:@"progress-background.png"]
            stretchableImageWithLeftCapWidth:(NSInteger) 10.0
                                topCapHeight:(NSInteger) 0.0];

    [progresSlider setThumbImage:[UIImage imageNamed:@"progress-point.png"]
                        forState:UIControlStateNormal];

    [progresSlider setMinimumTrackImage:stretchLeftTrack forState:UIControlStateNormal];
    [progresSlider setMaximumTrackImage:stretchyRightTrack forState:UIControlStateNormal];

}

- (void)setupVolumeBar {
    UIImage *stretchLeftTrack = [[UIImage imageNamed:@"volume_BLACK.png"]
            stretchableImageWithLeftCapWidth:(NSInteger) 10.0
                                topCapHeight:(NSInteger) 0.0];

    UIImage *stretchyRightTrack = [[UIImage imageNamed:@"volume_GRAY.png"]
            stretchableImageWithLeftCapWidth:(NSInteger) 10.0
                                topCapHeight:(NSInteger) 0.0];

    [volumeSlider setThumbImage:[UIImage imageNamed:@"volume_CIRCLE.png"]
                       forState:UIControlStateNormal];

    [volumeSlider setMinimumTrackImage:stretchLeftTrack forState:UIControlStateNormal];
    [volumeSlider setMaximumTrackImage:stretchyRightTrack forState:UIControlStateNormal];
}

#pragma mark -
- (void)updatePlayingTime:(NSTimeInterval)playbackDelay {
    if ([audioPlayer isPlaying]){
        [audioPlayer pause];
        [audioPlayer setCurrentTime:playbackDelay];
        [audioPlayer play];

    }
    else {
        [audioPlayer setCurrentTime:playbackDelay];
    }
}
- (void)setupAudioPlayer:(NSURL *)url {
    if (audioPlayer == nil) {
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.delegate = audioDelegate;
        
        [self playAction:nil];
        
        if (error != nil) {
            NSLog(@"Error : %@", [error description]);
        }
        progresSlider.maximumValue = (float)audioPlayer.duration;
    }
}

- (void)updateTimeLabels {
    int minsNegative    = ((int)audioPlayer.duration / 60) - ((int)audioPlayer.currentTime / 60);
    int secondsNegative = ((int)audioPlayer.duration % 60) - ((int)audioPlayer.currentTime % 60);
    
    NSString * negativeValue = [[NSString alloc]initWithFormat:@"-%d:%02d",minsNegative,secondsNegative];    
    negativeLabel.text = negativeValue;
    [negativeValue release];
    
    int minsPositive    = ((int)audioPlayer.currentTime / 60);
    int secondsPositive = ((int)audioPlayer.currentTime % 60);    
    
    NSString * positiveValue = [[NSString alloc] initWithFormat:@"%d:%02d",minsPositive,secondsPositive];
    positiveLabel.text = positiveValue;    
    [positiveValue release];
}

- (void)updateProgress {
    
    if (progresTimer && (![audioPlayer isPlaying])) {
        [progresTimer invalidate];
        progresTimer = nil;
    }

    float sliderValue = (float)audioPlayer.currentTime;
    [progresSlider setValue:sliderValue animated:YES];
    [self updateTimeLabels];
}

- (void)setupAudioWithSongNamed:(NSString *)songName {
    NSString *path = [[NSString alloc] initWithFormat:@"%@/%@",
                      [[NSBundle mainBundle] resourcePath],
                      songName];


    NSURL *url = [NSURL fileURLWithPath:path];
    [path release];
    
    [self setupAudioPlayer:url];
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupProgressBar];
    [self setupVolumeBar];
    
    // Please replece by your audio.
    [self setupAudioWithSongNamed:@"Dj Mamana - Revoluci—n en mayo (v3.1).mp3"];
}

- (void)viewDidUnload {
    [volumeSlider release];
    volumeSlider = nil;

    [progresSlider release];
    progresSlider = nil;

    if([audioPlayer isPlaying]){
        [audioPlayer stop];
    }
    
    [audioPlayer release];
    audioPlayer = nil;

    [super viewDidUnload];
}

#pragma mark - User interaction events

- (IBAction)progressChanged:(UISlider *)sender {
    NSTimeInterval playbackDelay = (NSTimeInterval)sender.value;
   [self updatePlayingTime:playbackDelay];

}

- (IBAction)volumeChanged:(UISlider *)sender {
    audioPlayer.volume = sender.value;
}

- (IBAction)rewindAction {
    NSTimeInterval playbackDelay = audioPlayer.currentTime - kInterval;        
    
    if (playbackDelay < 0) {
        playbackDelay = 0.0;
    }

    [self updatePlayingTime:playbackDelay];
    
}

- (IBAction)playAction:(id)sender {
    [audioPlayer play];    
    progresTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                    target:self
                                                  selector:@selector(updateProgress)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (IBAction)pauseAction:(id)sender {
    [audioPlayer pause];
}

- (IBAction)stopAction:(id)sender {
    [audioPlayer pause];



    [audioPlayer setCurrentTime:0.0];
    [self updatePlayingTime:0.0];
}

- (IBAction)fowardAction:(id)sender {
    NSTimeInterval playbackDelay = audioPlayer.currentTime + kInterval;
    [self updatePlayingTime:playbackDelay];
}


#pragma mark -
- (void)dealloc {
    [audioPlayer release];
    [volumeSlider release];
    [progresSlider release];

    [super dealloc];
}

@end
