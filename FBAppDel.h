//
//  FBAppDel.h
//  FBHandler
//
//  Created by Scott Lahteine on 4/24/11.
//  Copyright 2011 Thinkyhead Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBAppDel : NSObject <NSApplicationDelegate> {
@private
	IBOutlet NSMenu *theMenu;
	BOOL didFinishLaunching;
}

- (void)activateStatusMenu;
- (BOOL)shouldQuitInstead;
- (IBAction)toggleAutoLaunch:(id)target;
- (BOOL)getAutoLaunch;
- (void)setAutoLaunch:(BOOL)inFlag;

@end
