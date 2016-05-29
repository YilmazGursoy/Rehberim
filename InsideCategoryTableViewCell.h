//
//  InsideCategoryTableViewCell.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsideCategoryObjects.h"

@interface InsideCategoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@property (nonatomic) int index;

+(InsideCategoryTableViewCell*)cellForTableView:(UITableView*)tableView;
-(void)cellOnTableView:(UITableView*)tableView didScrollOnView:(UIView*)view;
-(void)setupCell:(InsideCategoryObjects*)object withIndex:(NSIndexPath *)indexPath;
-(void)firstInitialize:(BOOL)control;
@end
