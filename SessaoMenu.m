//
//  SecaoMenu.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SessaoMenu.h"

@implementation SessaoMenu




- (IconeView *)criaIconeSecaoImagem:(NSString *)imagem{
    
    IconeView *iconeView = [[IconeView alloc]initWithImage:[UIImage imageNamed:imagem]];
    [iconeView setUserInteractionEnabled:YES];
    [iconeView setCategoria:self.titulo];
    
    return iconeView;
    
}

- (id)init{
    
    self = [super init];
    
    
    if  (self){
        
        [self setUserInteractionEnabled:YES];
        
        
    }
    return self;
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.myDelegate sessaoAtivada:self.titulo];

}

- (int)retornaNumeroIcones{
    
    return self.tiposIcones.count;
    
}

@end
