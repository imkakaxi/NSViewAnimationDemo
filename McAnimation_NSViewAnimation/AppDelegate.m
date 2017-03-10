//
//  AppDelegate.m
//  McAnimation_NSViewAnimation
//
//  Created by Hao Tan on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self.window.contentView setWantsLayer:YES];
    [animationView.layer setAnchorPoint:NSMakePoint(0.5, 0.5)];
}

- (IBAction)startAnimation:(id)sender;
{
    //CABasicAnimation
//    [self CABasicAnimation];
    //CAKeyframeAnimation
//    [self CAKeyframeAnimation];
    //CAAnimationGroup
    [self CAAnimationGroup];
}

- (void)CAKeyframeAnimation
{
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.duration = 2;
    keyframeAnimation.repeatCount = NSIntegerMax;
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 0.6);
    CGMutablePathRef path = CGPathCreateMutable();
    NSPoint center = NSMakePoint([self.window.contentView frame].size.width/2, [self.window.contentView frame].size.height/2);
    CGPathAddArc(path, &transform, center.x, center.y, 70, 0, 2*pi, NO);
    keyframeAnimation.path = path;
    CGPathRelease(path);
    [animationView.layer addAnimation:keyframeAnimation forKey:@""];

}

- (void)CAAnimationGroup
{
    //透明度
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 2.0;
    animation.autoreverses = YES;
    animation.repeatCount = NSIntegerMax;
    animation.fromValue = [NSNumber numberWithFloat:1];
    animation.toValue = [NSNumber numberWithFloat:0];
    
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation1.duration = 2.0;
    animation1.autoreverses = YES;
    animation1.repeatCount = NSIntegerMax;
    animation1.fromValue = [NSNumber numberWithFloat:0];
    animation1.toValue = [NSNumber numberWithFloat:2*pi];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.autoreverses = YES;
    group.repeatCount = NSIntegerMax;
    group.animations = [NSArray arrayWithObjects:animation,animation1, nil];
    [animationView.layer addAnimation:group forKey:@""];

}

- (void)CABasicAnimation
{
    //    //透明度
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    //    animation.duration = 1.0;
    //    animation.autoreverses = YES;
    ////    animation.repeatCount = NSIntegerMax;
    //    animation.repeatDuration = MAXFLOAT;
    //    animation.fromValue = [NSNumber numberWithFloat:1];
    //    animation.toValue = [NSNumber numberWithFloat:0];
    //    [animationView.layer addAnimation:animation forKey:@""];
    
    //缩放1
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    animation.duration = 2.0;
    //    animation.autoreverses = YES;
    //    animation.repeatCount = NSIntegerMax;
    //    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.5, 2, 1)];
    //    [animationView.layer addAnimation:animation forKey:@""];
    
    //缩放2
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //    animation.duration = 2.0;
    //    animation.autoreverses = YES;
    //    animation.repeatCount = NSIntegerMax;
    //    animation.fromValue = [NSNumber numberWithFloat:1.0];
    //    animation.toValue = [NSNumber numberWithFloat:0.1];
    //    [animationView.layer addAnimation:animation forKey:@""];
    
    //旋转1
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    animation.duration = 2.0;
    //    //animation.autoreverses = YES;
    //    animation.repeatCount = NSIntegerMax;
    //    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity,pi, 0, 0, 1)];
    //    [animationView.layer addAnimation:animation forKey:@""];
    
    //旋转2
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    animation.duration = 2.0;
    //    //animation.autoreverses = YES;
    //    animation.repeatCount = NSIntegerMax;
    //    animation.fromValue = [NSNumber numberWithFloat:0];
    //    animation.toValue = [NSNumber numberWithFloat:2*pi];
    //    [animationView.layer addAnimation:animation forKey:@""];
    //
    
    //平移1
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 2.0;
    animation.autoreverses = YES;
    animation.repeatCount = NSIntegerMax;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DTranslate(CATransform3DIdentity, 100, 100, 0)];
    [animationView.layer addAnimation:animation forKey:@""];
    
    //    NSLog(@"%f,",pi);
    //    NSLog(@"%f,%f,%f,%f",CATransform3DIdentity.m11,CATransform3DIdentity.m12,CATransform3DIdentity.m13,CATransform3DIdentity.m14);
    //
    //    NSLog(@"%f,%f,%f,%f",CATransform3DIdentity.m21,CATransform3DIdentity.m22,CATransform3DIdentity.m23,CATransform3DIdentity.m24);
    //
    //    NSLog(@"%f,%f,%f,%f",CATransform3DIdentity.m31,CATransform3DIdentity.m32,CATransform3DIdentity.m33,CATransform3DIdentity.m34);
    //
    //    NSLog(@"%f,%f,%f,%f",CATransform3DIdentity.m41,CATransform3DIdentity.m42,CATransform3DIdentity.m43,CATransform3DIdentity.m44);
    double delayInSeconds = 200.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //平移2
        [animationView.layer removeAllAnimations];
    });
}



@end
