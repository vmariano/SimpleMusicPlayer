//
//  SimpleMusicPlayerAppDelegate.h
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 7/24/11.
//  Copyright 2011 FDV Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface SimpleMusicPlayerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end
