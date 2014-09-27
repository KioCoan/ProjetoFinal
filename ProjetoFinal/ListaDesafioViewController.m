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
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    CustomizadaTableViewCell *cell = (CustomizadaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //NSLog(@"%@", cell.name.text);
    
    cell.titulo.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"titulo"];
    cell.descricao.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"descricao"];
    
    
//    cell.textLabel.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"titulo"];
//    cell.detailTextLabel.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"descricao"];
    
    
    //VERIFICA SE A O EXERCÍCIO DA LINHA SELECIONADA FOI COMPLETADO PARA INSERIR OU NÃO A IMAGEM
//    if([self verificarExercicioCompleto:(int)indexPath.row]){
//        UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check.png"]];
//        [imageView setFrame:CGRectMake(cell.frame.size.width - 50, 15, 35, 35)];
//        [cell addSubview:imageView];
//    }
    
    
    
    
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [titulosDescricoes count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    txtDescricao.text = [[titulosDescricoes objectAtIndex:indexPath.row]valueForKey:@"descricao"];
    
    
    [btnDesafio setHidden:NO];
    
    //VERIFICA SE A O EXERCÍCIO DA LINHA SELECIONADA FOI COMPLETADO PARA DEFINIR O TEXTO CORRETO
//    if([self verificarExercicioCompleto:(int)indexPath.row]){
//        [btnExercitar setTitle:@"Refazer" forState:UIControlStateNormal];
//        
//    }else{
//        [btnExercitar setTitle:@"Iniciar" forState:UIControlStateNormal];
//    }
    
    [gerenciadorDesafios selecionaDesafio:(int)indexPath.row];
    
}


- (IBAction)acaoBtnDesafio:(id)sender {
    [gerenciadorDesafios instanciaTarefas];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
@end
