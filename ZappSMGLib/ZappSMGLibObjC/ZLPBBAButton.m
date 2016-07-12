//
//  ZLPBBAButton.m
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import "ZLPBBAButton.h"

@class ZLPBBAButton;

// ================================================

@interface UIColor (ZLUtils)

+ (instancetype)zl_pbbaButtonBackgroundColor;

@end

@implementation UIColor (ZLUtils)

+ (instancetype)zl_pbbaButtonBackgroundColor
{
    return [UIColor colorWithRed:255/255.0 green:105/255.0 blue:30/255.0 alpha:1];
}

@end

// ================================================

@interface UIImage (ZLUtils)

+ (instancetype)zl_ppbaImage:(NSString *)name;

@end

@implementation UIImage (ZLUtils)

+ (instancetype)zl_ppbaImage:(NSString *)name
{
    NSInteger scale = floor([[UIScreen mainScreen] scale]);
    NSString *imageNameSuffix = (scale > 1) ? [NSString stringWithFormat:@"@%ldx", (long) scale] : @"";
    NSString *imageFinalName = [name stringByAppendingString:imageNameSuffix];
    
    NSBundle *libResourceBundle;
    NSString *path;
    
    NSURL *libResourceBundleURL = [[NSBundle mainBundle] URLForResource:@"ZappSMGLibResources" withExtension:@"bundle"];
    
    if (libResourceBundleURL) {
        libResourceBundle = [NSBundle bundleWithURL:libResourceBundleURL];
        if (libResourceBundle) {
            path = [libResourceBundle pathForResource:imageFinalName ofType:@"png"];
        }
    }
    
    if (libResourceBundle) {
        libResourceBundle = [NSBundle bundleForClass:[ZLPBBAButton class]];
        if (libResourceBundle) {
            path = [libResourceBundle pathForResource:imageFinalName ofType:@"png" inDirectory:@"ZappSMGLibResources.bundle"];
        }
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage imageWithData:data scale:scale];
    
    return image;
}

@end

// ================================================

@interface ZLSquiggleView : UIView <ZLAnimatable>

@end

@implementation ZLSquiggleView
{
    UIImageView *_squiggleImageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIImage *squiggleImage = [[UIImage zl_ppbaImage:@"squiggle-part-15"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    NSAssert(squiggleImage, @"PBBA button assets not loaded. Make sure that ZappSMGLib resources are being loaded.");
    _squiggleImageView = [[UIImageView alloc] initWithImage:squiggleImage];
    _squiggleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _squiggleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _squiggleImageView.tintColor = [UIColor whiteColor];
    
    [self addSubview:_squiggleImageView];
    
    NSMutableArray *animationImages = [NSMutableArray array];
    
    for (int i = 0; i <= 47; i++) {
        NSString *imageName = [NSString stringWithFormat:@"squiggle-part-%02d", i];
        UIImage *image = [[UIImage zl_ppbaImage:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [animationImages addObject:image];
    }
    
    _squiggleImageView.animationImages = animationImages;
    _squiggleImageView.animationDuration = 2.3f;
    
    NSDictionary *bindedViews = @{@"squiggleImageView": _squiggleImageView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[squiggleImageView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[squiggleImageView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - ZPMAnimatable

- (BOOL)isAnimating
{
    return [_squiggleImageView isAnimating];
}

- (void)startAnimating
{
    [_squiggleImageView startAnimating];
}

- (void)stopAnimating
{
    [_squiggleImageView stopAnimating];
}

@end

// ================================================

@interface ZLPBBAButtonTitleView : UIView <ZLAnimatable>

@end

@implementation ZLPBBAButtonTitleView
{
    UIImageView *_titleImageView;
    ZLSquiggleView *_squiggleView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.userInteractionEnabled = YES;
    
    UIImage *titleImage = [[UIImage zl_ppbaImage:@"button-title-base"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    NSAssert(titleImage, @"PBBA button assets not loaded. Make sure that ZappSMGLib resources are being loaded.");
    _titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    _titleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleImageView.tintColor = [UIColor whiteColor];
    
    _squiggleView = [[ZLSquiggleView alloc] initWithFrame:CGRectZero];
    [_titleImageView addSubview:_squiggleView];
    
    [self addSubview:_titleImageView];
    
    NSDictionary *bindedViews = @{@"titleImageView": _titleImageView, @"squiggleView": _squiggleView};
    
    // Squiggle view aspect ratio 1:1
    [_squiggleView addConstraint:[NSLayoutConstraint constraintWithItem:_squiggleView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:_squiggleView
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:1
                                                               constant:0]];
    
    
    // Squiggle view height equal to title image view height
    [_titleImageView addConstraint:[NSLayoutConstraint constraintWithItem:_squiggleView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_titleImageView
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:1
                                                                 constant:0]];
    
    // Maximum height for title image view - keep default
    NSString *heightExpression = [NSString stringWithFormat:@"V:[titleImageView(<=%f)]", CGRectGetHeight(_titleImageView.bounds)];
    [_titleImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:heightExpression
                                                                            options:0
                                                                            metrics:nil
                                                                              views:bindedViews]];
    
    // Title image view aspect ratio - keep default
    CGFloat multiplier = (CGRectGetHeight(_titleImageView.bounds) / CGRectGetWidth(_titleImageView.bounds)) ?: 1;
    [_titleImageView addConstraint:[NSLayoutConstraint constraintWithItem:_titleImageView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_titleImageView
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:multiplier
                                                                 constant:0]];
    
    // Align squiggle view in title image view
    [_titleImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-3)-[squiggleView]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:bindedViews]];
    
    [_titleImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[squiggleView]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:bindedViews]];
    
    // Align title image view in self
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=5)-[titleImageView]-(>=5)-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=5)-[titleImageView]-(>=5)-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleImageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_titleImageView
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1
                                                      constant:0]];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return NO;
}

#pragma mark - ZPMAnimatable

- (void)startAnimating
{
    [_squiggleView startAnimating];
}

- (void)stopAnimating
{
    [_squiggleView stopAnimating];
}

- (BOOL)isAnimating
{
    return [_squiggleView isAnimating];
}

@end

// ================================================

@implementation ZLPBBAButton
{
    ZLPBBAButtonTitleView *_titleView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 4.0f;
    self.userInteractionEnabled = YES;
    self.isAccessibilityElement = YES;
    
    self.accessibilityIdentifier = @"com.zapp.zpmzappbutton";
    self.accessibilityLabel = NSLocalizedString(@"Pay by bank app", nil);
    
    _titleView = [[ZLPBBAButtonTitleView alloc] initWithFrame:self.bounds];
    [self addSubview:_titleView];
    
    NSDictionary *bindedViews = @{@"buttonTitleView": _titleView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buttonTitleView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[buttonTitleView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:bindedViews]];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (BOOL)accessibilityActivate
{
    [self didTapButton:self];
    
    return YES;
}

- (UIAccessibilityTraits)accessibilityTraits
{
    return UIAccessibilityTraitButton;
}

- (void)didTapButton:(ZLPBBAButton *)button
{    
    if (self.enabled == NO) {
        return;
    }
    
    if (self.tapHandler) {
        [_titleView startAnimating];
        self.tapHandler(button);
    }
}

- (void)startAnimating
{
    self.enabled = NO;
    [_titleView startAnimating];
}

- (void)stopAnimating
{
    self.enabled = YES;
    [_titleView stopAnimating];
}

- (BOOL)isAnimating
{
    return [_titleView isAnimating];
}

@end
