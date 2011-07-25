//
//  AudioPlayerViewController.h
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 07/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AudioPlayerViewController : UIViewController {

    IBOutlet UISlider *volumeSlider;
    IBOutlet UISlider *progresSlider;
    
    
}
- (IBAction)progressChanged:(UISlider *)sender;
- (IBAction)volumeChanged:(UISlider *)sender;

@end
