//
//  CategoriesViewController.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CategoriesViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>
- (IBAction)backButtonPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *allCategories;

@end
