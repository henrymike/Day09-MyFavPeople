//
//  TextTableViewCell.h
//  MyFavPeople
//
//  Created by Oscar on 10/2/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel      *cellTextLabel;
@property (nonatomic, weak) IBOutlet UITextField  *cellTextField;

@end
