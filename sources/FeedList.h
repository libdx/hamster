//
//  FeedSet.h
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface FeedList : NSObject
{
@protected
    NSMutableArray *_feeds;
}

@property (copy) NSURL *url;
@property (copy, readonly) NSArray *allFeeds;

- (NSUInteger)feedsCount;
- (id)feedAtIndex:(NSUInteger)index;

@end

@class FeedEntity;

@interface MutableFeedList : FeedList

- (void)addFeed:(FeedEntity *)feed;
- (void)removeFeedAtIndex:(NSUInteger)index;
- (void)removeFeed:(FeedEntity *)feed;

@end
