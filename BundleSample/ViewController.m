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

    // Fetch file (obj-c)
    NSBundle *frameworkBundle = [[NSBundle alloc] initWithPath:@"/frameworks/CoreFoundation.framework/Resources"];
    NSString *path = [frameworkBundle pathForResource:@"CFUniCharPropertyDatabase" ofType:@"data"];
    NSError *error0 = nil;
    NSString *bundleData = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error: &error0];

    // Fetch file (c)
    int fd = open("/frameworks/CoreFoundation.framework/Resources/CFUniCharPropertyDatabase.data", O_RDONLY);
    struct stat st;
    fstat(fd, &st);
    close(fd);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:30];

    label.text = [NSString stringWithFormat:@"size: %lu %u", (unsigned long)[bundleData length], st.st_size];
    [label sizeToFit];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
