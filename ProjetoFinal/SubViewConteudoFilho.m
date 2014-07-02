//
//  SubViewConteudoFilho.m
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
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
    
    //self.lblConteudo.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    gerenciadorDeAssuntos = [GerenciadorDeAssunto sharedGerenciador];
    
    teoria = [gerenciadorDeAssuntos retornaTeoriaFormatada];
    
    
    self.lblConteudo.text = [teoria objectAtIndex:self.index];
    txtConteudo.text = [teoria objectAtIndex:self.index];
    [txtConteudo setFont:[UIFont fontWithName:@"System" size:19.0]];
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
