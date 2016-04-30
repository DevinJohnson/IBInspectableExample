//
//  IBTTBorderButton.m
//  IBTechTalk
//
//  Created by Devin Johnson on 4/7/16.
//  Copyright © 2016 Devin Johnson. All rights reserved.
//

#import "IBTTBorderButton.h"

@interface IBTTBorderButton ()

@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable UIColor *gradientColorStart;
@property (nonatomic) IBInspectable UIColor *gradientColorMiddle;
@property (nonatomic) IBInspectable UIColor *gradientColorEnd;

@end

@implementation IBTTBorderButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setupViewProperties];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self setupViewProperties];
    }
    return self;
}

- (void)setupViewProperties {
    self.layer.borderWidth = _borderWidth;
    self.layer.borderColor = [_borderColor CGColor];
    [self drawGradient];
}

- (CAGradientLayer *)createGradientLayer {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[_gradientColorStart CGColor], (id)[_gradientColorMiddle CGColor], (id)[_gradientColorEnd CGColor], nil];
    gradient.endPoint = CGPointMake(0, 1);
    return gradient;
}

- (void)drawGradient {
    CAGradientLayer *gradient = [self createGradientLayer];
    [self.layer addSublayer:gradient];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (borderWidth != _borderWidth) {
        _borderWidth = borderWidth;
        [self setupViewProperties];
    }
}
- (void)setBorderColor:(UIColor *)borderColor {
    if (borderColor != _borderColor) {
        _borderColor = borderColor;
        [self setupViewProperties];
    }
}

- (void)drawRect:(CGRect)rect {
    [self drawGradient];
}

@end
