//
//  SEApiListingProperty.h
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-17.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEApiBaseObject.h"
#import "SEApiListingAddress.h"
#import "SEApiListingAgent.h"
#import "SEApiListingFeature.h"
#import "SEApiListingProperty.h"
#import "SEApiListingPropertyImage.h"

@interface SEApiListingProperty : SEApiBaseObject

@property (nonatomic, strong) SEApiListingAddress *address;
@property (nonatomic, strong) SEApiListingFeature *feature;
@property (nonatomic, strong) SEApiListingAgent *listingAgent;
@property (nonatomic, strong) NSArray *pictures;

@end
