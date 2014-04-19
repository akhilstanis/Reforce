//
//  Presentation.h
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import <Foundation/Foundation.h>

#define documentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


@interface Presentation : NSObject

+(BOOL) uploadZip:(NSString *) path;
+(NSArray *) all;
+(void) setDelegate:(id) delegate;

-(Presentation *) initWithPath:(NSString *) path;
-(BOOL) destroy;

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* path;

@end
