//
//  CategoriesTableViewCell.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CategoriesTableViewCell.h"
#import "CategoryServer.h"

@implementation CategoriesTableViewCell

static NSMutableDictionary *allImages;

+(CategoriesTableViewCell*)cellForTableView:(UITableView*)tableView
{
    CategoriesTableViewCell *cell = (CategoriesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CategoryCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CategoriesTableViewCell" owner:self options:nil];
        cell = (CategoriesTableViewCell *)[nib objectAtIndex:0];
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {
    
    CGRect rectInSuperView  = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight((view.frame)) / 2 - CGRectGetMinY(rectInSuperView);
    
    float differance = CGRectGetHeight(self.categoryImageView.frame) - CGRectGetHeight(self.frame);
    
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * differance ;
    
    CGRect imageRect = self.categoryImageView.frame;
    
    imageRect.origin.y = -(differance / 2) + move;
    
    self.categoryImageView.frame = imageRect;
    
}



-(void)setupCell:(CategoryObject*)object withIndex:(NSIndexPath *)indexPath{
    
    [self.indicatorView startAnimating];
    
    [self.categoryNameLabel setText:object.categoryName];
    
    self.index = (int)indexPath.row;
    
    if( allImages[@(self.index)] == nil ) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ // 1
            
            UIImage *cityImage = [CategoryServer getImageFromParseBackend:object.categoryImage.url];
            
            dispatch_async(dispatch_get_main_queue(), ^{ // 2
                
                allImages[@(self.index)] = cityImage;
                
                [self.categoryImageView setImage:cityImage];
                
                [self.indicatorView setHidden:true];
                
                [self.indicatorView stopAnimating];
                
            });
            
        });
        
    } else {
        
        [self.categoryImageView setImage:allImages[@(self.index)]];
        [self.indicatorView setHidden:true];
        [self.indicatorView stopAnimating];
        
    }
    
    
    
}

-(void)firstInitialize:(BOOL)control{
    
    if( control ) {
        
        allImages = [[NSMutableDictionary alloc] init];
        
    }
    
}

@end
