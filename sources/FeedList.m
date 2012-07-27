//
//  FeedSet.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedList.h"

@implementation FeedList

@synthesize url = _url;

- (id)init
{
    self = [super init];
    if (self)
        _feeds = [NSMutableArray new];
    return self;
}

- (NSArray *)allFeeds
{
    return [_feeds copy];
}

- (NSUInteger)feedsCount
{
    return [_feeds count];
}

- (id)feedAtIndex:(NSUInteger)index
{
    return [_feeds objectAtIndex:index];
}

@end
