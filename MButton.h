//
//  MButton.h
//  Animation
//
//  Created by lanouhn on 16/3/29.
//  Copyright © 2016年 Mifiste. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^addTarget)();
@interface MButton : UIButton
@property (nonatomic, copy) addTarget target;
@end
