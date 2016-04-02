//
//  ViewController.m
//  BundleSample
//
//  Created by Tasuku SUENAGA on 2016/04/01.
//  Copyright © 2016年 Tombo, inc. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>
#include <sys/stat.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // generate path with obj-c functions
    NSBundle *frameworkBundle = [[NSBundle alloc] initWithPath:@"/frameworks/CoreFoundation.framework/Resources"];
    NSString *path = [frameworkBundle pathForResource:@"CFUniCharPropertyDatabase" ofType:@"data"];

    // fetch file size with c functions
    int fd = open(path.UTF8String, O_RDONLY);
    struct stat st;
    fstat(fd, &st);
    close(fd);

    // create and show a label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:6];
    label.text = [NSString stringWithFormat:@"size: %u", st.st_size];
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
