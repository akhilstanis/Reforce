//
//  HTTPServer+Reforce.m
//  Reforce
//
//  Created by Akhil Stanislavose on 19/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "HTTPServer+Reforce.h"

@implementation HTTPServer (Reforce)

-(NSArray *)webSocketConnections {
    return webSockets;
}

@end
