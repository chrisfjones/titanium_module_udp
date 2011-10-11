/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "UDPSocketProxy.h"
#import "TiUtils.h"
#include <sys/socket.h> 
#include <netinet/in.h>

@implementation UDPSocketProxy

- (void) send: (NSArray*) args {
    NSString *msg       = [TiUtils stringValue:[args objectAtIndex: 0]];
    NSString *host      = [TiUtils stringValue:[args objectAtIndex: 1]];
    NSInteger port      = [TiUtils intValue:   [args objectAtIndex: 2]];
	
	NSLog(@"%@ send: %@ to %@:%i", self, msg, host, port);
	
	struct sockaddr_in destinationAddress;
    socklen_t sockaddr_destaddr_len = sizeof(destinationAddress);
    
    memset(&destinationAddress, 0, sockaddr_destaddr_len);
    destinationAddress.sin_len = (__uint8_t) sockaddr_destaddr_len;
    destinationAddress.sin_family = AF_INET;
    destinationAddress.sin_port = htons(port);
    destinationAddress.sin_addr.s_addr = inet_addr([host cStringUsingEncoding: NSUTF8StringEncoding]);
    
    NSData *destinationAddressData = [NSData dataWithBytes:&destinationAddress length:sizeof(destinationAddress)];
    
    NSData *data = [msg dataUsingEncoding: NSUTF8StringEncoding];
    
    CFSocketError socket_error = CFSocketSendData(_socket, (CFDataRef) destinationAddressData, (CFDataRef) data, 10);
    if (socket_error) {
        NSLog(@"socket error: %li", socket_error);
    } else {
        NSLog(@"sent: '%@' to %@:%i", msg, host, port);
    }
}	

- (id)init {
    self = [super init];
    if (self) {
        int sock;
        
        sock = socket(AF_INET, SOCK_DGRAM, 0);
        struct sockaddr_in      addr;
        memset(&addr, 0, sizeof(addr));
        
        _socket = CFSocketCreate(
                                 kCFAllocatorDefault,   // allocator
                                 PF_INET,               // protocolFamily
                                 SOCK_DGRAM,            // socketType 
                                 IPPROTO_UDP,           // protocol
                                 kCFSocketDataCallBack, // callbackTypes
                                 NULL,                  // callout
                                 NULL);                 // context
    }
	NSLog(@"[INFO] new UDPSocketProxy:%@", self);
    return self;
}

@end
