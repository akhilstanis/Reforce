//
//  HTTPServer+Reforce.m
//  Reforce
//
//  Created by Akhil Stanislavose on 19/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "HTTPServer+Reforce.h"
#import "RWebSocket.h"

@implementation HTTPServer (Reforce)

-(void)sendMessageToWebsockets:(NSString *)message {
    [webSockets enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [((RWebSocket *) obj) sendMessage:message];
    }];
}

@end
