//
//  SEConstants.h
//
//  Created by Kirushanth on 2013-05-23.
//  Copyright (c) 2013 THM. All rights reserved.
//

#include "TargetConditionals.h"
#include "SEMacros.h"
#include "SEUIConstants.h"
#import "UILabel+FlexibleHeight.h"
#import "UILabel+LatoFont.h"

#ifndef snapestate_mobile_ios_SEConstants_h
#define snapestate_mobile_ios_SEConstants_h

//#define SE_DEBUG TRUE

#define TESTFLIGHT_TOKEN	@"5aa9e965-ceaf-4e46-9578-1c92bc295045"
#define FLURRY_TOKEN		@"97NDPCXJP4DJ4M54PJR7"

// Define this constant for AFNetworking to allow invalid ssl certificate for debugging
#define AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES 1

/* LOGGING */

#ifdef THM_DEBUG
    #define DLog(...) NSLog(@"%@ %@", @"", [NSString stringWithFormat:__VA_ARGS__])
    #define ALog(...) [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
    #define DLog(...) do { } while (0)
    #ifndef NS_BLOCK_ASSERTIONS
        #define NS_BLOCK_ASSERTIONS
    #endif
    #define ALog(...) NSLog(@"%s %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:__VA_ARGS__])
#endif

#endif