//
//  BaseViewController.h
//  12Ours
//
//  Created by Bryant on 2017/6/7.
//  Copyright © 2017年 12Ours. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XTBubbleTransition;

@interface BaseViewController : UIViewController
{
    CGPoint transitionPoint;
    
    UIToolbar *inputAccessoryView;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayoutHeight;

@property (strong, nonatomic) XTBubbleTransition *transition;

- (id)addBubbleInfo:(id)sender;

- (void)setupInputAccessoryView:(SEL)action;

@end
