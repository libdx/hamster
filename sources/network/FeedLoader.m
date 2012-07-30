//
//  FeedLoader.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedLoader.h"
#import "FeedLoadOperation.h"

@interface FeedLoader () <FeedLoadOperationDelegate>
@end

@implementation FeedLoader

- (void)load
{
    for (NSString *feed in _feeds)
    {
        FeedLoadOperation *feedLoadOp = [[FeedLoadOperation alloc] initWithFeed:feed];
        feedLoadOp.delegate = self;
        [feedLoadOp start];
    }
}

#pragma mark - Feed Load Operation Delegate

- (void)feedLoadOperation:(FeedLoadOperation *)feedLoadOp didLoadFeedData:(NSData *)feedData
{
    [_delegate feedLoader:self didLoadFeedData:feedData];
}

@end
