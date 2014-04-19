
#import "HTTPConnection.h"

@class MultipartFormDataParser;

@interface RHTTPConnection : HTTPConnection  {
    MultipartFormDataParser*        parser;
    NSFileHandle*					storeFile;
	NSMutableArray*					uploadedFiles;
}

@end
