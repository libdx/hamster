//
//  NSArray+Indexing.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/31/12.
//
//

#import "NSArray+Subscripting.h"

@implementation NSArray (Subscripting)

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
    return [self objectAtIndex:idx];
}

@end

@implementation NSMutableArray (Subscripting)

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)idx
{
    [self replaceObjectAtIndex:idx withObject:object];
}

@end
