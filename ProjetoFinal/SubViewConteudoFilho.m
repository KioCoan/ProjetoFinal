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

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    gerenciadorDeAssuntos = [GerenciadorDeAssunto sharedGerenciador];
    
    teoria = [gerenciadorDeAssuntos retornaTeoriaFormatada];
    
    
    txtConteudo.text = [teoria objectAtIndex:self.index];
   
    //[txtConteudo setFont:[UIFont fontWithName:@"System" size:19.0]];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
