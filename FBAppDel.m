//
//  FBAppDel.m
//  FBHandler
//
//  Created by Scott Lahteine on 4/24/11.
//  Copyright 2011 Thinkyhead Software. All rights reserved.
//

#import "FBAppDel.h"

#define kPrefAutoLaunchMe @"autoLaunchMe"

@implementation FBAppDel

/*
 * This will be called only after performDefaultImplementation if a
 * link is clicked when the app isn't running. To meet app store
 * requirements the app is supposed to quit in such cases.
 */
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
//	NSLog(@"applicationDidFinishLaunching");
	[self activateStatusMenu];
	[[theMenu itemWithTag:2] setState:[self getAutoLaunch] ? NSOnState : NSOffState ]; 
	didFinishLaunching = YES;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
//	NSLog(@"applicationWillFinishLaunching");
	didFinishLaunching = YES;
}

- (void)activateStatusMenu {
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	
    NSStatusItem *theItem = [bar statusItemWithLength:NSSquareStatusItemLength];
    [theItem retain];

	[theItem setImage:[NSImage imageNamed:@"StatusItem1.png"]];
	[theItem setAlternateImage:[NSImage imageNamed:@"StatusItem2.png"]];
    [theItem setHighlightMode:YES];
    [theItem setMenu:theMenu];
}

- (BOOL)shouldQuitInstead {
	return !(didFinishLaunching || [self getAutoLaunch]);
}

- (IBAction)toggleAutoLaunch:(id)sender {
	BOOL newauto = ![self getAutoLaunch];
	[ self setAutoLaunch:newauto ];
	[ sender setState: newauto ? NSOnState : NSOffState ];
}

- (BOOL)getAutoLaunch {
	return [ [NSUserDefaults standardUserDefaults] boolForKey:kPrefAutoLaunchMe ];
}

- (void)setAutoLaunch:(BOOL)inFlag {
	[ [NSUserDefaults standardUserDefaults] setBool:inFlag forKey:kPrefAutoLaunchMe ];
}

@end
