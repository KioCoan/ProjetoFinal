//
//  ListaDesafioViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ListaDesafioViewController.h"
#import "CustomizadaTableViewCell.h"
@interface ListaDesafioViewController ()

@end

@implementation ListaDesafioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	gerenciadorDesafios = [GerenciadorDesafios sharedGerenciador];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    titulosDescricoes = [gerenciadorDesafios retornaTitulosEDescricoesDesafios];
    
    [self.navigationItem setTitle:@"Desafios"];
    [[self.navigationItem backBarButtonItem]setTitle:@""];
    
    
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
    [shadow setShadowOffset:CGSizeMake(0, 1)];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:234.0/255.0 green:175.0/255.0 blue:59.0/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar
//     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
//                              [UIFont fontWithName:FONT_LIGHT size:12]: NSFontAttributeName
//                              
//                              }];
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIColor whiteColor],NSForegroundColorAttributeName, // Cor
                          [UIFont fontWithName:FONT_LIGHT size:21],NSFontAttributeName, // Font Style
                          
                          nil];
    
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
    
    self.navigationController.navigationBar.translucent = NO;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.titulo.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"titulo"];
    cell.descricao.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"descricao"];
    [cell mudaCorDeFundo:(int)indexPath.row];
    //tableView.separatorColor = [cell cor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [titulosDescricoes count];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*) [tableView cellForRowAtIndexPath:indexPath] ;
    [cell.btnGo setHidden:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [gerenciadorDesafios selecionaDesafio:(int)indexPath.row];
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*) [tableView cellForRowAtIndexPath:indexPath] ;
    [cell.btnGo setHidden:NO];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


@end
