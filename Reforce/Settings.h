//
//  Settings.h
//  Reforce
//
//  Created by Akhil Stanislavose on 21/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "AppSettings.h"

@interface Settings : AppSettings

+ (id)sharedManager;

@property (assign, nonatomic) BOOL isUploadEnabled;

@end
