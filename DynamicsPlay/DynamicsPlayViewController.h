//
//  DynamicsPlayViewController.h
//  DynamicsPlay
//
//  Created by Jeremiah Anderson on 9/4/13.
//  Copyright (c) 2013 Jeremiah Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicsPlayViewController : UIViewController
- (IBAction)screenTapped:(id)sender;

- (IBAction)dynamicViewTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *dynamicView;
@end
