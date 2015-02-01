//
//  ViewController.m
//  DynamicTableview
//
//  Created by Roshit Gopinath on 2/1/15.
//  Copyright (c) 2015 Roshit Gopinath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@property (nonatomic) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.items = @[@{@"name":@"Roshit", @"category":@"student"}].mutableCopy;
    
    self.navigationItem.title = @"Dynamic TableView";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"TableDy";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *items = self.items[indexPath.row];
    cell.textLabel.text = items[@"name"];
    
    return cell;
}

-(void) addNewItem: (UIBarButtonItem*) sender{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add New Item" message:@"Enter the name of student" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex != alertView.cancelButtonIndex)
    {
        UITextField *uitextfield = [alertView textFieldAtIndex:0];
        NSDictionary *item = @{@"name": uitextfield.text, @"category":@"student"};
        [self.items addObject:item];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.items.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
