//
//  HKTestTableViewCell.m
//  HKDev
//
//  Created by HK on 2019/4/8.
//  Copyright © 2019 HK. All rights reserved.
//

#import "HKTestTableViewCell.h"
#import <Masonry.h>


@interface HKTestTableViewCell ()

@property (strong, nonatomic) UIView *cardView;

@property (strong, nonatomic) UIImageView *flagImageView;
@property (strong, nonatomic) UIImageView *detailArrowImageView;

@end

@implementation HKTestTableViewCell

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

#pragma mark - Private
- (void)setupViews
{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.cardView];
    [self.cardView addSubview:self.flagImageView];
    [self.cardView addSubview:self.titleLabel];
    [self.cardView addSubview:self.descLabel];
    [self.cardView addSubview:self.detailArrowImageView];
    
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 12, 0, 12));
    }];
    
    [self.flagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cardView).with.offset(10.f);
        make.centerY.equalTo(self.cardView);
        make.width.height.equalTo(@30.f);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardView).with.offset(10.f);
        make.left.equalTo(self.flagImageView.mas_right).with.offset(10.f);
        make.right.equalTo(self.detailArrowImageView).with.offset(-10.f);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5.f);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.detailArrowImageView).with.offset(-10.f);
        make.bottom.equalTo(self.cardView).with.offset(-5.f);
    }];
    
    [self.detailArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.cardView);
        make.centerY.equalTo(self.cardView);
        make.width.height.equalTo(@12.f);
    }];
    
}

#pragma mark - Getter

- (UIView *)cardView
{
    if (!_cardView) {
        _cardView = [[UIView alloc] init];
        _cardView.backgroundColor = [UIColor clearColor];
        _cardView.layer.shadowColor = [UIColor blackColor].CGColor;
        _cardView.layer.shadowOffset = CGSizeMake(2, 2);
        _cardView.layer.shadowRadius = 2.f;
        _cardView.layer.shadowOpacity = 0.2;
    }
    return _cardView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"-";
    }
    return _titleLabel;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = [UIFont systemFontOfSize:12.f];
        _descLabel.textColor = [UIColor lightGrayColor];
        _descLabel.text = @"...";
    }
    return _descLabel;
}

- (UIImageView *)flagImageView
{
    if (!_flagImageView) {
        _flagImageView = [[UIImageView alloc] init];
        _flagImageView.image = [UIImage imageNamed:@"TestFlag"];
    }
    
    return _flagImageView;
    
}

- (UIImageView *)detailArrowImageView
{
    if (!_detailArrowImageView) {
        _detailArrowImageView = [[UIImageView alloc] init];
        _detailArrowImageView.image = [UIImage imageNamed:@"Detail12#CDCDCD"];
    }
    return _detailArrowImageView;
}


@end
