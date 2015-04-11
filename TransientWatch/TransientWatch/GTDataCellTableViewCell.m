//
//  GTDataCellTableViewCell.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTDataCellTableViewCell.h"

@implementation GTDataCellTableViewCell
@synthesize nameLabel = _nameLabel;
@synthesize typeLabel = _typeLabel;
@synthesize differenceLabel = _differenceLabel;
@synthesize arrowImageView = _arrowImageView;



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
