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


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        primeiraChamada = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //INSTANCIO UM GERENCIADOR PARA BUSCAR AS INFORMAÇOES DO ASSUNTO
    gerenciador = [GerenciadorDeAssunto sharedGerenciador];
    
    //DEFINO O TITULO DO NAVIGATION CONTROLLER DE ACORDO COM O NOME DO ASSUNTO
    [[self navigationItem] setTitle:gerenciador.retornaNomeAssuntoAtual];
    
    //CRIO UMA SKVIEW PARA INSERIR A SKSCENE
    viewAnimacao = [[SKView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 609)];
    
    
    //INSTANCIO A SKSCENE INICIAL DO ASSUNTO ATUAL
    SKScene *cena = [gerenciador retornaAnimacaoNumero:1];
    
    
    //DEFININDO TAMANHO DA SKSCENE E ADICIONANDO-A NA SKVIEW
    [cena setSize: viewAnimacao.frame.size];
    [viewAnimacao presentScene:cena];
    
    //[cena setBackgroundColor:[UIColor whiteColor]];
    
    [[self view] addSubview:viewAnimacao];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    
    // Caso a Segue seja identificada como a do conteúdo de teoria, ele seta o myDelegate na view que será exibida
    if ([segueName isEqualToString: @"segueConteudoTeoria"]) {
        
        SubViewConteudo *subViewConteudo = (SubViewConteudo*)[segue destinationViewController];
        
        [subViewConteudo setMyDelegate:self];
       }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Método acionado pela subViewConteúdoFilho este controller é um delegate da referida View

-(void)trocaAnimacao:(int)index{
    
    //CASO SEJA A PRIMEIRA  VEZ QUE ESTE MÉTODO É CHAMADO, ELE NÃO EXECUTA O RESTANTE DO CÓDIGO
    if(primeiraChamada){
        primeiraChamada = NO;
        return;
    }
   
    SKTransition *reveal = [SKTransition fadeWithDuration:1];
    SKScene* proximaAnimacao = [gerenciador retornaAnimacaoNumero:index];
    [proximaAnimacao setSize: viewAnimacao.frame.size];
    proximaAnimacao.scaleMode = SKSceneScaleModeAspectFill;
    
    if (proximaAnimacao) {
        
        [viewAnimacao presentScene:proximaAnimacao transition:reveal];
    }
    
    
}

@end
