//
//  SubViewConteudoFilho.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 02/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SubViewConteudoFilho.h"

@interface SubViewConteudoFilho ()

@end

@implementation SubViewConteudoFilho

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
    
}
-(id)init{
    self = [super init];
    if (self) {
        self.primeiraChamada = YES;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    viewDeConteudo = [self.storyboard instantiateViewControllerWithIdentifier:@"conteudo"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    gerenciadorDeAssuntos = [GerenciadorDeAssunto sharedGerenciador];
    
    teoria = [gerenciadorDeAssuntos retornaTeoriaFormatada];
    
    
    // PONTO CHAVE

    if (!self.primeiraChamada) {
        [self.myDelegate trocaAnimacao:(int)self.index + 1];
        self.primeiraChamada = NO;
    }
    
    
    
    
    txtConteudo.text = [teoria objectAtIndex:self.index];
    [txtConteudo setFont:[UIFont fontWithName:@"Helvetica" size:23.0]];
    [txtConteudo setTextColor:[UIColor whiteColor]];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.myDelegate = nil;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
