//
//  Relacional.m
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import "Relacional.h"

@implementation Relacional


-(NSString*)calcularComOperadorNome:(int)operacao eNumero1:(float)n1 eNumero2:(float)n2{
    NSString *resultado;
    
    switch (operacao) {
               case 1:
               if (n1>n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
           case 2: // Maior ou igual
               if (n1>=n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
           case 3: // Menor
               if (n1<n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
           case 4: // Menor ou igual
               if (n1<=n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
           case 5: // Igual
               if (n1==n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
           case 6: // Diferente
               if (n1!=n2) {
                   resultado = @"Verdadeiro";
               }else{
                   resultado = @"Falso";
               }
               break;
        default:
            return nil;
            break;
    }
    return resultado;
}

@end
