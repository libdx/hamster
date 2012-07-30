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
    NSURLConnection *_connection;
    NSMutableData *_feedData;
    BOOL _executing;
    BOOL _finished;
}

@end

@implementation FeedLoadOperation

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

- (void)start
{
    if ([self isCancelled])
        [self setFinished:YES];
    else
    {
        [self willChangeValueForKey:@"isExecuting"];
        [self main];
        _executing = YES;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

- (void)main
{
    @autoreleasepool
    {
        @try
        {
            NSURL *url = [NSURL URLWithString:_feed];
            NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
            _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            if (nil == _connection)
                NSLog(@"warning: connection is failed");
        }
        @catch(NSException *e)
        {
            [self markFinished];
            [e raise];
        }
    }
}

- (void)cancel
{
    [super cancel];
    [_connection cancel];
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}

- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)markFinished
{
    [self setFinished:YES];
    [self setExecuting:NO];
    _connection = nil;
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
    [self markFinished];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error.localizedDescription);
}

@end
