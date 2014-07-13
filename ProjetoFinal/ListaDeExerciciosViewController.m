//
//  ListaDeExerciciosViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 13/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ListaDeExerciciosViewController.h"

@interface ListaDeExerciciosViewController ()

@end

@implementation ListaDeExerciciosViewController

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
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [[[[gerenciador assunto] exercicios] objectAtIndex:indexPath.row] tituloExercicio];
    cell.detailTextLabel.text = [[[[gerenciador assunto] exercicios] objectAtIndex:indexPath.row] descricaoExercicio];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[gerenciador assunto]exercicios]count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    txtDescricao.text = [[[[gerenciador assunto] exercicios] objectAtIndex:indexPath.row] descricaoExercicio];
    [btnExercitar setHidden:NO];
    selectedCell = indexPath.row;
    [[gerenciador assunto]selecionaExercicio:selectedCell];
    
}


- (IBAction)btnExercitarAction:(id)sender {

    

}
@end
