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
            //contest.frozen = [json objectForKey:@"frozen"];
            contest.durationSeconds = [json objectForKey:@"durationSeconds"];
            
            [self.contests addObject:contest];
        }
    }
}

@end
