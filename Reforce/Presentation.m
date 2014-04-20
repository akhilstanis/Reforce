//
//  Presentation.m
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "Presentation.h"

#import <SSZipArchive.h>

@implementation Presentation

// Class Methods

+(BOOL)uploadZip:(NSString *)path {
    if (![path hasSuffix:@".zip"])
        return NO;

    NSString *presentationName = [[path lastPathComponent] stringByDeletingPathExtension];
    NSString *presentationDir = [NSString stringWithFormat:@"%@/presentations/%@", documentsPath, presentationName];

    BOOL isDir = YES;
    NSError *err;
    if (![[NSFileManager defaultManager]fileExistsAtPath:presentationDir isDirectory:&isDir ]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:presentationDir withIntermediateDirectories:YES attributes:nil error:&err];
    }

    [SSZipArchive unzipFileAtPath:path toDestination:presentationDir];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];

    NSString *indexPath = [presentationDir stringByAppendingPathComponent:@"index.html"];

    if (![[NSFileManager defaultManager] fileExistsAtPath:indexPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:presentationDir error:nil];

        [[NSNotificationCenter defaultCenter] postNotificationName:@"invalidPresentaionUploaded" object:nil];

        return NO;
    }

    NSMutableString *indexContent = [NSMutableString stringWithContentsOfFile: indexPath encoding:NSASCIIStringEncoding error:&err];
    [indexContent replaceOccurrencesOfString:@"</body>"
                                  withString:@"<script src='reforce.js'></script></body>"
                                     options:NSCaseInsensitiveSearch
                                       range:NSMakeRange(0, [indexContent length])];
    [indexContent writeToFile:indexPath atomically:YES encoding:NSASCIIStringEncoding error:&err];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"newPresentaionUploaded"
                                                        object:[[Presentation alloc] initWithPath:presentationDir]];

    return YES;
}

+(NSArray *)all {
    NSURL *presentationsUrl = [[NSURL fileURLWithPath:documentsPath] URLByAppendingPathComponent:@"presentations"
                                                                                               isDirectory:YES];
    NSError *err;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:presentationsUrl
                                   includingPropertiesForKeys:@[]
                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                           error:&err];

    NSMutableArray *presentations = [NSMutableArray array];
    for (NSURL *presentationPath in contents)
        [presentations addObject:[[Presentation alloc] initWithPath:[presentationPath path]]];

    return presentations;
}

// Instance Methods

-(Presentation *)initWithPath:(NSString *)path {
    self = [super init];

    if(self) {
        _path = path;
        _title = [path lastPathComponent];
    }

    return self;
}

-(BOOL)destroy {
    NSError *err;
    [[NSFileManager defaultManager] removeItemAtPath:_path error:&err];

    return !err && YES;
}

@end
