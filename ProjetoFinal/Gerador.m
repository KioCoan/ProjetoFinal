//
//  Gerador.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Gerador.h"

@implementation Gerador

-(NSString*)retornaValorInteiro:(int)inicio ate:(int)fim{
    int aleatorio = arc4random() % (fim+1) + inicio;
    
   return [NSString stringWithFormat:@"%d", aleatorio];

}

-(NSString*)retornaValorFloat:(int)inicio ate:(int)fim{
    int aleatorio = arc4random() % fim + inicio;
    int decimal = arc4random() % 100;
    
    return [NSString stringWithFormat:@"%d.%d", aleatorio, decimal];
}

-(NSString*)retornaValorLogico{
    int num = arc4random() % 2;
    
    switch (num) {
        case 1:
            return @"Verdadeiro";
            
        default:
            return @"Falso";
    }
}

-(NSString*)retornaValorAleatorioParaOperador:(NSString*)operador{
    if([operador isEqualToString:@"LÓGICO"]){
        return [self retornaValorLogico];
    
    }else{
        return [self retornaValorFloat:1 ate:1000];
    }
}

-(NSString*)retornaOperadorDoTipo:(NSString*)tipoOperador{
    if([tipoOperador isEqualToString:@"RELACIONAL"]){
        return [self retornaOperadorRelacional];
    
    }else if([tipoOperador isEqualToString:@"ARITMÉTICO"]){
        return [self retornaOperadorAritmetico];
    
    }else if([tipoOperador isEqualToString:@"ATRIBUIÇÃO"]){
        return [self retornaOperadorAtribuicao];
    
    }else if([tipoOperador isEqualToString:@"LÓGICO"]){
        return [self retornaOperadorLogico];
    
    }else{
        @throw [NSException exceptionWithName:@"Operador Inválido." reason:@"Operador passado é inválido." userInfo:nil];
    }
}


-(NSString*)retornaOperadorRelacional{
    
    NSArray *operadores = [NSArray arrayWithObjects:@">",@">=",@"<",@"<=",@"==",@"!=", nil];
    
    int i = [[self retornaValorInteiro:0 ate:(int)(operadores.count)-1] intValue];

    return [operadores objectAtIndex:i];
}


-(NSString*)retornaOperadorAritmetico{
    
    NSArray *operadores = [NSArray arrayWithObjects:@"+",@"-",@"*",@"/", nil];
    
    int i = [[self retornaValorInteiro:0 ate:(int)(operadores.count)-1] intValue];
    
    return [operadores objectAtIndex:i];
}


-(NSString*)retornaOperadorAtribuicao{
    
    NSArray *operadores = [NSArray arrayWithObjects:@"+=",@"-=",@"*=",@"/=", nil];
    
    int i = [[self retornaValorInteiro:0 ate:(int)(operadores.count)-1] intValue];
    
    return [operadores objectAtIndex:i];
}


-(NSString*)retornaOperadorLogico{
    NSArray *operadores = [NSArray arrayWithObjects:@"&&",@"||", nil];
    
    int i = [[self retornaValorInteiro:0 ate:(int)(operadores.count)-1] intValue];
    
    return [operadores objectAtIndex:i];
}

@end
