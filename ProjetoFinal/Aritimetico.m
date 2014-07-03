//
//  Aritimetico.m
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import "Aritimetico.h"

@implementation Aritimetico

-(int)calcularComOperadorNome:(NSString*)operacao eNumero1:(NSString*)numero1 eNumero2:(NSString*)numero2{
    
    int oper = [operacao intValue];
    
    if ([operacao isEqualToString:@"Soma"]) {
        oper = 1;
    }else if ([operacao isEqualToString:@"Subtracao"]){
        oper = 2;
    }else if ([operacao isEqualToString:@"Multiplicacao"]){
        oper = 3;
    }else if ([operacao isEqualToString:@"Divisao"]){
        oper = 4;
    }
    
    
    int n1 = [numero1 intValue];
    int n2 = [numero2 intValue];
    
    
    
    
    switch (oper) {
        case 1: // soma
            return n1 + n2;
            break;
        case 2: // subtração
            return n1 - n2;
            break;
        case 3: // multiplicação
            return n1 * n2;
            break;
        case 4: // divisão
            return n1 / n2;
            break;
            
        default:
            return -1;
            break;
    }
    
    
    
}


@end
