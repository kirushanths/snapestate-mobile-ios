//
//  SEHouseListingTableView.m
//  snapestate-mobile-ios
//
//  Created by Kirushanth on 2014-02-17.
//  Copyright (c) 2014 SnapEstate. All rights reserved.
//

#import "SEHouseListingTableView.h"
#import "SEHouseListingImageCell.h"
#import "SEHouseListingAddressCell.h"
#import "SEHouseListingInfoCell.h"
#import "SEHouseListingPriceCell.h"

enum SE_LISTING_ROWS {
	SE_LISTING_ROW_PREVIEW_IMAGE,
	SE_LISTING_ROW_PRICE,
	SE_LISTING_ROW_ADDRESS,
	SE_LISTING_ROW_FEATURE,
	SE_LISTING_NUM_ROWS
	};

@interface SEHouseListingTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SEHouseListingTableView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
		self.separatorStyle = UITableViewCellSeparatorStyleNone;
		self.delegate = self;
		self.dataSource = self;
	}
	return self;
}

#pragma mark - 
#pragma mark Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return SE_LISTING_NUM_ROWS;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case SE_LISTING_ROW_PRICE:
			return [SEHouseListingPriceCell heightForRow];
		case SE_LISTING_ROW_PREVIEW_IMAGE:
			return [SEHouseListingImageCell heightForRow];
			break;
		case SE_LISTING_ROW_ADDRESS:
			return [SEHouseListingAddressCell heightForRow];
			break;
		case SE_LISTING_ROW_FEATURE:
			return [SEHouseListingInfoCell heightForRow];
			break;
	};
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case SE_LISTING_ROW_PREVIEW_IMAGE: {
			SEHouseListingImageCell *cell = [tableView dequeueReusableCellWithIdentifier:[SEHouseListingImageCell reuseIdentifier]];
			if (!cell) cell = [[SEHouseListingImageCell alloc] init];
			return cell;
		}
		case SE_LISTING_ROW_PRICE: {
			SEHouseListingPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:[SEHouseListingPriceCell reuseIdentifier]];
			if (!cell) cell = [[SEHouseListingPriceCell alloc] init];
			return cell;
		}
		case SE_LISTING_ROW_ADDRESS: {
			SEHouseListingAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:[SEHouseListingAddressCell reuseIdentifier]];
			if (!cell) cell = [[SEHouseListingAddressCell alloc] init];
			return cell;
		}
		case SE_LISTING_ROW_FEATURE: {
			SEHouseListingInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[SEHouseListingInfoCell reuseIdentifier]];
			if (!cell) cell = [[SEHouseListingInfoCell alloc] init];
			return cell;
		}
	}
	return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section { return nil; }
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section { return nil; }

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section { return 0.0f; }
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section { return 0.0f; }

@end
