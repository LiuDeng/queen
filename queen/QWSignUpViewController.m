//
//  SignUpViewController.m
//  MagicOpener
//
//  Created by wenlin on 13-7-28.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import "QWSignUpViewController.h"


@interface QWSignUpViewController ()




@end

@implementation QWSignUpViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self configSignUpTextField];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    //[MobClick endLogPageView:@"SignUp"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - config textfield
- (void)configSignUpTextField{
    

}


#pragma mark - textfield delegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 180 && textField.text.length>0) {
       
    }else if(textField.tag == 240 && textField.text.length>0){
        NSString *trimText = [QWHelper trimString:textField.text];
        if (trimText.length < 6) {
            [QWHelper showErrorMessage:@"密码不能少于6位"];
        }
    }
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@" "]){
    	return NO;
    }
    else {
    	return YES;
    }
}



#pragma mark - validate signup info
- (IBAction)validateSignUpInfo:(id)sender {
    
    
}



@end

