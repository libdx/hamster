//
//  NSDictionary+Subscripting.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/31/12.
//
//

#import "NSDictionary+Subscripting.h"

@implementation NSDictionary (Subscripting)

- (id)objectForKeyedSubscript:(NSString *)key
{
    return [self objectForKey:key];
}

@end

@implementation NSMutableDictionary (Subscripting)

- (void)setObject:(id)object forKeyedSubscript:(NSString *)key
{
    [self setObject:object forKey:key];
}

@end

