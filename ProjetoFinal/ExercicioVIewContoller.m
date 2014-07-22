//
//  ExercicioVIewContollerViewController.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 11/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ExercicioVIewContoller.h"

@interface ExercicioVIewContoller ()

@end

@implementation ExercicioVIewContoller

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
    
    
    //INSTANCIO UM GERENCIADOR PARA BUSCAR AS INFORMAÇOES DO ASSUNTO
    GerenciadorDeAssunto *gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    //DEFINO O TITULO DO NAVIGATION CONTROLLER DE ACORDO COM O NOME DO ASSUNTO
    [[self navigationItem] setTitle:gerenciador.retornaNomeAssunto];
    
    //CRIO UMA SKVIEW PARA INSERIR A SKSCENE
    SKView *viewExercicio = [[SKView alloc] initWithFrame:self.view.frame];
    
    
    //INSTANCIO A SKSCENE DO ASSUNTO ATUAL
    SKScene *cena = [gerenciador retornaExercicioSelecionado];
    
    //DEFININDO TAMANHO DA SKSCENE E ADICIONANDO-A NA SKVIEW
    [cena setSize: viewExercicio.frame.size];
    
    [viewExercicio presentScene:cena];
    
    [[self view] addSubview:viewExercicio];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidDisappear:(BOOL)animated{
    
    
}

@end
