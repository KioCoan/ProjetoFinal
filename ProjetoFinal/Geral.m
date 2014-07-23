//
//  Geral.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 17/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Geral.h"

@implementation Geral
{
    Aritimetico *calculadorAritimetico;
    Logico *calculadorLogico;
    Relacional *calculadorRelacional;
}

-(id)init{
    self = [super init];
    if (self) {
        calculadorAritimetico = [[Aritimetico alloc] init];
        calculadorLogico = [[Logico alloc] init];
        calculadorRelacional = [[Relacional alloc] init];
        
        operadores = [NSArray arrayWithObjects:@">",
                                               @">=",
                                               @"<",
                                               @"<=",
                                               @"==",
                                               @"!=",
                                               @"+",
                                               @"-",
                                               @"*",
                                               @"/",
                                               @"&&",
                                               @"||", nil];
    }
    return self;
}

-(NSString*)calculaOperador:(NSString*)operacao numero1:(NSString*)numero1 numero2:(NSString*)numero2{
    
    for(int i=0; i<operadores.count; i++){
        if([operacao isEqualToString:[operadores objectAtIndex:i]]){
            return [self retornaResultado:i numero1:numero1 numero2:numero2];
        }
    }
    
    
    return @"Erro";
 
}

-(NSString*)retornaResultado:(int)oper numero1:(NSString*)numero1 numero2:(NSString*)numero2{
    // Converto os dois números pra float
    float convertido1 = [numero1 floatValue];
    float convertido2 = [numero2 floatValue];
    
    switch (oper) {
            
        case 0: // Maior
        case 1: // Maior ou igual
        case 2: // Menor
        case 3: // Menor ou igual
        case 4: // Igual
        case 5: // Diferente
            return [calculadorRelacional calcularComOperadorNome:oper eNumero1:convertido1 eNumero2:convertido2];
            
        case 6: // Soma
            return [calculadorAritimetico soma:convertido1 n2:convertido2];
            
        case 7: // Subtração
            return [calculadorAritimetico subtrai:convertido1 n2:convertido2];
            
        case 8: // Multiplicação
            return [calculadorAritimetico multiplica:convertido1 n2:convertido2];
            
        case 9: // Divisão
            return [calculadorAritimetico divide:convertido1 n2:convertido2];
            
        case 10: // E Lógico &&
            return [calculadorLogico calcularELogicoExpressao1:numero1 eExpressao2:numero2];
            
        case 11: // Ou lógico ||
            return [calculadorLogico calcularOULogicoExpressao1:numero1 eExpressao2:numero2];
            
        default: // NDA
            return @"Erro";
    }
}


-(NSString*)getOperador:(int)operador{
    if(operador >= operadores.count){
        return @"Erro";
    }
    return [operadores objectAtIndex:operador];
}

@end
