//
//  RootViewController.m
//  JKCRM
//
//  Created by Jakey on 14/11/24.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"
#import "MenuCell.h"
#import "NSDictionary+JsonString.h"
#import "NSString+NSArray.h"
#import "MainViewController.h"

#import "CustomerDetailViewController.h"
#import "CustomerMasterViewController.h"
#import "BuyDetailViewController.h"
#import "BuyMasterViewController.h"
#import "SaleDetailViewController.h"
#import "SaleMasterViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.menuView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellWithReuseIdentifier:@"MenuCell"];
    //fix collection 20px self.menuView.contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.splitViewController = [[MGSplitViewController alloc] init];
    self.splitViewController.delegate = self;
    self.masterViewController = [[MasterViewController alloc] init];
    self.detailViewController = [[DetailViewController alloc] init];
    self.splitViewController.detailViewController = self.detailViewController;
    self.splitViewController.masterViewController = self.masterViewController;
    self.splitViewController.splitPosition = 250;
    self.splitViewController.splitWidth = 4;
    self.splitViewController.allowsDraggingDivider = NO;
    [self.splitViewController setDividerView:nil];

    
    [self.view addSubview:self.splitViewController.view];
    self.splitViewController.view.frame = CGRectMake(104, 20, 916, 768-20);
    NSLog(@"self.splitViewController.view.frame%@",NSStringFromCGRect(self.splitViewController.view.frame));
    [self loadData];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //self.menuView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);

}
-(void)loadData{
    NSString *menuJson = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MainMenu" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    _menuList = [menuJson JsonToArray];
    [self.menuView reloadData];
    
    [self.menuView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    [self collectionView:self.menuView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}
#pragma mark -
#pragma mark splitViewController view data source
- (float)splitViewController:(MGSplitViewController *)svc constrainSplitPosition:(float)proposedPosition splitViewSize:(CGSize)viewSize {
    return proposedPosition;
}
#pragma mark -
#pragma mark Collection view data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionVie
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_menuList count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //[self.menuView registerClass:[MenuCell class] forCellWithReuseIdentifier:@"MenuCell"];
    MenuCell *cell = (MenuCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_menuList[indexPath.row]objectForKey:@"icon"][0]]];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_menuList[indexPath.row]objectForKey:@"icon"][1]]];
    cell.name.text = [_menuList[indexPath.row]objectForKey:@"name"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = (MenuCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.name.textColor = [UIColor whiteColor];
    [self didSelectMenuItem:[[_menuList[indexPath.row]objectForKey:@"action"] integerValue]];
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = (MenuCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.name.textColor = [UIColor blackColor];
    
}
-(void)didSelectMenuItem:(NSUInteger)index{
    self.splitViewController.splitPosition = 250;
    self.splitViewController.splitWidth = 4;
    switch (index) {
        case 100001:
        {
            self.splitViewController.splitPosition = 0;
            self.splitViewController.splitWidth = 0;
            self.detailViewController.detailItem  = [[MainViewController alloc]init];
            self.masterViewController.masterItem  = nil;

        }
            break;
        case 100002:
        {
            self.masterViewController.masterItem  = [[CustomerMasterViewController alloc]init];
            self.detailViewController.detailItem  = nil;
        }
            break;
        case 100003:
        {
            self.masterViewController.masterItem  = [[BuyMasterViewController alloc]init];
            self.detailViewController.detailItem  = nil;
        }
            break;
        case 100004:
        {
            self.masterViewController.masterItem  = [[SaleMasterViewController alloc]init];
            self.detailViewController.detailItem  = nil;
        }
            break;
            
        default:
        {
            
        }
            break;
    }
    [self.splitViewController.view setNeedsDisplay];
}

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
