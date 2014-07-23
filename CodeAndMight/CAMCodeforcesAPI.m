//
//  CAMCodeforcesAPI.m
//  CodeAndMight
//
//  Created by Дмитрий on 22.07.14.
//  Copyright (c) 2014 Дмитрий. All rights reserved.
//

#import "CAMCodeforcesAPI.h"

#import "CAMContest.h"

@implementation CAMCodeforcesAPI

+ (CAMCodeforcesAPI *)sharedCodeforcesAPI
{
    static CAMCodeforcesAPI *_sharedCodeforcesAPI = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedCodeforcesAPI = [[CAMCodeforcesAPI alloc] init];
    });
    
    return _sharedCodeforcesAPI;
}

- (void)loadContestWithGym:(BOOL)isGym completionBlock:(void (^)(BOOL))completionBlock
{
    NSString *apiMethod = @"http://codeforces.ru/api/contest.list";
    if (isGym) {
        apiMethod = [apiMethod stringByAppendingString:@"?gym=true"];
    }
    
    NSURL *url = [NSURL URLWithString:apiMethod];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        [self loadContestFromJSONData:data];
        
        if (completionBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(error == nil);
            });
        }
    }];
    
    [downloadTask resume];
}

- (void)loadContestFromJSONData:(NSData *)jsonData
{
    NSError *jsonError = nil;
    
    NSMutableDictionary *contestDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&jsonError];
    
    if (jsonError == nil) {
        NSArray *jsonContests = [contestDictionary objectForKey:@"result"];
        
        self.contests = [[NSMutableArray alloc] init];
        
        for (NSDictionary *json in jsonContests) {
            CAMContest *contest = [CAMContest new];
            
            contest.idNumber = [json objectForKey:@"id"];
            contest.name = [json objectForKey:@"name"];
            contest.type = [json objectForKey:@"phase"];
            contest.frozen = ((NSNumber *)[json objectForKey:@"frozen"]).boolValue;
            contest.durationSeconds = [json objectForKey:@"durationSeconds"];
            contest.startTimeSeconds = [NSDate dateWithTimeIntervalSince1970:((NSNumber *)[json objectForKey:@"startTimeSeconds"]).integerValue];
            contest.relativeTimeSeconds = [json objectForKey:@"relativeTimeSeconds"];
            contest.preparedBy = [json objectForKey:@"preparedBy"];
            contest.websiteUrl = [NSURL URLWithString:[json objectForKey:@"websiteUrl"]];
            contest.deScription = [json objectForKey:@"description"];
            contest.difficulty = [json objectForKey:@"difficulty"];
            contest.kind = [json objectForKey:@"kind"];
            contest.icpcRegion = [json objectForKey:@"icpcRegion"];
            contest.country = [json objectForKey:@"country"];
            contest.city = [json objectForKey:@"city"];
            contest.season = [json objectForKey:@"season"];
            
            [self.contests addObject:contest];
        }
    }
}

@end
