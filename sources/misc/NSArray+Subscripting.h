//
//  NSArray+Indexing.h
//  hamster
//
//  Created by Alexander Ignatenko on 7/31/12.
//
//

@interface NSArray (Subscripting)
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
@end

@interface NSMutableArray (Subscripting)
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)idx;
@end
