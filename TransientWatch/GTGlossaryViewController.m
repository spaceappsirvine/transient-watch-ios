//
//  GTGlossaryViewController.m
//  TransientWatch
//
//  Created by Emma He on 4/12/15.
//  Copyright (c) 2015 Originate. All rights reserved.
//

#import "GTGlossaryViewController.h"

@interface GTGlossaryViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation GTGlossaryViewController
NSArray * glossrays;
NSArray * explainations;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GalacticTitansLogo@2px"]];
    
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"navigation-bar.back", nil)
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    

    
        glossrays = [NSArray arrayWithObjects:@"Equatorial coordinate system",@"Crab (unit)", nil];
    
        explainations = [NSArray arrayWithObjects:@"The equatorial coordinate system is a widely used celestial coordinate system used to specify the positions of celestial objects.A star's spherical coordinates are often expressed as a pair, right ascension and declination, without a distance coordinate", @"A Crab is a standard astrophotometrical unit for measurement of the intensity of Astrophysical X-ray sources.[1][2][3][4] One Crab is defined as the intensity of the Crab Nebula at the corresponding X-ray photon energy.",nil];
    
    
}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [glossrays count];
//}
//
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 120; // your dynamic height...
//}
//
//
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    [cell setBackgroundColor:[UIColor clearColor]];
//    
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.textLabel.textAlignment = NSTextAlignmentLeft;
//    cell.textLabel.text = [glossrays objectAtIndex:indexPath.row];
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:19.0];
//    cell.textLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, 48);
//    
//    cell.detailTextLabel.textColor = [UIColor whiteColor];
//    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
//    cell.detailTextLabel.text = [explainations objectAtIndex:indexPath.row];
//    return cell;
//}
//
//
//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
