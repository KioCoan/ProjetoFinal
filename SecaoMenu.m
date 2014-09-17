//
//  SecaoMenu.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SecaoMenu.h"

@implementation SecaoMenu

- (IconeSecao *)criarIconeSecao :(NSString *)titulo tipo:(NSString *)tipo posicao:(CGPoint)posicao{
    
    IconeSecao *icone = [[IconeSecao alloc]init];
    
    [icone setSecao:titulo];
    [icone setTipo:tipo];
    [icone setPosition:posicao];
    [icone setPosicaoAnterior:posicao];
    
    return icone;
}

@end
