//
//  MainViewController.m
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 7/24/11.
//

#import "MainViewController.h"
#import "AudioPlayerViewController.h"

@implementation MainViewController

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil];
    
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:controller animated:YES];
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startAudioPlayer {
   AudioPlayerViewController * ap = [[AudioPlayerViewController alloc] initWithNibName:@"AudioPlayerViewController" bundle:nil];
   [self.view addSubview:ap.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startAudioPlayer];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}

@end
