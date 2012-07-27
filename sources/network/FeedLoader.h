//
//  FeedLoader.h
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@protocol FeedLoaderDelegate;

// Downloads feeds asynchronously

@interface FeedLoader : NSObject

// Pass url strings (i.e. http://feed.example.com )
@property (strong, nonatomic) NSArray *feeds; // array of NSString's
@property (weak, nonatomic) id<FeedLoaderDelegate> delegate;

- (void)load;

@end

@protocol FeedLoaderDelegate <NSObject>
@required
- (void)feedLoader:(FeedLoader *)feedLoader didLoadFeedData:(NSData *)feedData;
@end
