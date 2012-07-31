//
//  NSDictionary+Subscripting.h
//  hamster
//
//  Created by Alexander Ignatenko on 7/31/12.
//
//

@interface NSDictionary (Subscripting)
- (id)objectForKeyedSubscript:(NSString *)key;
@end

@interface NSMutableDictionary (Subscripting)
- (void)setObject:(id)object forKeyedSubscript:(NSString *)key;
@end
