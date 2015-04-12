//
//  GTDataViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTDataViewController.h"
#import "GTDataCellTableViewCell.h"
#import "GTImageViewController.h"
#import "GTEvent.h"
#import "MBProgressHUD.h"
#import "GTImageViewController.h"
#import "GTFavoritesViewController.h"

@interface GTDataViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* events;

@end

@implementation GTDataViewController{
    NSArray *tableData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self getData];
  
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];
  
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
                                                               style:UIBarButtonItemStylePlain
                                                              target:nil
                                                              action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    UIView *hdr = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 70.0)];
    [hdr setBackgroundColor:[UIColor clearColor]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 3.0, 300.0, 30.0)];
    headerLabel.text = @"    Recent Changes:";
    [headerLabel setFont:[UIFont boldSystemFontOfSize:17.0]];
    headerLabel.textColor = [UIColor whiteColor];
    
    UIButton* favoritesButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 3, 30, 30)];
    [favoritesButton setImage:[UIImage imageNamed:@"Star.png"] forState:UIControlStateNormal];
    [favoritesButton addTarget:self action:@selector(favoritesButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
  
  
    UILabel *designationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.8, 25.0, 300.0, 45.0)];
    designationLabel.numberOfLines = 2;
    designationLabel.text = @"     Name\n     Type";
    [designationLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
    designationLabel.textColor = [UIColor yellowColor];
    
    
    UILabel *changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 30.0, 300.0, 30.0)];
    changeLabel.text = @"     Change";
    [changeLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
    changeLabel.textColor = [UIColor yellowColor];
    
    
    UIView *seperatorView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 68, self.view.frame.size.width - 20.0f, 1)];
    seperatorView.backgroundColor = [UIColor whiteColor];
  
    [hdr addSubview:favoritesButton];
    [hdr addSubview:seperatorView];
    [hdr addSubview:designationLabel];
    [hdr addSubview:headerLabel];
    [hdr addSubview:changeLabel];
    
    
    [self.tableView setTableHeaderView:hdr];
    UIImageView * backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    backgroundImageView.image = [UIImage imageNamed:@"Background"];
    [self.tableView setBackgroundView:backgroundImageView];
}

- (void)favoritesButtonTapped:(id)sender {
  GTFavoritesViewController* favoritesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GTFavoritesViewController"];
  [self.navigationController pushViewController:favoritesVC animated:YES];
}

- (void)getData {
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
  [GTEvent fetchEvents:^(NSArray *events) {
    self.events = events;
    [self.tableView reloadData];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    return;
  } failureBlock:^(NSError *error) {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    return;
  }];
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.events count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    GTDataCellTableViewCell *cell = (GTDataCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GTDataCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
  
    GTEvent* event = self.events[indexPath.row];
    cell.nameLabel.text = event.name;
    cell.typeLabel.text = event.type;
    cell.differenceLabel.text = [NSString stringWithFormat:@"%ld", (long)event.difference];
    if (event.difference >= 0) {
      cell.arrowImageView.image = [UIImage imageNamed:@"UpArrow"];
    } else {
      cell.arrowImageView.image = [UIImage imageNamed:@"DownArrow.png"];
    }

  
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

  GTEvent* event = self.events[indexPath.row];
  GTImageViewController* imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GTImageViewController"];
  imageVC.event = event;
  [self.navigationController pushViewController:imageVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 80.0f;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
