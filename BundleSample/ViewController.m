//
//  ViewController.m
//  BundleSample
//
//  Created by Tasuku SUENAGA on 2016/04/01.
//  Copyright © 2016年 Tombo, inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSBundle *frameworkBundle = [[NSBundle alloc] initWithPath:@"/frameworks/CoreFoundation.framework/Resources"];
    NSString *path = [frameworkBundle pathForResource:@"CFUniCharPropertyDatabase" ofType:@"data"];

    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *attribute = [fm attributesOfItemAtPath:path error:nil];

    NSNumber *fileSize = [attribute objectForKey:NSFileSize];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:30];

    label.text = [NSString stringWithFormat:@"size: %@", fileSize];
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
