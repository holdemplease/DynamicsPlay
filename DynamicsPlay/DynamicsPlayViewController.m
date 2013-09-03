//
//  DynamicsPlayViewController.m
//  DynamicsPlay
//
//  Created by Jeremiah Anderson on 9/4/13.
//  Copyright (c) 2013 Jeremiah Anderson. All rights reserved.
//

#import "DynamicsPlayViewController.h"

@implementation DynamicsPlayViewController
{
    UIDynamicAnimator* _dynamicAnimator;
    CGPoint _dynamicView_initialCenter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    _dynamicView_initialCenter = self.dynamicView.center;
    
    if(!_dynamicAnimator)
    {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        UIOffset viewOffset = UIOffsetMake(200, 200); // make this random
        UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:self.dynamicView offsetFromCenter:UIOffsetMake(0, 0) attachedToAnchor:self.dynamicView.center];
        
        spring.length = 0;
        spring.damping = 0.3;
        spring.frequency = 1.0;
        
        [_dynamicAnimator addBehavior:spring];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    self.dynamicView.center = CGPointMake(self.dynamicView.center.x + 100, self.dynamicView.center.y + 100);
    [_dynamicAnimator updateItemUsingCurrentState:self.dynamicView];
}

- (IBAction)screenTapped:(id)sender
{
    UISnapBehavior *s = [[UISnapBehavior alloc] initWithItem:self.dynamicView snapToPoint:_dynamicView_initialCenter];
    [_dynamicAnimator addBehavior:s];
    
}
@end
