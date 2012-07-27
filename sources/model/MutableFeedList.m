//
//  MutableFeedList.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedList.h"

@implementation MutableFeedList

- (void)addFeed:(FeedEntity *)feed
{
    [_feeds addObject:feed];
}

- (void)removeFeedAtIndex:(NSUInteger)index
{
    [_feeds removeObjectAtIndex:index];
}

- (void)removeFeed:(FeedEntity *)feed
{
    [_feeds removeObject:feed];
}

@end
