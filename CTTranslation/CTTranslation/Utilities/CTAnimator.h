//
//  CTAnimator.h
//  CTTranslation
//
//  Created by CPU11716 on 1/14/20.
//  Copyright © 2020 CPU11716. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property BOOL presenting;
@property CGRect originFrame;
@property float duration;
@end

NS_ASSUME_NONNULL_END
