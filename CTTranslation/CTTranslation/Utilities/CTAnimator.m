//
//  CTAnimator.m
//  CTTranslation
//
//  Created by CPU11716 on 1/14/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import "CTAnimator.h"
@interface CTAnimator()

@end

@implementation CTAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.duration = 0.8;
        self.presenting = YES;
        self.originFrame = CGRectZero;
    }
    return self;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = transitionContext.containerView;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];

    //tuỳ vào đang show hay dismiss mà view cuối khác nhau.
    UIView *desView = (self.presenting) ? toView :fromView;

    //lấy frame của view hiện tại và view sắp dùng
    CGRect fromFrame = (self.presenting) ? self.originFrame : desView.frame;
    CGRect toFrame = (self.presenting) ? desView.frame : self.originFrame;

    //tỉ lệ thu nhỏ | nếu phóng lớn thì dùng identify vì full màn hình
    float xScale = (self.presenting) ? fromFrame.size.width/toFrame.size.width : toFrame.size.width/fromFrame.size.width;
    float yScale = (self.presenting) ? fromFrame.size.height/toFrame.size.height : toFrame.size.height/fromFrame.size.height;
    
    //đưa về size bằng với size gốc để mở rộng sau này nhìn trùng khớp
    CGAffineTransform transform =CGAffineTransformMakeScale(xScale, yScale);
    if (self.presenting) {
        desView.transform = transform;
        desView.center = CGPointMake(fromFrame.origin.x + fromFrame.size.width/2, fromFrame.origin.y + fromFrame.size.height/2);
    }
    
    [containerView addSubview:toView];
    [containerView bringSubviewToFront:desView];
    
    [UIView animateWithDuration:self.duration
                     animations:^{
                         //nếu đang presening là đang mở rộng ra full màn hình, ngược lại là thu nhỏ về origin frame
                         desView.transform = (self.presenting) ? CGAffineTransformIdentity : transform;
                    } completion:^(BOOL finished) {
                    [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

@end
