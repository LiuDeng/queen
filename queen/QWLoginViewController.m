//
//  LoginViewController.m
//  JingFM-RoundEffect
//
//  Created by wenlin on 13-7-25.
//  Copyright (c) 2013年 isaced. All rights reserved.
//

#import "QWLoginViewController.h"

@interface QWLoginViewController ()
@property (weak, nonatomic) IBOutlet BZGFormField *emailTextField;
@property (weak, nonatomic) IBOutlet BZGFormField *passwordTextField;

@property (unsafe_unretained,nonatomic) BOOL isEditing;

- (IBAction)validateLoginInfo:(id)sender;
@end

@implementation QWLoginViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self configLoginTextField];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[MobClick beginLogPageView:@"LogIn"];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    //[MobClick endLogPageView:@"LogIn"];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - config textfield
- (void)configLoginTextField{
    
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
	// Do any additional setup after loading the view.
    self.emailTextField.textField.placeholder = @"邮箱账号";
    self.emailTextField.textField.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailTextField.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.emailTextField.textField.returnKeyType = UIReturnKeyNext;
    self.emailTextField.textField.tag = 180;
    __weak QWLoginViewController *weakSelf = self;
    [self.emailTextField setTextValidationBlock:^BOOL(BZGFormField *field,NSString *text) {
        NSString *trimText = [QWHelper trimString:text];
        // from https://github.com/benmcredmond/DHValidation/blob/master/DHValidation.m
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        if (![emailTest evaluateWithObject:trimText]) {
            weakSelf.emailTextField.alertView.title = @"邮箱地址格式不正常";
            return NO;
        } else {
            return YES;
        }
    }];
    
    self.passwordTextField.textField.placeholder = @"密码";
    self.passwordTextField.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.textField.secureTextEntry = YES;
    self.passwordTextField.textField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.textField.tag = 240;
    [self.passwordTextField setTextValidationBlock:^BOOL(BZGFormField *field,NSString *text) {
        NSString *trimText = [QWHelper trimString:text];
        if (trimText.length < 6) {
            weakSelf.passwordTextField.alertView.title = @"密码长度太短";
            return NO;
        } else {
            return YES;
        }
    }];
    
}

#pragma mark - textfield delegate


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@" "]){
    	return NO;
    }
    else {
    	return YES;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    switch (textField.tag) {
        case 180:
            [self.passwordTextField.textField becomeFirstResponder];
            break;
        case 240:
            [self validateLoginInfo:textField];
        default:
            break;
    }
    
    return YES;
}


#pragma mark - validate login info
- (IBAction)validateLoginInfo:(id)sender {
    
    [self.view endEditing:YES];
    NSString *error = @"";
    
    if (self.emailTextField.formFieldState != BZGFormFieldStateValid) {
        error = @"请检查登录邮箱账号";
        [self.emailTextField.textField becomeFirstResponder];
        return [QWHelper showErrorMessage:error];
    }
    if (self.passwordTextField.formFieldState != BZGFormFieldStateValid) {
        error = @"请检查密码";
        [self.passwordTextField.textField becomeFirstResponder];
        return [QWHelper showErrorMessage:error];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    [self performBlock:^{
        if (!hud.hidden) {
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"网络连接出现问题";
            [hud hide:YES afterDelay:2];
        }
    } afterDelay:15];
    
    [PFUser logInWithUsernameInBackground:self.emailTextField.textField.text password:self.passwordTextField.textField.text block:^(PFUser *user, NSError *error) {
        [hud hide:YES];
        if (!error) {
            //Setup the installation.
            PFInstallation *installation = [PFInstallation currentInstallation];
            [installation setObject:user forKey:@"owner"];
            [installation saveInBackground];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorString = @"";
            if ([error code] == kPFErrorObjectNotFound) {
                errorString = @"账号未注册,或输入密码错误";
            } else if ([error code] == kPFErrorConnectionFailed) {
                errorString = @"网络连接不上了";
            } else if (error) {
                NSLog(@"Error: %@", [error userInfo][@"error"]);
            }
            [QWHelper showErrorMessage:errorString];
        }
        
    }];
    
}


@end
