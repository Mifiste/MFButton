//
//  AnimationView.m
//  Animation
//
//  Created by lanouhn on 16/3/26.
//  Copyright © 2016年 Mifiste. All rights reserved.
//

#import "AnimationView.h"
#import "MButton.h"

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self initImageView];
        [self initCenterArray:frame];
        [self setUpView];
    }
    return self;
}

- (void)initImageView {
    
    UIImage *image = [UIImage imageNamed:@"button-chat"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    _textButton = [MButton buttonWithType:UIButtonTypeCustom];
    _textButton.frame = frame;
    [_textButton setBackgroundImage:[UIImage imageNamed:@"button-text"] forState:UIControlStateNormal];
    
    _photoButton = [MButton buttonWithType:UIButtonTypeCustom];
    _photoButton.frame = frame;
    [_photoButton setBackgroundImage:[UIImage imageNamed:@"button-photo"] forState:UIControlStateNormal];
    
    _quoteButton = [MButton buttonWithType:UIButtonTypeCustom];
    _quoteButton.frame = frame;
    [_quoteButton setBackgroundImage:[UIImage imageNamed:@"button-quote"] forState:UIControlStateNormal];
    
    _linkButton = [MButton buttonWithType:UIButtonTypeCustom];
    _linkButton.frame = frame;
    [_linkButton setBackgroundImage:[UIImage imageNamed:@"button-link"] forState:UIControlStateNormal];
    
    _chatButton = [MButton buttonWithType:UIButtonTypeCustom];
    _chatButton.frame = frame;
    [_chatButton setBackgroundImage:[UIImage imageNamed:@"button-chat"] forState:UIControlStateNormal];
    
    _videoButton = [MButton buttonWithType:UIButtonTypeCustom];
    _videoButton.frame = frame;
    [_videoButton setBackgroundImage:[UIImage imageNamed:@"button-video"] forState:UIControlStateNormal];
    
    _nevermindButton = [MButton buttonWithType:UIButtonTypeCustom];
    _nevermindButton.frame = CGRectMake(0, 0, self.frame.size.width, _photoButton.frame.size.height);
    [_nevermindButton setTitle:@"Nevermind" forState:UIControlStateNormal];
    _nevermindButton.backgroundColor = [UIColor redColor];
    
    _backgroundView = [[UIView alloc] initWithFrame:self.frame];
    
    _textButton.tag = 101;
    _photoButton.tag = 102;
    _quoteButton.tag = 103;
    _linkButton.tag = 104;
    _chatButton.tag = 105;
    _videoButton.tag = 106;
    _nevermindButton.tag = 107;
    
}

- (void)initCenterArray:(CGRect)frame {
    
    CGFloat widthUnti = frame.size.width / 4;
    CGFloat heightHigh = frame.origin.y - _textButton.frame.size.height / 2;
    CGFloat heightLow = frame.size.height + _textButton.frame.size.height / 2;
    CGFloat gap = _textButton.frame.size.height / 2 + 5;
    
    _centerHigh = [[NSMutableArray alloc] initWithObjects:
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti, heightHigh)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, heightHigh)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 3, heightHigh)],
                   nil];
    
    _centerLow = [[NSMutableArray alloc] initWithObjects:
                  [NSValue valueWithCGPoint:CGPointMake(widthUnti, heightLow)],
                  [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, heightLow)],
                  [NSValue valueWithCGPoint:CGPointMake(widthUnti * 3, heightLow)],
                  [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, frame.size.height + _nevermindButton.frame.size.height / 2)],
                  nil];
    
    _centerMenu = [[NSMutableArray alloc] initWithObjects:
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti, frame.size.height / 2 - gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, frame.size.height / 2 -gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 3, frame.size.height / 2 -gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti, frame.size.height / 2 + gap)    ],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, frame.size.height / 2 + gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 3, frame.size.height / 2 + gap)],
                   [NSValue valueWithCGPoint:CGPointMake(widthUnti * 2, frame.size.height - _nevermindButton.frame.size.height / 2)],
                   nil];
    
}

- (void)setUpView {
    
    self.hidden = YES;
    _backgroundView.backgroundColor = [UIColor colorWithRed:0.236 green:0.365 blue:0.406 alpha:1.000];
    
    _backgroundView.userInteractionEnabled = YES;
    _nevermindButton.hidden = YES;
    _nevermindButton.userInteractionEnabled = YES;
    _nevermindButton.backgroundColor = [UIColor colorWithRed:0.236 green:0.365 blue:0.406 alpha:1.000];
    [_nevermindButton setTintColor:[UIColor colorWithWhite:0.662 alpha:1.000]];
    
    [self addSubview:_backgroundView];
    [self addSubview:_textButton];
    [self addSubview:_photoButton];
    [self addSubview:_quoteButton];
    [self addSubview:_chatButton];
    [self addSubview:_linkButton];
    [self addSubview:_videoButton];
    [self addSubview:_nevermindButton];
    
}

//给按钮设置事件
- (void)addTargetToButtonWthTag:(ButtonType)buttonType complete:(addTarget)target {
    MButton *button = [self viewWithTag:buttonType];
    button.target = target;
    [button addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
}

//回调block中的代码
- (void)handleAction:(MButton *)sender {
    
    sender.target();
}

- (void)hideMenuView {
    
    if (self.isHidding) {
        return;
    }
    self.isHidding = YES;
    
    //开始创建动画
    self.nevermindButton.center = [self.centerMenu[6] CGPointValue];
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.nevermindButton.center = [self.centerLow[3] CGPointValue];
        
    } completion:^(BOOL finished) {
        
        self.nevermindButton.hidden = YES;
        self.isHidding = NO;
        
    }];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.photoButton.center = [self.centerHigh[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        
    }];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.textButton.center = [self.centerHigh[0] CGPointValue];
        self.quoteButton.center = [self.centerHigh[2] CGPointValue];
        self.chatButton.center = [self.centerHigh[1] CGPointValue];
        
    } completion:^(BOOL finished) {
        
    }];
    
    self.photoButton.center = [self.centerHigh[1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.linkButton.center = [self.centerHigh[0] CGPointValue];
        self.videoButton.center = [self.centerHigh[2] CGPointValue];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)showMenuView {
    
    self.hidden = NO;
    
    /*   _nevermindButton   */
    _nevermindButton.center = [_centerLow[3] CGPointValue];
    _nevermindButton.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _nevermindButton.center = [_centerMenu [6] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    /*   _photoButton   */
    
    _photoButton.center = [_centerLow[1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _photoButton.center = [_centerMenu[1] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    /*  Text | Chat | Quote Image   */
    _textButton.center = [_centerLow[0] CGPointValue];
    _quoteButton.center = [_centerLow[2] CGPointValue];
    _chatButton.center = [_centerLow [1] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        _textButton.center = [_centerMenu[0] CGPointValue];
        _quoteButton.center = [_centerMenu[2] CGPointValue];
        _chatButton.center = [_centerMenu[4] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
    
    /*   Link | Video Image  */
    
    _linkButton.center = [_centerLow[0] CGPointValue];
    _videoButton.center = [_centerLow [2] CGPointValue];
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _linkButton.center = [_centerMenu[3] CGPointValue];
        _videoButton.center = [_centerMenu[5] CGPointValue];
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
