//
//  CAMGymTableViewCell.m
//  CodeAndMight
//
//  Created by Дмитрий on 22.07.14.
//  Copyright (c) 2014 Дмитрий. All rights reserved.
//

#import "CAMGymTableViewCell.h"

@implementation CAMGymTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
