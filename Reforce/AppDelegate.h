//
//  AppDelegate.h
//  Reforce
//
//  Created by Akhil Stanislavose on 18/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTTPServer;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    HTTPServer *httpServer;
}

@property (strong, nonatomic) UIWindow *window;

-(void) setHttpServerRootTo:(NSString *) path;
-(void) resetHttpServerRoot;
-(void) startHttpServer;
-(void) stopHttpServer;

@end
