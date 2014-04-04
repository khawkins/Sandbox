//
//  AuthViewController.m
//  AuthInPopover
//
//  Created by Kevin Hawkins on 4/4/14.
//  Copyright (c) 2014 Sandbox App. All rights reserved.
//

#import "AuthViewController.h"

@interface AuthViewController ()

@property (nonatomic, weak) RootViewController *rootVc;
@property (nonatomic, strong) UIWebView *authWebView;

@end

@implementation AuthViewController

@synthesize authWebView = _authWebView;

- (id)initWithRootViewController:(RootViewController *)rootVc authView:(UIWebView *)authView
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.rootVc = rootVc;
        self.authWebView = authView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.authWebView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.authWebView.frame = self.view.bounds;
    [self.view addSubview:self.authWebView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.rootVc cleanupAfterAuth];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
