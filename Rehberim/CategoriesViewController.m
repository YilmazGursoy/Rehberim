//
//  CategoriesViewController.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoriesTableViewCell.h"
#import "InsideCategoryViewController.h"
#import "CategoryObject.h"
#import "CategoryHelper.h"


@interface CategoriesViewController () < UIScrollViewDelegate, CategoryHelperDelegate >

@property (strong, nonatomic) CategoryHelper *categoryHelper;

/**
 *  Control for save all Images in dictionary and never call its again
 */
@property (nonatomic) BOOL control;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.control = true;
    
    self.categoryHelper = [[CategoryHelper alloc]initWithDelegate:self];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.allCategories.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CategoriesTableViewCell *cell = [CategoriesTableViewCell cellForTableView:tableView];
    
    CategoryObject *object = self.allCategories[indexPath.row];
    
    [cell setupCell:object withIndex:indexPath];
    
    [cell firstInitialize:self.control];
    
    self.control = false;

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    CategoryObject *object = self.allCategories[indexPath.row];
    
    if( [object.categoryName isEqualToString:@"Otel"]) {
        
        InsideCategoryViewController *VC = [[InsideCategoryViewController alloc] initWithCategoryID:object.categoryName];
        
        [self.navigationController pushViewController:VC animated:true];
        
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (CategoriesTableViewCell *cell in visibleCells) {
        
        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
        
    }
    
    
}

-(void)getAllCategoriesObject:(NSArray *)insideCategories{
    
    self.allCategories = insideCategories;
   
    [self.tableView reloadData];
    
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:true];

}



@end
