//
//  MenuViewController.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 29/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

static int BOTAO_WIDTH = 165;
static int BOTAO_HEIGHT = 113;

@implementation MenuViewController

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
    
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    frame.size.height = self.view.frame.size.height - frame.origin.y;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:frame];
    [scroll setBackgroundColor:[UIColor grayColor]];
    [scroll setUserInteractionEnabled:YES];
    [scroll setScrollEnabled:YES];
    
    
    [[self view] addSubview:scroll];
    
    int valorY = 1;
    
    for(int i=0; i<7; i++){
        //INICIALIZA VIEW DE FUNDO
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scroll.frame.origin.x, valorY, scroll.frame.size.width, 200)];
        [view setBackgroundColor:[UIColor whiteColor]];
        [scroll addSubview:view];
        
        //INICIALIZA OS NUMEROSDA DIREITA
        UILabel *numero = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.origin.x + 10, 93, 10, 14)];
        [numero setText:[NSString stringWithFormat:@"%d", (i + 1)]];
        [numero setTextColor:[UIColor blackColor]];
        [view addSubview:numero];
        
        //POSIÇOES DO BOTAO
        int posicaoXBotao = (view.frame.size.width / 2) - (BOTAO_WIDTH / 2);
        int posicaoYBotao = (view.frame.size.height / 2) - (BOTAO_HEIGHT / 2);
        
        //INICIALIZA BOTAO
        UIButton *botao = [[UIButton alloc] initWithFrame:CGRectMake(posicaoXBotao, posicaoYBotao, BOTAO_WIDTH, BOTAO_HEIGHT)];
        UIImage *imgCaixa = [UIImage imageNamed:@"item-variavel3.png"];
        [botao setImage:imgCaixa forState:UIControlStateNormal];
        [botao setTag:1];
        [botao setTitle:@"BTN" forState:UIControlStateNormal];
        [botao addTarget:self action:@selector(mostrarAssunto:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:botao];
        
        //DEFINE NOVA POSIÇAO Y PARA A PROXIMA VIEW
        valorY += view.frame.size.height + 1;
    }
    
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width, valorY)];
}


-(void)mostrarAssunto:(id)sender{
    NSLog(@"Clicou %@", [sender currentTitle]);
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
