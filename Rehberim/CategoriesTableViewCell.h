//
//  CategoriesTableViewCell.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryObject.h"

@interface CategoriesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (nonatomic) int index;

+(CategoriesTableViewCell*)cellForTableView:(UITableView*)tableView;
-(void)cellOnTableView:(UITableView*)tableView didScrollOnView:(UIView*)view;
-(void)setupCell:(CategoryObject*)object withIndex:(NSIndexPath *)indexPath;
-(void)firstInitialize:(BOOL)control;
@end
