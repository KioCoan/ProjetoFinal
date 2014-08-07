//
//  Gerador.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Gerador.h"

@implementation Gerador

-(int)retornaInteiro:(int)inicio ate:(int)fim{
    int aleatorio = arc4random() % (fim+1) + inicio;
    
    NSString *aux = [NSString stringWithFormat:@"%d", aleatorio];
    int retorno = [aux intValue];
    
    return retorno;
}
-(float)retornaFloat:(int)inicio ate:(int)fim{
    int aleatorio = arc4random() % fim + inicio;
    int decimal = arc4random() % 100;
    
    NSString *aux = [NSString stringWithFormat:@"%d.%d", aleatorio, decimal];
    float retorno = [aux floatValue];
    
    return retorno;
}
-(NSString*)retornaOperadorRelacional{
    
    NSArray *operadores = [NSArray arrayWithObjects:@">",@">=",@"<",@"<=",@"==",@"!=", nil];
    
    int i = [self retornaInteiro:0 ate:((int)operadores.count)-1];

    return [operadores objectAtIndex:i];
}

@end
