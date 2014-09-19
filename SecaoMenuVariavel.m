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
        
        NSArray *tiposVariaveis = [NSArray arrayWithObjects:@"inteiro", @"real",@"caractere",@"logico",nil];
        
        
        //DESCOMENTAR QUANDO A IMAGEM JA ESTIVER NO PROJETO, E INSERIR O NOME
        self.texture = [SKTexture textureWithImageNamed:@"livre-variavel.png"];
        self.size = self.texture.size;
        self.name = @"secao";
        self.titulo = @"variavel";
        
        self.icones = [NSMutableArray array];
        
        for (int i = 0; i < tiposVariaveis.count; i++) {
            
            
            [self.icones addObject:[self criarIconeSecao:self.titulo tipo:[tiposVariaveis objectAtIndex:i] imagem:@"abrir-caixa1.png"]];
        
        }
    }
    
    return self;
}



@end
