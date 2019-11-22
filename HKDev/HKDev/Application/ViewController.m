//
//  ViewController.m
//  HKDev
//
//  Created by HK on 2019/3/26.
//  Copyright © 2019 HK. All rights reserved.
//

#import "ViewController.h"

#import "HKConsoleView.h"

#import <Masonry.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ViewController

static NSString * const text = @"岁月不断沧桑残酷，破晓分割黑夜白昼，当天边的北斗星再次升起，这个梦将被无尽的延续";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6.f; // 调整行间距
    NSRange range = NSMakeRange(0, [text length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:13.f];
    [attributedString addAttribute:NSFontAttributeName value:font range:range];
    

    self.textLabel.attributedText = attributedString;
    [self.textLabel sizeThatFits:CGSizeMake(147.5, MAXFLOAT)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CGFloat textHeight = [ViewController sizeWithText:text limitWidth:CGRectGetWidth(self.textLabel.frame) font:self.textLabel.font].height;
    CGFloat labelHeight = CGRectGetHeight(self.textLabel.frame);
    
    NSLog(@"%f, %f", textHeight, labelHeight);

}



+ (CGSize)sizeWithText:(NSString *)text limitWidth:(CGFloat)limitWidth font:(UIFont *)font
{
    
    NSMutableDictionary *att = [[NSMutableDictionary alloc] init];
    if (font) {
        [att setObject:font forKey:NSFontAttributeName];
    }
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(limitWidth, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:[att copy]
                                     context:nil];
    return rect.size;
    
}



@end
