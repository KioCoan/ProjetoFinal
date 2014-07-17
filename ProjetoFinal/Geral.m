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
    }
    return self;
}

-(NSString*)calculaOperador:(NSString*)operacao numero1:(NSString*)numero1 numero2:(NSString*)numero2{
    
    // Converto os dois números pra float
    float convertido1 = [numero1 floatValue];
    float convertido2 = [numero2 floatValue];
    
    NSNumber *n1 ,*n2;
    
    if ((floorf(convertido1)) == convertido1) {
        // Caso Inteiro
        n1 = [NSNumber numberWithInt:convertido1];
        
    }else{
        // Caso float
        n1 = [NSNumber numberWithFloat:convertido1];
        
    }
    
    if ((floorf(convertido2)) == convertido2) {
        // Caso inteiro
        n2 = [NSNumber numberWithInt:convertido2];
    }else{
        // Caso Float
        n2 = [NSNumber numberWithFloat:convertido2];
    }
    
    
    
    int oper;
    
    // Define  Oper conforme o tipo passado como parâmero
    
    if ([operacao isEqualToString:@">"]) {
        oper = 1;
    }else if ([operacao isEqualToString:@">="]){
        oper = 2;
    }else if ([operacao isEqualToString:@"<"]){
        oper = 3;
    }else if ([operacao isEqualToString:@"<="]){
        oper = 4;
    }else if ([operacao isEqualToString:@"=="]){
        oper = 5;
    }else if ([operacao isEqualToString:@"!="]){
        oper = 6;
    }else if ([operacao isEqualToString:@"+"]) {
        oper = 7;
    }else if ([operacao isEqualToString:@"-"]){
        oper = 8;
    }else if ([operacao isEqualToString:@"*"]){
        oper = 9;
    }else if ([operacao isEqualToString:@"/"]){
        oper = 10;
    }else if ([operacao isEqualToString:@"&&"]){
        oper = 11;
    }else if ([operacao isEqualToString:@"||"]){
        oper = 12;
    }else{
        oper = -1;
    }
    
    NSString *resultado;
    
    switch (oper) {
            
        case 1: // Maior
        case 2: // Maior ou igual
        case 3: // Menor
        case 4: // Menor ou igual
        case 5: // Igual
        case 6: // Diferente
            resultado = [calculadorRelacional calcularComOperadorNome:oper eNumero1:convertido1 eNumero2:convertido2];
            break;
        case 7: // Soma
            resultado = [calculadorAritimetico soma:convertido1 n2:convertido2];
            break;
        case 8: // Subtração
            resultado = [calculadorAritimetico subtrai:convertido1 n2:convertido2];
            break;
        case 9: // Multiplicação
            resultado = [calculadorAritimetico multiplica:convertido1 n2:convertido2];
            break;
        case 10: // Divisão
            resultado = [calculadorAritimetico divide:convertido1 n2:convertido2];
            break;
        case 11: // E Lógico &&
            resultado = [calculadorLogico calcularELogicoExpressao1:numero1 eExpressao2:numero2];
            break;
        case 12: // Ou lógico ||
            resultado = [calculadorLogico calcularOULogicoExpressao1:numero1 eExpressao2:numero2];
            break;
        default: // NDA
            break;
            
    }
    
    return resultado;
    
}





@end
