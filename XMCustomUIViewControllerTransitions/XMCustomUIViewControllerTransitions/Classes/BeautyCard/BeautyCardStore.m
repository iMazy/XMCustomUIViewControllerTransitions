//
//  BeautyCardStore.m
//  XMCustomUIViewControllerTransitions
//
//  Created by TwtMac on 17/1/20.
//  Copyright © 2017年 Mazy. All rights reserved.
//

#import "BeautyCardStore.h"
#import "BeautyCard.h"

@implementation BeautyCardStore

+ (NSArray *)defaultBeauties {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Pets" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *petsArray = dict[@"Pets"];
    
    NSMutableArray *source = [NSMutableArray array];
    for (NSDictionary *dict in petsArray) {
        BeautyCard *card = [[BeautyCard alloc] init];
        [card setValuesForKeysWithDictionary:dict];
        [source addObject:card];
    }
    return source;
}

@end
