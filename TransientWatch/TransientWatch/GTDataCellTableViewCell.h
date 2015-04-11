//
//  GTDataCellTableViewCell.h
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTDataCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *typeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *arrowImageView;
@property (nonatomic, weak) IBOutlet UILabel * differenceLabel;
@end
