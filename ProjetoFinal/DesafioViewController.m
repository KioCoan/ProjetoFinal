//
//  DesafioViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "DesafioViewController.h"

@interface DesafioViewController ()

@end

@implementation DesafioViewController

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
    
    gerenciadorDesafios = [GerenciadorDesafios sharedGerenciador];
    gerador = [[Gerador alloc]init];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [gerenciadorDesafios resetaCena];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    viewDesafioAtual = [[SKView alloc] initWithFrame:self.view.frame];
    viewDesafioAtual.showsFPS = YES;
    [self.view addSubview:viewDesafioAtual];
    [viewDesafioAtual presentScene:[gerenciadorDesafios retornaCenaAtual]];
    [[viewDesafioAtual scene]setSize:viewDesafioAtual.frame.size];
    
}

-(void)ajustaBotoes{
    int aleatorio = arc4random() % 2;
    if (aleatorio == 1) {
        [self.btn1 setTitle:[self.desafioAtual operador] forState:UIControlStateNormal];
        [self.btn2 setTitle:[gerador retornaOperadorInverso:[self.desafioAtual operador]] forState:UIControlStateNormal];
    }else{
        [self.btn2 setTitle:[self.desafioAtual operador] forState:UIControlStateNormal];
        [self.btn1 setTitle:[gerador retornaOperadorInverso:[self.desafioAtual operador]] forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acaoBotao1:(id)sender {
    [self alteraValores];
    [self ajustaBotoes];
}





- (IBAction)acaoBotao2:(id)sender {
}

-(void)alteraValores{
    
    if ([self.desafioAtual incrementaTarefa]) {
        self.lblParte1.text = [self.desafioAtual parte1];
        self.lblOperador.text = @"?";
        self.lblParte2.text = [self.desafioAtual parte2];
        self.lblResultado.text = [self.desafioAtual resultado];
        
//        if ([self.desafioAtual respostaDupla]) {
//            NSLog(@"Dupla");
//        }
    }else{
        NSLog(@"Fim");
    }
    
    

}
@end
