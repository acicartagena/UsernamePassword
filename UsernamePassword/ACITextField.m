//
//  ACITextField.m
//  UsernamePassword
//
//  Created by Aci Cartagena on 8/21/14.
//  Copyright (c) 2014 Aci Cartagena. All rights reserved.
//

#import "ACITextField.h"

@implementation ACITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) ||  action == @selector(cut:)){
        return NO;
    }
    
    return [super canPerformAction:action withSender:sender];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
