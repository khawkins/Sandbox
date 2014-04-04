//
//  RootViewController.h
//  AuthInPopover
//
//  Created by Kevin Hawkins on 4/4/14.
//  Copyright (c) 2014 Sandbox App. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *launchAuthButton;

- (IBAction)launchAuth:(id)sender;
- (void)cleanupAfterAuth;

@end
