//
//  InsideCategoryTableViewCell.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideCategoryTableViewCell.h"
#import "InsideCategoryServer.h"


@implementation InsideCategoryTableViewCell

static NSMutableDictionary *allImages;

+(InsideCategoryTableViewCell*)cellForTableView:(UITableView*)tableView
{
    
    InsideCategoryTableViewCell *cell = (InsideCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"InsideCell"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"InsideCategoryTableViewCell" owner:self options:nil];
        cell = (InsideCategoryTableViewCell *)[nib objectAtIndex:0];
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setupCell:(InsideCategoryObjects*)object withIndex:(NSIndexPath *)indexPath{
    
    [self.indicatorView startAnimating];
    
    self.index = (int)indexPath.row;
    
    self.categoryNameLabel.text = object.categoryInsideName;
    
    [self setupStarImage:object.categoryInsideStarNumber];
    
    if( allImages[@(self.index)] == nil ) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{ // 1
            
            UIImage *cityImage = [InsideCategoryServer getImageFromParseBackend:object.categoryInsideImage.url];
            
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

-(void)setupStarImage:(int)numberOfStar{

    NSMutableArray *starImageViews = [[NSMutableArray alloc] initWithObjects:self.star1, self.star2, self.star3, self.star4, self.star5, nil];
        
    for( int i = 0 ; i <= numberOfStar; i ++ ) {
        
        if( i == numberOfStar ) {
            
            for ( int j = i ; j < 5 ; j ++ ) {
            
                [starImageViews[j] setImage:[UIImage imageNamed:@"noneStar"]];
            
            }
            
        } else {
            
            [starImageViews[i] setImage:[UIImage imageNamed:@"1Star"]];
            
        }
        
        
            
    }
        
}


#pragma mark - Parallax Effect

-(void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {
    
    CGRect rectInSuperView  = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight((view.frame)) / 2 - CGRectGetMinY(rectInSuperView);
    
    float differance = CGRectGetHeight(self.categoryImageView.frame) - CGRectGetHeight(self.frame);
    
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * differance ;
    
    CGRect imageRect = self.categoryImageView.frame;
    
    imageRect.origin.y = -(differance / 2) + move;
    
    self.categoryImageView.frame = imageRect;
    
}


@end
