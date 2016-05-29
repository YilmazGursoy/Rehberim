//
//  InsideCategoryViewController.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsideCategoryHelper.h"
#import "BaseViewController.h"

@interface InsideCategoryViewController : BaseViewController < UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate ,InsideCategoryHelperDelegate >

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) int controlStarNumber;

@property (strong, nonatomic) InsideCategoryHelper *insideCategoryHelperObject;

@property (strong, nonatomic) NSString *categoryID;



//Methods

-(instancetype)initWithCategoryID:(NSString*)ID;

- (IBAction)starNumberControlButton:(UIButton *)sender;

@end
