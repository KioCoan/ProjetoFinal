//
//  ConteudoViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 29/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ConteudoViewController.h"
#import "SubViewConteudoFilho.h"
#import "Variavel.h"

@interface ConteudoViewController ()

@end

@implementation ConteudoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Variavel *v = [[Variavel alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //INSTANCIO UM GERENCIADOR PARA BUSCAR AS INFORMAÇOES DO ASSUNTO
    GerenciadorDeAssunto *gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    //DEFINO O TITULO DO NAVIGATION CONTROLLER DE ACORDO COM O NOME DO ASSUNTO
    [[self navigationItem] setTitle:gerenciador.retornaNomeAssuntoAtual];
    
    //CRIO UMA SKVIEW PARA INSERIR A SKSCENE
    SKView *viewAnimacao = [[SKView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 600)];
    
    //INSTANCIO A SKSCENE DO ASSUNTO ATUAL
    SKScene *cena = gerenciador.retornaAnimacao;
    
    //DEFININDO TAMANHO DA SKSCENE E ADICIONANDO-A NA SKVIEW
    [cena setSize: viewAnimacao.frame.size];
    [viewAnimacao presentScene:cena];
    
    [cena setBackgroundColor:[UIColor whiteColor]];
    
    [[self view] addSubview:viewAnimacao];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    //Após exibir a tela prepara a lista de exercícios (Aloca todos eles)para que sejam exibidos seus Titulos e descriçoes na póxima tela
    [super viewDidAppear:animated];
    GerenciadorDeAssunto *gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    [gerenciador preparaExercicios];// Chamada do método que aloca os exercícios
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
