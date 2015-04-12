//
//  GTDataViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/11/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTDataViewController.h"
#import "GTDataCellTableViewCell.h"
@interface GTDataViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GTDataViewController{
    NSArray *tableData;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *hdr = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 60.0)];
    [hdr setBackgroundColor:[UIColor clearColor]];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.8, 0.0, 300.0, 30.0)];
    headerLabel.text = @"    Recent Changes/Notifications:";
    [headerLabel setFont:[UIFont boldSystemFontOfSize:17.0]];
    headerLabel.textColor = [UIColor whiteColor];
    
    
    
    UILabel *designationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.8, 20.0, 300.0, 45.0)];
    designationLabel.numberOfLines = 2;
    designationLabel.text = @"     Name\n     Type";
    [designationLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
    designationLabel.textColor = [UIColor yellowColor];
    
    
    UILabel *changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(230.0, 25.0, 300.0, 30.0)];
    changeLabel.text = @"     Change";
    [changeLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
    changeLabel.textColor = [UIColor yellowColor];
    
    
    UIView *seperatorView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 60, self.view.frame.size.width, 3)];
    seperatorView.backgroundColor = [UIColor whiteColor];
    
    [hdr addSubview:seperatorView];
    [hdr addSubview:designationLabel];
    [hdr addSubview:headerLabel];
    [hdr addSubview:changeLabel];
    
    
    [self.tableView setTableHeaderView:hdr];
    UIImageView * backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    backgroundImageView.image = [UIImage imageNamed:@"Background"];
    [self.tableView setBackgroundView:backgroundImageView];
    
    
    
    
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
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
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.typeLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.differenceLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.arrowImageView.image = [UIImage imageNamed:@"DownArrow.png"];

    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
