//
//  FlipsideViewController.m
//  SimpleMusicPlayer
//
//  Created by Mariano Vicente on 7/24/11.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController
@synthesize delegate=_delegate;

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];  
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - Actions
- (IBAction)done:(id)sender {
    [self.delegate flipsideViewControllerDidFinish:self];
}


@end
