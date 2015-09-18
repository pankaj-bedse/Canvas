//
//  CanvasViewController.m
//  Canvas
//
//  Created by Pankaj Bedse on 9/17/15.
//  Copyright (c) 2015 Pankaj Bedse. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *trayView;
@property (nonatomic, assign) CGPoint trayViewCenter;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *trayGesture;
@property (nonatomic, assign) CGPoint trayOpen;
@property (nonatomic, assign) CGPoint trayClose;
@property (nonatomic, assign) CGFloat minHeight;
@property (nonatomic, strong) UIImageView *newlyCreatedFace;
@property (nonatomic, assign) CGPoint newFraceCenter;
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.trayGesture.delegate = self;
    [self.trayView addGestureRecognizer:self.trayGesture];
    self.trayOpen = self.trayView.center;
    self.trayClose = CGPointMake(self.trayView.center.x, self.trayView.center.y + 180);
    self.minHeight = self.trayView.bounds.size.height - 10;    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTrayPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.trayView];
    
    if (velocity.y > 0) {
                [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:0 animations:^{
                    self.trayView.center = self.trayClose;
                } completion:^(BOOL finished) {
        
                }];
    } else {
        [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:0 animations:^{
            self.trayView.center = self.trayOpen;
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    
//    return true;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)imagePanGesture:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            UIImageView *imageView = (UIImageView *)sender.view;
            self.newlyCreatedFace = [[UIImageView alloc]initWithImage:imageView.image];
            [self.mainView addSubview:self.newlyCreatedFace];
            self.newlyCreatedFace.center = [sender locationInView:self.mainView];        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.newlyCreatedFace.center = [sender locationInView:self.mainView];
        }
        default:
            break;
    }
}

@end
