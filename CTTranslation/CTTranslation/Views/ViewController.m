//
//  ViewController.m
//  CTTranslation
//
//  Created by CPU11716 on 1/14/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CTAnimator.h"

@interface ViewController ()
@property CTAnimator *transition;
@property (weak, nonatomic) IBOutlet UIImageView *roseImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transition = [CTAnimator new];
    self.roseImageView.frame = CGRectMake(0, 0, 180, 182);
}
- (IBAction)onNextVc:(id)sender {
    [self performSegueWithIdentifier:@"showDetails" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *secondVC = segue.destinationViewController;
    secondVC.transitioningDelegate = self;
}

//transitioning delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.transition.presenting = YES;
    self.transition.originFrame = self.roseImageView.frame;
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.transition.presenting = NO;
    return self.transition;
}
@end
