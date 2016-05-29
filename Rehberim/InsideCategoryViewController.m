//
//  InsideCategoryViewController.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideCategoryViewController.h"
#import "InsideCategoryTableViewCell.h"
#import "InsideCategoryObjects.h"
#import "HotelProfileViewController.h"

@interface InsideCategoryViewController ()

@property (strong, nonatomic) NSMutableArray *allInsideCategory;
@property (nonatomic) BOOL control;

@end

@implementation InsideCategoryViewController


-(instancetype)initWithCategoryID:(NSString *)ID{

    if( self ) {
        
        self.categoryID = ID;
    
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.controlStarNumber = 6;
    
    self.control = true;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.insideCategoryHelperObject = [[InsideCategoryHelper alloc] initWithDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UITableViewDelegate- DataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InsideCategoryObjects *object = self.allInsideCategory[indexPath.row];
    
    HotelProfileViewController *VC = [[HotelProfileViewController alloc] initWithInsideCategoryObject:object];
    
    [self.navigationController pushViewController:VC animated:true];
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    InsideCategoryTableViewCell *cell = [InsideCategoryTableViewCell cellForTableView:tableView];
    
    InsideCategoryObjects *object = self.allInsideCategory[indexPath.row];
    
    if( self.controlStarNumber != 6 ) {
    
        if( self.controlStarNumber != object.categoryInsideStarNumber ) {
            
            [self.allInsideCategory removeObjectAtIndex:indexPath.row];
            
            [self.tableView reloadData];
            
        }
        
    }
    
    [cell setupCell:object withIndex:indexPath];
    
    [cell firstInitialize:self.control];
    
    self.control = false;
    
    return cell;
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.allInsideCategory.count;
}

#pragma mark - ScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (InsideCategoryTableViewCell *cell in visibleCells) {
        
        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
        
    }
    
    
}


- (IBAction)backButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}


#pragma mark - InsideCategoryHelperDelegate


-(void)getAllInsideCategoriesObject:(NSArray *)insideCategories{

    self.allInsideCategory = [insideCategories mutableCopy];
    
    [self.tableView reloadData];

}

- (IBAction)starNumberControlButton:(UIButton *)sender {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Kalite" message:@"Lütfen Kaç yıldızlı oteller ile ilgilendiğinizi seçiniz" preferredStyle:UIAlertControllerStyleAlert];
    
    for( int  i = 1 ; i <= 6 ; i ++ ) {
    
        if( i != 6 ) {
            [alertController addAction:[self createAlertActionWithTitle:[NSString stringWithFormat:@"%d Yıldız",i] andNumberOfStar:i]];
        } else {
            [alertController addAction:[self createAlertActionWithTitle:@"Tümü" andNumberOfStar:i]];
        }
    }
    
    [self presentViewController:alertController animated:true completion:nil];
    
}

-(UIAlertAction*)createAlertActionWithTitle:(NSString*)title andNumberOfStar:(int)numberOfStar{

    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.controlStarNumber = numberOfStar;
        self.insideCategoryHelperObject = [[InsideCategoryHelper alloc] initWithDelegate:self];
    }];
    
    return action;
}

@end
