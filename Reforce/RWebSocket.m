//
//  RWebSocket.m
//  Reforce
//
//  Created by Akhil Stanislavose on 19/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "RWebSocket.h"
#import <HTTPLogging.h>

// Log levels: off, error, warn, info, verbose
// Other flags : trace
static const int httpLogLevel = HTTP_LOG_LEVEL_WARN | HTTP_LOG_FLAG_TRACE;

@implementation RWebSocket

// Override methods for advanced duplex websocket communication
// For our case, we just need to push messages, so we dont need any customization.

@end
