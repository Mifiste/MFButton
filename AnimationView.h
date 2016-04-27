//
//  AnimationView.h
//  Animation
//
//  Created by lanouhn on 16/3/26.
//  Copyright © 2016年 Mifiste. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MButton;


typedef NS_ENUM(NSInteger, ButtonType) {
    ButtonTypeText = 101, //按钮的tag值, 通过tag找到按钮设置事件, 执行block
    ButtonTypePhoto,
    ButtonTypeQuote,
    ButtonTypeLink,
    ButtonTypeChat,
    ButtonTypeVideo,
    ButtonTypeNevermindButton
};

typedef void(^addTarget)();
@interface AnimationView : UIView
@property (nonatomic, strong) MButton          *textButton;
@property (nonatomic, strong) MButton          *photoButton;
@property (nonatomic, strong) MButton          *quoteButton;
@property (nonatomic, strong) MButton          *linkButton;
@property (nonatomic, strong) MButton          *chatButton;
@property (nonatomic, strong) MButton          *videoButton;
@property (nonatomic, strong) MButton          *nevermindButton;
@property (nonatomic, strong) UIView            *backgroundView;
@property (nonatomic, strong) NSMutableArray    *centerHigh;
@property (nonatomic, strong) NSMutableArray    *centerLow;
@property (nonatomic, strong) NSMutableArray    *centerMenu;
@property (nonatomic, assign) BOOL              isHidding;
@property (nonatomic, copy) addTarget target;

- (void)addTargetToButtonWthTag:(ButtonType)buttonType complete:(addTarget)target;

- (void)showMenuView;
- (void)hideMenuView;
@end
