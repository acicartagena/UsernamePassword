//
//  ACIHelloWorldViewController.m
//  UsernamePassword
//
//  Created by Aci Cartagena on 8/21/14.
//  Copyright (c) 2014 Aci Cartagena. All rights reserved.
//

#import "ACIHelloWorldViewController.h"

@interface ACIHelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *helloWorldImageView;

@property (assign, nonatomic) BOOL toggleImage;

@end

@implementation ACIHelloWorldViewController

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
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)setupUI
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgTap:)];
    [self.imgView addGestureRecognizer:tap];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    self.imgView.userInteractionEnabled = YES;
    
}

#pragma mark - gesture recognizer
- (void)imgTap:(UITapGestureRecognizer *)tap
{
    self.toggleImage = !self.toggleImage;
    self.helloWorldImageView.hidden = !self.toggleImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
