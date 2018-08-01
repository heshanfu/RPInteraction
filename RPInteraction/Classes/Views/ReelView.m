//
//  ReelView.m
//  AwesomeApp
//
//  Created by Nurdaulet Bolatov on 5/9/18.
//  Copyright © 2018 Nurdaulet Bolatov. All rights reserved.
//

#import "Constants.h"
#import "UIColor+Utils.h"
#import "ReelView.h"
#import "LayerFactory.h"

@implementation ReelView

- (void)configurePieLayerWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                       angleDegree:(CGFloat)angleDegree
                            colors:(NSArray *)colors
                        startPoint:(CGPoint)startPoint
                          endPoint:(CGPoint)endPoint {
    CALayer *pieLayer = [LayerFactory pieLayerWithFrame:self.bounds
                                       startAngleDegree:angleDegree
                                         endAngleDegree:angleDegree + 45];

    CALayer *gradientLayer = [LayerFactory gradientLayerWithMask:pieLayer
                                                           frame:self.bounds
                                                          colors:colors
                                                      startPoint:startPoint
                                                        endPoint:endPoint];

    CGRect titleFrame = CGRectMake(50, 50, self.bounds.size.width - 100, self.bounds.size.height - 100);
    CALayer *pieTitleLayer = [LayerFactory pieTitleLayerWithTitle:title
                                                       titleColor:titleColor
                                                            frame:titleFrame
                                                      angleDegree:angleDegree + 112.5];

    CALayer *pieLinesLayer = [LayerFactory pieLinesLayerWithFrame:self.bounds
                                                 startAngleDegree:angleDegree - 45];

    [self.layer addSublayer:gradientLayer];
    [self.layer addSublayer:pieTitleLayer];
    [self.layer addSublayer:pieLinesLayer];
}

- (void)configureWithBadPie:(Pie *)badPie
                     ughPie:(Pie *)ughPie
                      okPie:(Pie *)okPie
                    goodPie:(Pie *)goodPie {
    NSArray *badGradient = @[(__bridge id) badPie.gradient.startGradientColor.CGColor,
                             (__bridge id) badPie.gradient.endGradientColor.CGColor];
    NSArray *ughGradient = @[(__bridge id) ughPie.gradient.startGradientColor.CGColor,
                                (__bridge id) ughPie.gradient.endGradientColor.CGColor];
    NSArray *okGradient = @[(__bridge id) okPie.gradient.startGradientColor.CGColor,
                              (__bridge id) okPie.gradient.endGradientColor.CGColor];
    NSArray *goodGradient = @[(__bridge id) goodPie.gradient.startGradientColor.CGColor,
                               (__bridge id) goodPie.gradient.endGradientColor.CGColor];

    CGFloat angleDegree = 22.5;
    [self configurePieLayerWithTitle:goodPie.title titleColor:goodPie.titleColor angleDegree:angleDegree
                              colors:goodGradient startPoint:CGPointMake(0.75, 0.5) endPoint:CGPointMake(0.5, 0.75)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:badPie.title titleColor:badPie.titleColor angleDegree:angleDegree
                              colors:badGradient startPoint:CGPointMake(0.75, 0.75) endPoint:CGPointMake(0.25, 0.75)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:ughPie.title titleColor:ughPie.titleColor angleDegree:angleDegree
                              colors:ughGradient startPoint:CGPointMake(0.5, 0.75) endPoint:CGPointMake(0.25, 0.5)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:okPie.title titleColor:okPie.titleColor angleDegree:angleDegree
                              colors:okGradient startPoint:CGPointMake(0.25, 0.75) endPoint:CGPointMake(0.25, 0.25)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:goodPie.title titleColor:goodPie.titleColor angleDegree:angleDegree
                              colors:goodGradient startPoint:CGPointMake(0.25, 0.5) endPoint:CGPointMake(0.5, 0.25)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:badPie.title titleColor:badPie.titleColor angleDegree:angleDegree
                              colors:badGradient startPoint:CGPointMake(0.25, 0.25) endPoint:CGPointMake(0.75, 0.25)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:ughPie.title titleColor:ughPie.titleColor angleDegree:angleDegree
                              colors:ughGradient startPoint:CGPointMake(0.5, 0.25) endPoint:CGPointMake(0.75, 0.5)];

    angleDegree += 45;
    [self configurePieLayerWithTitle:okPie.title titleColor:okPie.titleColor angleDegree:angleDegree
                              colors:okGradient startPoint:CGPointMake(0.75, 0.25) endPoint:CGPointMake(0.75, 0.75)];
}

@end
