//
//  ListViewController.m
//  hamster
//
//  Created by Alexander Ignatenko on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListViewController.h"
#import "FeedList.h"
#import "FeedLoader.h"

#import "FeedEntity.h"

@interface ListViewController () <FeedLoaderDelegate>
{
    NSArray *_feedLists;
    FeedLoader *_feedLoader;
}

@end

@implementation ListViewController

- (void)dummySetup
{
    NSMutableArray *feedsLists = [NSMutableArray new];
    for (int i = 0; i < 10; ++i)
    {
        MutableFeedList *list = [MutableFeedList new];
        for (int j = 0; j < 5; ++j)
        {
            FeedEntity *feed = [FeedEntity new];
            feed.title = [NSString stringWithFormat:@"title #%d.%d", i, j];
            feed.urlString = [NSString stringWithFormat:@"http://example.com/news/%d.%d/", i, j];
            [list addFeed:feed];
            list.url = [NSURL URLWithString:@"http://feeds.example.com"];
        }
        [feedsLists addObject:list];
    }
    _feedLists = [feedsLists copy];
    
    NSArray *feedUrlStrings = [NSArray arrayWithObjects:
//                               @"http://feeds.feedburner.com/RayWenderlich",
                               @"http://feeds.feedburner.com/vmwstudios", 
                               nil];
    _feedLoader = [FeedLoader new];
    _feedLoader.delegate = self;
    _feedLoader.feeds = feedUrlStrings;
    [_feedLoader load];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        [self dummySetup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_feedLists count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FeedList *feedList = [_feedLists objectAtIndex:section];
    return feedList.url.absoluteString;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    FeedList *feedList = [_feedLists objectAtIndex:section];
    NSUInteger count = [feedList feedsCount];
    return [NSString stringWithFormat:@"[%d]", count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_feedLists objectAtIndex:section] feedsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    FeedEntity *feed = [[_feedLists objectAtIndex:indexPath.section] feedAtIndex:indexPath.row];
    cell.textLabel.text = feed.title;
    cell.detailTextLabel.text = feed.urlString;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Feed Loader Delegate

- (void)feedLoader:(FeedLoader *)feedLoader didLoadFeedData:(NSData *)feedData
{
    [feedData writeToFile:@"/tmp/feed.xml" atomically:YES];
}

@end
