//
//  SecaoMenuVariavel.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SecaoMenuVariavel.h"

@implementation SecaoMenuVariavel


- (id)init{
    
    self = [super init];
    
    if (self) {
        
        
        //DESCOMENTAR QUANDO A IMAGEM JA ESTIVER NO PROJETO, E INSERIR O NOME
        self.texture = [SKTexture textureWithImageNamed:@"livre-variavel.png"];
        self.size = self.texture.size;
        self.name = @"secao";
        self.titulo = @"variavel";
        self.tiposIcones = [NSArray arrayWithObjects:@"inteiro", @"real",@"caractere",@"logico",nil];
    }
    
    return self;
}



- (NSMutableArray *)criarTodosIcones{
    
    
    
    NSMutableArray *icones = [NSMutableArray array];
    
    
    for (int i = 0; i < self.tiposIcones.count; i++) {
        
        
        IconeView *icone = [self criaIconeSecaoImagem:@"abrir-caixa1.png"];
        [icone setTipo: [self.tiposIcones objectAtIndex:i]];
        
        [icones addObject:icone];
       
    }
    
    return icones;

}

- (IconeView *)criaIconeSecaoImagem:(NSString *)imagem{
    
    IconeView *iconeView = [[IconeView alloc]initWithImage:[UIImage imageNamed:imagem]];
    [iconeView setUserInteractionEnabled:YES];
    [iconeView setCategoria:self.titulo];
    
    return iconeView;
    
}





@end
