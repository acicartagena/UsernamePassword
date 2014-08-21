//
//  ACIViewController.m
//  UsernamePassword
//
//  Created by Aci Cartagena on 8/21/14.
//  Copyright (c) 2014 Aci Cartagena. All rights reserved.
//

#import "ACIViewController.h"

static NSString *const viewToHelloWorldSegueId = @"vcToHelloWorld";

@interface ACIViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (strong, nonatomic) NSCharacterSet *alphaSet;

@end

@implementation ACIViewController

#pragma mark - vc lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupUI];
    self.alphaSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)setupUI
{
    //transparent navigation controller
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    self.passwordTextField.text = @"";
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.delegate = self;
    
    self.usernameTextField.text = @"";
    self.usernameTextField.delegate = self;
}


#pragma mark - ibaction
- (IBAction)submitButtonPressed:(id)sender
{
    //check if password and username to be 8 characters in length
    if (self.passwordTextField.text.length < 8 || self.usernameTextField.text.length < 8 ){
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Username and Password must be atleast 8 characters" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        return;
    }
    
    [self.view endEditing:YES];
    [self performSegueWithIdentifier:viewToHelloWorldSegueId sender:self];
}


#pragma mark - keyboard delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //only allow for alphabet characters, spaces and backspace for username
    if (textField == self.usernameTextField){
        BOOL alphabetAndSpace = (([string rangeOfCharacterFromSet:self.alphaSet]).location == NSNotFound || [string isEqualToString:@" "] || [string isEqualToString:@""]);
        return alphabetAndSpace;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


@end
