//
//  FBHandler.m
//  FBHandler
//
//  Created by Scott Lahteine on 12/27/10.
//  Copyright 2010 Thinkyhead Software. All rights reserved.
//

#define DEBUGGING 0

#import "FBHandler.h"
#import "FBAppDel.h"

@implementation FBHandler

- (id)performDefaultImplementation {
#if DEBUGGING
	NSLog(@"performDefaultImplementation");
#endif

	if ([(FBAppDel*)[NSApp delegate] shouldQuitInstead]) exit(EXIT_SUCCESS);

	NSString *url = [self directParameter];
	NSString *fblink = @"http://www.facebook.com/profile.php?id=%@&sk=%@";

	// Handle all URLs that start with "fb://"
	if (NSOrderedSame == [url compare:@"fb://" options:NSCaseInsensitiveSearch range:NSMakeRange(0, 5)]) {

		NSArray *parts = [url componentsSeparatedByString:@"/"];
		NSString *op = (NSString*)[parts objectAtIndex:2];
		NSString *uid = (NSString*)[parts objectAtIndex:3];

		NSMutableString *destURL = [NSMutableString string];

		// PROFILE
		if ([@"profile" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"info"];
			
		// WALL
		} else if ([@"wall" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"wall"];
			
		// MESSAGES
		} else if ([@"messages" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"messages"];

		// PHOTOS
		} else if ([@"photos" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"photos"];

		// FRIENDS
		} else if ([@"friends" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"friends"];

		// NOTES
		} else if ([@"notes" isEqualToString: op]) {
			[destURL appendFormat:fblink, uid, @"notes"];
		}

		[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:destURL]];

#if DEBUGGING
		NSLog(@"Redirected '%@' to '%@'", url, destURL);
#endif

	}

#if DEBUGGING
	exit(EXIT_SUCCESS);
#endif

    return nil;
}

@end
