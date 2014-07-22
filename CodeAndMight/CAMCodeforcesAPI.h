//
//  CAMCodeforcesAPI.h
//  CodeAndMight
//
//  Created by Дмитрий on 22.07.14.
//  Copyright (c) 2014 Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAMCodeforcesAPI : NSObject

@property (strong, nonatomic) NSMutableArray *contests;

+ (CAMCodeforcesAPI *)sharedCodeforcesAPI;

- (void)loadContestWithGym:(BOOL)isGym completionBlock:(void(^)(BOOL isSuccess))completionBlock;
- (void)loadContestFromJSONData:(NSData *)jsonData;

@end
