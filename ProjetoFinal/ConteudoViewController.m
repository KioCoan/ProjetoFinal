//
//  ConteudoViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 29/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ConteudoViewController.h"
#import "SubViewConteudoFilho.h"
#import "SubViewConteudo.h"
#import "Variavel.h"

@interface ConteudoViewController ()
{
    SKView *viewAnimacao;
}
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
    
    //INSTANCIO UM GERENCIADOR PARA BUSCAR AS INFORMAÇOES DO ASSUNTO
    gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    [gerenciador setaDelegate:self];
    
    // Do any additional setup after loading the view.
    //Variavel *v = [[Variavel alloc] init];
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //DEFINO O TITULO DO NAVIGATION CONTROLLER DE ACORDO COM O NOME DO ASSUNTO
    [[self navigationItem] setTitle:gerenciador.retornaNomeAssuntoAtual];
    
    //CRIO UMA SKVIEW PARA INSERIR A SKSCENE
    viewAnimacao = [[SKView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 609)];
    
    //INSTANCIO A SKSCENE INICIAL DO ASSUNTO ATUAL
    SKScene *cena = [gerenciador retornaAnimacaoNumero:1];
    
    //DEFININDO TAMANHO DA SKSCENE E ADICIONANDO-A NA SKVIEW
    [cena setSize: viewAnimacao.frame.size];
    [viewAnimacao presentScene:cena];
    
    [cena setBackgroundColor:[UIColor whiteColor]];
    
    [[self view] addSubview:viewAnimacao];
    
    NSLog(@"Conteudo");
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    //Após exibir a tela prepara a lista de exercícios (Aloca todos eles)para que sejam exibidos seus Titulos e descriçoes na póxima tela
    [super viewDidAppear:animated];
    
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.view = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Conteudo memoria");
    
}

//Método acionado pela subViewConteúdoFilho este controller é um delegate da referida View

-(void)trocaAnimacao:(int)index{
    
    
   
    SKTransition *reveal = [SKTransition fadeWithDuration:1];
    SKScene* proximaAnimacao = [gerenciador retornaAnimacaoNumero:index];
    [proximaAnimacao setSize: viewAnimacao.frame.size];
    proximaAnimacao.scaleMode = SKSceneScaleModeAspectFill;
    
    if (proximaAnimacao) {
        
        [viewAnimacao presentScene:proximaAnimacao transition:reveal];
    }
    
    
}

@end
