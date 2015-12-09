//
//  ViewController.m
//  YYKitObjKVODemo
//
//  Created by 吴志和 on 15/12/9.
//  Copyright © 2015年 吴志和. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ZHAddForKVO.h"
#import "Person.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    Dog *dog = [[Dog alloc] init];
    
    [dog addObserver:person  forKeyPath:@"name" usingBlock:^(id oldValue, id newValue) {
        NSLog(@"old name = %@ ,new name = %@", oldValue, newValue);
    } ];
    
    [dog addObserver:person  forKeyPath:@"age" usingBlock:^(id oldValue, id newValue) {
        NSLog(@"old1 name = %@ ,new1 name = %@", oldValue, newValue);
    } ];
    
    dog.name = @"aaa";
    dog.name = @"bbb";
    dog.age = 10;
    
    [dog removeBlockOfObserver:person];
    [dog removeBlockOfObserver:person forKeyPath:@"name"];
    [dog removeBlockOfObserver:person forKeyPath:@"age"];
    dog.age = 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
