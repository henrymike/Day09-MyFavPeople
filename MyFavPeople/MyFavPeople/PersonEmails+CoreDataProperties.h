//
//  PersonEmails+CoreDataProperties.h
//  MyFavPeople
//
//  Created by Oscar on 10/2/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonEmails.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonEmails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateEntered;
@property (nullable, nonatomic, retain) NSDate *dateUpdated;
@property (nullable, nonatomic, retain) NSString *emailAddress;
@property (nullable, nonatomic, retain) NSString *emailType;
@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) Persons *relationshipPersonEmailsPersons;

@end

NS_ASSUME_NONNULL_END
