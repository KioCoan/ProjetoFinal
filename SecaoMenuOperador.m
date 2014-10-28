//
//  SecaoMenuOperador.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SecaoMenuOperador.h"

@implementation SecaoMenuOperador

- (id)init{
    
    self = [super init];
    
    if (self) {
        
        
        //DESCOMENTAR QUANDO A IMAGEM JA ESTIVER NO PROJETO, E INSERIR O NOME
        self.texture = [SKTexture textureWithImageNamed:@"livre-operador.png"];
        self.size = self.texture.size;
        self.name = @"secao";
        self.titulo = @"operador";
        
       
        
        [self criarTodosIcones];
        
    }
    
    return self;
}

- (void)criarTodosIcones{
    
    NSArray *tiposOperadores = [NSArray arrayWithObjects:@"+",@"-",@"/",@"*",nil];
    
    for (int i = 0; i < tiposOperadores.count; i++) {
        
        //[icones addObject:[self criaIconeSecaoImagem:@"parte-operador.png"]];
        
        //[icones addObject:[self criarIconeSecao:self.titulo tipo:[tiposOperadores objectAtIndex:i] imagem:@"parte-operador.png"]];
        
    }
    
}



@end
