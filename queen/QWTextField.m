//
//  BPTextField.m
//  pirate
//
//  Created by wenlin on 14/11/15.
//  Copyright (c) 2014年 bryq. All rights reserved.
//

#import "QWTextField.h"

@implementation QWTextField

-(id)init{
    self = [super init];
    if (self) {
        self.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return self;
}

-(CGRect)textRectForBounds:(CGRect)bounds {
    
    return CGRectInset(bounds ,10 ,0);
    
}


-(CGRect)editingRectForBounds:(CGRect)bounds {
    
    return CGRectInset(bounds,10,0);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
