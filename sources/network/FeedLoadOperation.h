//
//  FeedLoader.h
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@protocol FeedLoadOperationDelegate;

// FeedLoadOperation class designed to be launched on Main Thread (it's concurrent)
@interface FeedLoadOperation : NSOperation

@property (strong, nonatomic) NSString *feed;
@property (strong, nonatomic, readonly) NSData *feedData;
@property (weak, nonatomic) id<FeedLoadOperationDelegate> delegate;

- (id)initWithFeed:(NSString *)feed;

@end

@protocol FeedLoadOperationDelegate <NSObject>
@required
- (void)feedLoadOperation:(FeedLoadOperation *)feedLoadOp didLoadFeedData:(NSData *)feedData;
@end
