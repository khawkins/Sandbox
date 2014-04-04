//
//  AuthViewController.h
//  AuthInPopover
//
//  Created by Kevin Hawkins on 4/4/14.
//  Copyright (c) 2014 Sandbox App. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AuthViewController : UIViewController

- (id)initWithRootViewController:(RootViewController *)rootVc authView:(UIWebView *)authView;

@end
