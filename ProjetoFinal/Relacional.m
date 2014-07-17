//
//  Relacional.m
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import "Relacional.h"

@implementation Relacional


-(BOOL)calcularComOperadorNome:(NSString*)operacao eNumero1:(NSString*)numero1 eNumero2:(NSString*)numero2{
    
    int oper;
    
    if ([operacao isEqualToString:@"Maior"]) {
        oper = 1;
    }else if ([operacao isEqualToString:@"MaiorOuIgual"]){
        oper = 2;
    }else if ([operacao isEqualToString:@"Menor"]){
        oper = 3;
    }else if ([operacao isEqualToString:@"MenoOuIgual"]){
        oper = 4;
    }else if ([operacao isEqualToString:@"Igual"]){
        oper = 5;
    }else if ([operacao isEqualToString:@"Diferente"]){
        oper = 6;
    }else{
        oper = -1;
    }
    
    int n1 = [numero1 intValue];
    int n2 = [numero2 intValue];
    
    switch (oper) {
        case 1: // n1 > n2
            return n1 > n2;
            break;
        case 2: // n1 >= n2
            return n1 >= n2;
            break;
        case 3: // n1 < n2
            return n1 < n2;
            break;
        case 4: // n1 <= n2
            return n1 <= n2;
            break;
        case 5: // n1 == n2
            return n1 == n2;
            break;
        case 6: // n1 != n2
            return n1 != n2;
            break;
        default:
            return false;
            break;
    }
}

@end
