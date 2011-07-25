//
//  MainViewController.h
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 7/24/11.
//

#import <AVFoundation/AVFoundation.h>
#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {

}

- (IBAction)showInfo:(id)sender;

@end
