//
//  FeedLoader.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedLoadOperation.h"

@interface FeedLoadOperation () <NSURLConnectionDataDelegate>
{
    NSMutableData *_feedData;
    NSURLConnection *_connection;
}

@end

@implementation FeedLoadOperation

@synthesize feed = _feed;
@synthesize delegate = _delegate;

- (id)initWithFeed:(NSString *)feed
{
    self = [super init];
    if (self)
    {
        _feed = feed;
        _feedData = [NSMutableData new];
    }
    return self;
}

- (void)main
{
    @autoreleasepool
    {
        NSURL *url = [NSURL URLWithString:_feed];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (nil == connection)
            NSLog(@"warning: connection is failed");
    }
}

- (NSData *)feedData
{
    return [_feedData copy];
}

#pragma mark - URL Connection Data Delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_feedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [_delegate feedLoadOperation:self didLoadFeedData:_feedData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // trace_error
    NSLog(@"%@", error.localizedDescription);
}

@end
