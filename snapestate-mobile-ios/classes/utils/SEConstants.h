//
//  THMConstants.h
//  thm-ios-iphone
//
//  Created by Kirushanth on 2013-05-23.
//  Copyright (c) 2013 THM. All rights reserved.
//

#include "TargetConditionals.h"
#include "THMMacros.h"
#include "THMUIConstants.h"
#import "THMServer.h"

#ifndef thm_ios_iphone_THMConstants_h
#define thm_ios_iphone_THMConstants_h

//#define THM_DEBUG TRUE

#ifdef THM_DEBUG
	//#define THM_LOG_NETWORK_VERBOSE TRUE
	//#define THM_LOG_OFFLINE_SUBMISSION_VERBOSE TRUE
	//#define THM_LOG_SESSION_VERBOSE TRUE
	#define MIXPANEL_DEBUG
	#define MIXPANEL_LOG
#endif

//User to force-entry as a specific user
//#define THM_FORCE_USER_SESSION TRUE
#define THM_FORCE_USERNAME @"Beedeedubaliu"
#define THM_FORCE_APIKEY @"4b05fae813e83cc6788478db1748221a685e756d"
#define THM_FORCE_BASE_URL THM_API_PROD_URL

#define THM_API_BASEURL THM_API_PROD_URL
#define THM_WEBVIEW_USER_AGENT @"thm_ios"

#ifndef THM_DEBUG
	#define THM_MIXPANEL_TOKEN @"daa5dfe0b86c45b21073718c29115406" //production
#else
	#define THM_MIXPANEL_TOKEN @"49f07105241d8b20d4b9a65ede1ab168" //test server
#endif

#ifndef THM_DEBUG
    #define THM_SENTRY_DSN @"https://ca139f5334ab44b0aad42aeff1dfc843:652f5df0e5344c819cc836d4dfc4ce88@sentry.tophat.com/19" //production
#else
    #define THM_SENTRY_DSN @"https://75fcccea949d4c06812282fda1c59295:d3bece25bfd54f729f5c5713c49620d8@sentry.tophat.com/21" //ios test
#endif

#define THM_TESTFLIGHT_TOKEN @"5aa9e965-ceaf-4e46-9578-1c92bc295045"

// Settings Bundle

#define THM_PREF_BASEURL @"thmPrefBaseUrl"
#define THM_PREF_BASEURL_SELECT @"thmPrefBaseUrlSelect"

#endif

// Define this constant for AFNetworking to allow invalid ssl certificate for debugging

#define AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES 1

// Logging

#ifdef THM_DEBUG
    //	#define DLog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
    #define DLog(...) NSLog(@"%@ %@", @"", [NSString stringWithFormat:__VA_ARGS__])
    #define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
    #define DLog(...) do { } while (0)
    #ifndef NS_BLOCK_ASSERTIONS
        #define NS_BLOCK_ASSERTIONS
    #endif
    #define ALog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif


