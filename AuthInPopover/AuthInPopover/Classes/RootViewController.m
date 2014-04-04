//
//  RootViewController.m
//  AuthInPopover
//
//  Created by Kevin Hawkins on 4/4/14.
//  Copyright (c) 2014 Sandbox App. All rights reserved.
//

#import "RootViewController.h"
#import "AuthViewController.h"
#import <SalesforceSDKCore/SFAuthenticationManager.h>
#import <SalesforceSDKCore/SFAuthenticationViewHandler.h>

@interface RootViewController ()
{
    BOOL _authViewCompleted;
}

@property (nonatomic, strong) UIPopoverController *popoverController;

@end

@implementation RootViewController

@synthesize popoverController = __popoverController;
@synthesize launchAuthButton = _launchAuthButton;

- (void)cleanupAfterAuth
{
    // Cancel any auth that started, if it didn't finish (e.g. clicked out of the popover view).
    if (!_authViewCompleted) {
        NSLog(@"Canceling any auth still in progress.");
        [[SFAuthenticationManager sharedManager] cancelAuthentication];
    }
}

#pragma mark - Actions

- (IBAction)launchAuth:(id)sender
{
    SFAuthenticationViewHandler *authHandler = [[SFAuthenticationViewHandler alloc]
                                                initWithDisplayBlock:^(SFAuthenticationManager *authManager, UIWebView *authWebView) {
                                                    _authViewCompleted = NO;
                                                    AuthViewController *authController = [[AuthViewController alloc] initWithRootViewController:self
                                                                                                                                       authView:authWebView];
                                                    authController.contentSizeForViewInPopover = CGSizeMake(500, 600);
                                                    UIPopoverController *authPopoverController = [[UIPopoverController alloc] initWithContentViewController:authController];;
                                                    self.popoverController = authPopoverController;
                                                    [self.popoverController presentPopoverFromRect:self.launchAuthButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                                                } dismissBlock:^(SFAuthenticationManager *authViewManager) {
                                                    _authViewCompleted = YES;
                                                    [self.popoverController dismissPopoverAnimated:YES];
                                                }];
    [SFAuthenticationManager sharedManager].authViewHandler = authHandler;
    [[SFAuthenticationManager sharedManager] loginWithCompletion:^(SFOAuthInfo *authInfo) {
        NSLog(@"Auth finished!");
    } failure:^(SFOAuthInfo *authInfo, NSError *error) {
        NSLog(@"Auth failed: %@", error);
    }];
}

@end
