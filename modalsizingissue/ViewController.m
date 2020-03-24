//
//  ViewController.m
//  modalsizingissue
//
//  Created by hovhannes safaryan on 3/23/20.
//  Copyright © 2020 hovhannes safaryan. All rights reserved.
//

#import "ViewController.h"

@interface TestVC : UIViewController
@property (nonatomic) NSString *name;
@end
@implementation TestVC

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"aaaaa %@", self.name);
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        TestVC * vc1 = [[TestVC alloc] init];
        vc1.name = @"level1";
        vc1.modalPresentationStyle = UIModalPresentationFullScreen;
        vc1.view.backgroundColor = [UIColor redColor];
        [self presentViewController:vc1 animated:YES completion:nil];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            TestVC * vc2 = [[TestVC alloc] init];
            vc2.modalPresentationStyle = UIModalPresentationFullScreen;
            vc2.name = @"level2";
            vc2.view.backgroundColor = [UIColor blueColor];
            [vc1 presentViewController:vc2 animated:YES completion:nil];
        });
    });

}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"aaaaa main");
}


@end
