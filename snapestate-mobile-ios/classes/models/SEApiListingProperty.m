//
//  SEApiListingProperty.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-17.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEApiListingProperty.h"

@implementation SEApiListingProperty

-(NSString *)description
{
	return [NSString stringWithFormat:@"<SEApiListingProperty %@, %@>", self.address, self.feature];
}

+(RKObjectMapping *)rkApiMapping
{
    CREATE_THREAD_SAFE_API_MAPPING_SINGLETON(^{
        API_MAPPING_INSTANCE = [RKObjectMapping mappingForClass:[self class]];
		
		[API_MAPPING_INSTANCE setSourceToDestinationKeyTransformationBlock:^NSString *(RKObjectMapping *mapping, NSString *sourceKey) {
            if ([sourceKey isEqualToString:@"address"])			return @"address";
            if ([sourceKey isEqualToString:@"feature"])			return @"feature";
            if ([sourceKey isEqualToString:@"listingAgent"])	return @"listingAgent";
            if ([sourceKey isEqualToString:@"pictures"])		return @"pictures";
            return sourceKey;
        }];
        
        [API_MAPPING_INSTANCE addRelationshipMappingWithSourceKeyPath:@"address" mapping:[SEApiListingAddress rkApiMapping]];
        [API_MAPPING_INSTANCE addRelationshipMappingWithSourceKeyPath:@"feature" mapping:[SEApiListingFeature rkApiMapping]];
		[API_MAPPING_INSTANCE addRelationshipMappingWithSourceKeyPath:@"listingAgent" mapping:[SEApiListingAgent rkApiMapping]];
        [API_MAPPING_INSTANCE addRelationshipMappingWithSourceKeyPath:@"pictures" mapping:[SEApiListingPropertyImage rkApiMapping]];
    });
}

+(NSDictionary *)apiMapping
{
	return @{};
}

@end
