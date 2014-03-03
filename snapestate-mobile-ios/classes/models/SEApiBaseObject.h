
//
//  Created by Kirushanth on 2013-05-08.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "SEConstants.h"

#define API_MAPPING_INSTANCE _rkApiMapping
#define DEFINE_API_MAPPING_INSTANCE static RKObjectMapping *API_MAPPING_INSTANCE = nil;

#define CREATE_THREAD_SAFE_API_MAPPING_SINGLETON(block) \
    DEFINE_API_MAPPING_INSTANCE \
    CREATE_THREAD_SAFE_SINGLETON(API_MAPPING_INSTANCE, block) \

@interface SEApiBaseObject : NSObject <NSCoding>

@property (nonatomic, strong) NSDictionary *apiMappingDictionary;

- (id)initWithJSONString:(NSString *)jsonString;
- (id)initWithDictionary:(NSDictionary *)data;

- (NSDictionary *)jsonRepresentation;

+ (NSString *)apiEndpoint;
+ (NSString *)apiEndpointWithQuery:(NSString *)query;
+ (NSString *)apiEndpointWithQueryIDs:(NSArray *)ids;

+ (NSDictionary *)apiMapping;
+ (RKObjectMapping *)rkApiMapping;

+ (NSString *)objectForKey:(NSString *)key;
+ (NSString *)apiKeyForProperty:(NSString *)prop;

@end
