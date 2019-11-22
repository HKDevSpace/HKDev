//
//  HKConsoleLogTVCell.m
//  HKDev
//
//  Created by HK on 2019/4/17.
//  Copyright © 2019 HK. All rights reserved.
//


#import "HKConsoleLogTVCell.h"
#import <Masonry.h>

@interface HKConsoleLogTVCell()


@end


@implementation HKConsoleLogTVCell
@synthesize logLabel = _logLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupViews
{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.logLabel];
    [self.logLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


- (UILabel *)logLabel
{
    if (!_logLabel) {
        _logLabel = [[UILabel alloc] init];
    }
    return _logLabel;
}

@end
