//
//  Settings.m
//  Reforce
//
//  Created by Akhil Stanislavose on 21/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (id)sharedManager {
    static Settings *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [Settings load];
    });
    return sharedManager;
}

@end
