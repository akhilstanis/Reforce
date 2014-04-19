//
//  HTTPServer+Reforce.h
//  Reforce
//
//  Created by Akhil Stanislavose on 19/04/14.
//  Copyright (c) 2014 Akhil Stanislavose. All rights reserved.
//

#import "HTTPServer.h"

@interface HTTPServer (Reforce)

-(void) sendMessageToWebsockets:(NSString *) message;

@end
