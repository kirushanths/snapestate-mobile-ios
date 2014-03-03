//
//  THMApiBaseObject.m
//  thm-ios-iphone
//
//  Created by Kirushanth on 2013-05-08.
//  Copyright (c) 2013 THM. All rights reserved.
//

#import "SEApiBaseObject.h"
#import <objc/runtime.h>

@implementation SEApiBaseObject

@synthesize apiMappingDictionary = _apiMappingDictionary;

-(id)initWithJSONString:(NSString *)jsonString
{
	NSError* error;
	NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
	if (parsedData == nil && error) {
		DLog(@"Tree Data parsing error");
		return nil;
	}
	
	return [self initWithDictionary:parsedData];
}

-(id)initWithDictionary:(NSDictionary *)data
{
	NSDictionary *mapping = [NSDictionary dictionaryWithObject:[[self class] rkApiMapping] forKey:@""];
	RKMapperOperation *mapper = [[RKMapperOperation alloc] initWithRepresentation:data mappingsDictionary:mapping];
	NSError *mappingError = nil;
	BOOL isMapped = [mapper execute:&mappingError];
	if (isMapped && !mappingError) {
		return [mapper.mappingResult firstObject];
	} else {
		DLog(@"Failed to map data");
		return nil;
	}
}

- (NSDictionary *)jsonRepresentation
{
	RKObjectMapping *objectMapping = [[self class] rkApiMapping];
	objectMapping.setNilForMissingRelationships = NO;
	
	RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[objectMapping inverseMapping] objectClass:[NSMutableDictionary class] rootKeyPath:nil method:RKRequestMethodAny];
	NSError* error;
	NSDictionary *parameters = [RKObjectParameterization parametersWithObject:self requestDescriptor:requestDescriptor error:&error];
	
	return parameters;
}

-(NSDictionary *)apiMappingDictionary
{
	return [[self class] apiMapping];
}

-(id)mutableCopy
{
	id obj = [[[self class] alloc] init];
	if (obj) {
		unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
			
			const char *name = property_getName(property);
			const char *type = property_getAttributes(property);
			
			NSString *nameString = [NSString stringWithUTF8String:name];
			NSString *typeString = [NSString stringWithUTF8String:type];
			NSString *propertyType = [typeString substringWithRange:NSMakeRange(1, 1)];
			const char *rawPropertyType = [propertyType UTF8String];
			
			/* only accept objective-c objects - skip primitives */
			if (strcmp(rawPropertyType, @encode(id)) == 0) {
				[obj setValue:[[self valueForKey:nameString] copy] forKey:nameString];
			}
        }
		
        free(properties);
	}
	return obj;
}

#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
			
			const char *name = property_getName(property);
			const char *type = property_getAttributes(property);
			
			NSString *nameString = [NSString stringWithUTF8String:name];
			NSString *typeString = [NSString stringWithUTF8String:type];
			NSString *propertyType = [typeString substringWithRange:NSMakeRange(1, 1)];
			const char *rawPropertyType = [propertyType UTF8String];

			/* only accept objective-c objects - skip primitives */
			if (strcmp(rawPropertyType, @encode(id)) == 0) {
				[self setValue:[aDecoder decodeObjectForKey:nameString] forKey:nameString];
			}
        }
		
        free(properties);
    }
	
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *p = [NSString stringWithFormat:@"%s", property_getName(property)];
        [aCoder encodeObject:[self valueForKey:p] forKey:p];
    }
	
    free(properties);
}

#pragma mark Static

+ (NSString *)objectForKey:(NSString *)key
{
	NSDictionary *apiMapping = [self apiMapping];
	NSArray *keys = [apiMapping allKeysForObject:key];
	
	if (keys.count > 0) {
		id obj = [keys lastObject];
		if ([obj isKindOfClass:[NSString class]])
			return (NSString *) obj;
	}
	
	return nil;
}

+ (NSString *)apiKeyForProperty:(NSString *)prop
{
	RKObjectMapping *mapping = [self rkApiMapping];
	NSDictionary *propertyMappings = [mapping propertyMappingsBySourceKeyPath];
	
	for (id key in propertyMappings) {
		RKPropertyMapping *propMapping = [propertyMappings objectForKey:key];
		if ([propMapping.destinationKeyPath isEqualToString:prop]) {
			return propMapping.sourceKeyPath;
			break;
		}
	}
	
	return nil;
}

+ (NSString *)apiEndpointWithQueryIDs:(NSArray *)ids    { AbstractClassRequiresOverride; return nil; }
+ (NSString *)apiEndpointWithQuery:(NSString *)query	{ AbstractClassRequiresOverride; return nil; }
+ (NSString *)apiEndpoint								{ AbstractClassRequiresOverride; return nil; }
+ (NSDictionary *)apiMapping							{ AbstractClassRequiresOverride; return nil; }
+ (RKObjectMapping *)rkApiMapping						{ AbstractClassRequiresOverride; return nil; }

@end
