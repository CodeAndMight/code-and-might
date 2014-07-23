//
//  CAMContest.h
//  CodeAndMight
//
//  Created by Дмитрий on 21.07.14.
//  Copyright (c) 2014 Дмитрий. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 * @discussion Представление соревнований на Codeforces 
 * @see codeforces.ru/api/help
 */
@interface CAMContest : NSObject

@property (strong, nonatomic) NSNumber *idNumber;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *phase;
@property (nonatomic) BOOL frozen;
@property (strong, nonatomic) NSNumber *durationSeconds;
@property (strong, nonatomic) NSDate *startTimeSeconds;
@property (strong, nonatomic) NSNumber *relativeTimeSeconds;
@property (strong, nonatomic) NSString *preparedBy;
@property (strong, nonatomic) NSURL *websiteUrl;
@property (strong, nonatomic) NSString *deScription;
@property (strong, nonatomic) NSNumber *difficulty;
@property (strong, nonatomic) NSString *kind;
@property (strong, nonatomic) NSString *icpcRegion;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *season;

@end
