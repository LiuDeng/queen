//
//  WelcomeViewController.m
//  RACDemo
//
//  Created by wenlin on 14-1-22.
//  Copyright (c) 2014年 bryq. All rights reserved.
//

#import "QWWelcomeViewController.h"


@interface QWWelcomeViewController ()

- (IBAction)signup:(id)sender;
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIButton *wechatButton;


@end

@implementation QWWelcomeViewController

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
    self.phoneButton.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.phoneButton.layer.borderWidth = 1.0f;
    self.wechatButton.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    self.wechatButton.layer.borderWidth = 1.0f;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //[MobClick beginLogPageView:@"Welcome"];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    //[MobClick endLogPageView:@"Welcome"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signup:(id)sender {
    [self performSegueWithIdentifier:@"SignUpSegue" sender:self];
}

- (IBAction)login:(id)sender {
    [self performSegueWithIdentifier:@"LoginSegue" sender:self];
}

@end
