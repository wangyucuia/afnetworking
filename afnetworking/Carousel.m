
//
//  Carousel.m
//  afnetworking
//
//  Created by 王玉翠 on 16/8/8.
//  Copyright © 2016年 王玉翠. All rights reserved.
//

#import "Carousel.h"

@interface Carousel()<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl *PageControl;

@property (nonatomic,strong) NSArray *images;



@end




@implementation Carousel
- (instancetype)initWithFrame:(CGRect)frame andArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpAndArray:array];
    }
    return self;
}

-(void)setUpAndArray:(NSArray *)array{
    self.images = array;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    CGSize scrollViewSize = scrollView.frame.size;
    for (NSInteger i = 0; i < [self.images count]; i++) {
        CGRect slideRect = CGRectMake(scrollViewSize.width * i, 0, scrollViewSize.width, scrollViewSize.height);
        UIView *slide = [[UIView alloc] initWithFrame:slideRect];
        [slide setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.frame];
        [imageView setImage:[UIImage imageNamed:[self.images objectAtIndex:i]]];
        [slide addSubview:imageView];
        [scrollView addSubview:slide];
        
    }
    UIPageControl *tempPageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, scrollViewSize.height - 20, scrollViewSize.width, 20)];
    
    [self setPageControl:tempPageControll];
    [self.PageControl setNumberOfPages:[self.images count]];
    [scrollView setContentSize:CGSizeMake(scrollViewSize.width * self.images.count, scrollViewSize.height)];
    [self addSubview:scrollView];
    [self addSubview:self.PageControl];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat pagewith = scrollView.frame.size.width;
    int page = floorf((scrollView.contentOffset.x - pagewith/ 2)/pagewith)+1;
    [self.PageControl setCurrentPage:page];
    
    
    
}



@end
