//
//  FlipsideViewController.h
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 7/24/11.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;
@interface FlipsideViewController : UIViewController {
    

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end


@protocol FlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end
