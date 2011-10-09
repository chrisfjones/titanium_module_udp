/**
 *
 *  UDPSocketProxy.h
 *  titanium-module-udp
 *
 *  Created by Chris Jones on 10/8/11.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */

#import "TiProxy.h"

@interface UDPSocketProxy : TiProxy {
@private
    CFSocketRef _socket;
}
- (void) send: (id) args;
@end
