//
//  AudioPlayerViewController.h
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 07/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define kInterval  7.0;

@interface AudioPlayerViewController : UIViewController <AVAudioPlayerDelegate> {
    IBOutlet UISlider *volumeSlider;
    IBOutlet UISlider *progresSlider;
    
    IBOutlet UILabel * positiveLabel;
    IBOutlet UILabel * negativeLabel;

    AVAudioPlayer * audioPlayer;
    id <AVAudioPlayerDelegate> audioDelegate;
    
    NSTimer * progresTimer;
}

- (IBAction)progressChanged:(UISlider *)sender;
- (IBAction)volumeChanged:(UISlider *)sender;
- (IBAction)rewindAction;
- (IBAction)playAction:(id)sender;
- (IBAction)pauseAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)fowardAction:(id)sender;

@end
