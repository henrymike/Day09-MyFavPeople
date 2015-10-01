//
//  PersonEmails+CoreDataProperties.m
//  MyFavPeople
//
//  Created by Oscar on 10/1/15.
//  Copyright © 2015 Mike Henry. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonEmails+CoreDataProperties.h"

@implementation PersonEmails (CoreDataProperties)

@dynamic emailAddress;
@dynamic emailType;
@dynamic dateEntered;
@dynamic dateUpdated;
@dynamic userID;
@dynamic relationshipPersonEmailsPersons;

@end
