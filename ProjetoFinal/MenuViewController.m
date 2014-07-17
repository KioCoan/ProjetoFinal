//
//  MenuViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 29/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuViewController.h"
#import "Calculador.h"

@interface MenuViewController ()

@end

static const int BOTAO_WIDTH = 150;
static const int BOTAO_HEIGHT = 102;
static const int ESPACAMENTO_BOTOES = 50;

@implementation MenuViewController


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        gerenciadorDeAssuntos = [GerenciadorDeAssunto sharedGerenciador];
        
        nBotoesNasLinhas = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:2],
                            [NSNumber numberWithInt:3],
                            [NSNumber numberWithInt:2],
                            [NSNumber numberWithInt:3], nil];
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Calculador *c = [[Calculador alloc] init];
    
    NSLog(@"%@",[[c geral]calculaOperador:@"<" numero1:@"2.1" numero2:@"2"]);
    
    //É DEFINIDO O TAMANHO E A POSIÇÃO DA SCROLLVIEW EM RELAÇÃO O TAMANHO DO NAVIGATION CONTROLLER
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    frame.size.height = self.view.frame.size.height - frame.origin.y;
    
    //INICIALIZA A SCROLLVIEW
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    [scroll setBackgroundColor:[UIColor grayColor]];
    [scroll setUserInteractionEnabled:YES];
    [scroll setScrollEnabled:YES];
    [[self view] addSubview:scroll];
    
    int contadorNomes = 0;
    int posicaoYView = 1;
    
    for(int i=0; i<nBotoesNasLinhas.count; i++){
        //INICIALIZA VIEW DE FUNDO
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scroll.frame.origin.x, posicaoYView, scroll.frame.size.width, 200)];
        [view setBackgroundColor:[UIColor whiteColor]];
        [scroll addSubview:view];
        
        //INICIALIZA OS NUMEROS EXIBIDOS NA TELA
        UILabel *numero = [[UILabel alloc] initWithFrame:CGRectMake(10, 93, 10, 14)];
        [numero setText:[NSString stringWithFormat:@"%d", (i + 1)]];
        [numero setTextColor:[UIColor blackColor]];
        [view addSubview:numero];
        
        //POSIÇOES DO BOTAO
        int posicaoXBotao = (view.frame.size.width / 2) - (BOTAO_WIDTH / 2);
        int posicaoYBotao = (view.frame.size.height / 2) - (BOTAO_HEIGHT / 2);
        
        switch ([[nBotoesNasLinhas objectAtIndex:i] intValue]) {
            case 1:
                contadorNomes += [self posicionarUmBotao:view :posicaoXBotao :posicaoYBotao :contadorNomes];
                break;
                
            case 2:
                contadorNomes += [self posicionarDoisBotoes:view :posicaoXBotao :posicaoYBotao :contadorNomes];
                break;
                
            case 3:
                contadorNomes += [self posicionarTresBotoes:view :posicaoXBotao :posicaoYBotao :contadorNomes];
                break;
                
            default:
                break;
        }
        
        
        //DEFINE NOVA POSIÇAO Y PARA A PROXIMA VIEW
        posicaoYView += view.frame.size.height + 1;
    }
    
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width, posicaoYView)];
}


//METODO QUE INSERE UM BOTÃO NA LINHA
-(int)posicionarUmBotao:(UIView*)view :(int)posicaoXBotao :(int)posicaoYBotao :(int)contadorNomes{
    UIImage *imgCaixa = [UIImage imageNamed:@"item-variavel.png"];
    
    //INICIALIZA BOTAO
    UIButton *botao = [[UIButton alloc] initWithFrame:CGRectMake(posicaoXBotao, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
    [botao setImage:imgCaixa forState:UIControlStateNormal];
    [botao setTitle:[gerenciadorDeAssuntos getNomedoAssunto:contadorNomes] forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:botao];
    
    return 1;
}

//METODO QUE INSERE DOIS BOTÕES NA LINHA
-(int)posicionarDoisBotoes:(UIView*)view :(int)posicaoXBotao :(int)posicaoYBotao :(int)contadorNomes{
    
    int posicaoBotao1 = posicaoXBotao - (BOTAO_WIDTH /2) - (ESPACAMENTO_BOTOES / 2);
    int posicaoBotao2 = posicaoXBotao + (BOTAO_WIDTH /2) + (ESPACAMENTO_BOTOES / 2);

    
    UIImage *imgCaixa = [UIImage imageNamed:@"item-variavel.png"];
    
    //INICIALIZA BOTAO
    UIButton *botao = [[UIButton alloc] initWithFrame:CGRectMake(posicaoBotao1, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
    [botao setImage:imgCaixa forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
    [botao setTitle:[gerenciadorDeAssuntos getNomedoAssunto:contadorNomes++] forState:UIControlStateNormal];
    
    
    //INICIALIZA SEGUNDO BOTÃO
    UIButton *botao2 = [[UIButton alloc] initWithFrame:CGRectMake(posicaoBotao2, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
    [botao2 setImage:imgCaixa forState:UIControlStateNormal];
    [botao2 addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
    [botao2 setTitle:[gerenciadorDeAssuntos getNomedoAssunto:contadorNomes] forState:UIControlStateNormal];
    
    [view addSubview:botao];
    [view addSubview:botao2];
    
    return 2;
}


//METODO QUE INSERE TRÊS BOTÕES NA LINHA
-(int)posicionarTresBotoes:(UIView*)view :(int)posicaoXBotao :(int)posicaoYBotao :(int)contadorNomes{
    int posicaoBotao1 = posicaoXBotao - BOTAO_WIDTH - ESPACAMENTO_BOTOES;
    int posicaoBotao2 = posicaoXBotao + BOTAO_WIDTH + ESPACAMENTO_BOTOES;
    UIImage *imgCaixa = [UIImage imageNamed:@"item-variavel.png"];
    
    //INICIALIZA BOTAO DA ESQUERDA
    UIButton *botao = [[UIButton alloc] initWithFrame:CGRectMake(posicaoBotao1, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
    [botao setImage:imgCaixa forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
    [botao setTitle:[gerenciadorDeAssuntos getNomedoAssunto:contadorNomes++] forState:UIControlStateNormal];
    
    //INICIALIZA BOTÃO DO MEIO
    [self posicionarUmBotao:view :posicaoXBotao :posicaoYBotao :contadorNomes++];
    
    //INICIALIZA BOTÃO DA DIREITA
    UIButton *botao2 = [[UIButton alloc] initWithFrame:CGRectMake(posicaoBotao2, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
    [botao2 setImage:imgCaixa forState:UIControlStateNormal];
    [botao2 addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
    [botao2 setTitle:[gerenciadorDeAssuntos getNomedoAssunto:contadorNomes] forState:UIControlStateNormal];
    
    [view addSubview:botao];
    [view addSubview:botao2];
    
    return 3;
}


-(void)mostrarAssunto:(id)sender{
    
    
    [self performSegueWithIdentifier:@"conteudoController" sender:nil];

    
    [gerenciadorDeAssuntos mudarTemaEstudado:[sender currentTitle]];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
