//
//  Aritimetico.m
//  Calculador
//
//  Created by Rafael Aparecido de Freitas on 03/07/14.
//  Copyright (c) 2014 Rafael Aparecido de Freitas. All rights reserved.
//

#import "Aritimetico.h"

@implementation Aritimetico

// Métodos dos operadores aritiméticos
-(NSString*)soma:(float)n1 n2:(float)n2{
    
    NSString *soma;
    if (((floorf(n1)) == n1) && ((floorf(n2)) == n2)) {
        // Caso  os dois sejam inteiros
        
        soma = [NSString stringWithFormat:@"%d",((int)n1) + ((int)n2)];
        
        
        
    }else if(((floorf(n1)) != n1) && ((floorf(n2)) == n2)) {
        // Caso n1 float e n2 Inteiro
        
        soma = [NSString stringWithFormat:@"%f",(n1) + ((int)n2)];
        
    }else if(((floorf(n1)) == n1) && ((floorf(n2)) != n2)){
        // Caso n1 inteiro e n2 Float
        
        soma = [NSString stringWithFormat:@"%f",((int)n1) + (n2)];
    }else{
        // Caso os dois sejam float
        soma = [NSString stringWithFormat:@"%f",n1 + n2];
    }
    
    return soma;
}

-(NSString*)subtrai:(float)n1 n2:(float)n2{
    
    NSString *subtracao;
    if (((floorf(n1)) == n1) && ((floorf(n2)) == n2)) {
        // Caso  os dois sejam inteiros
        
        subtracao = [NSString stringWithFormat:@"%d",((int)n1) - ((int)n2)];
        
        
    }else if(((floorf(n1)) != n1) && ((floorf(n2)) == n2)) {
        // Caso n1 float e n2 Inteiro
        
        subtracao = [NSString stringWithFormat:@"%f",(n1) - ((int)n2)];
        
    }else if(((floorf(n1)) == n1) && ((floorf(n2)) != n2)){
        // Caso n1 inteiro e n2 Float
        
        subtracao = [NSString stringWithFormat:@"%f",((int)n1) - (n2)];
    }else{
        // Caso os dois sejam float
        subtracao = [NSString stringWithFormat:@"%f",n1 - n2];
    }
    
    return subtracao;
}

-(NSString*)multiplica:(float)n1 n2:(float)n2{
    
    NSString *multiplicacao;
    if (((floorf(n1)) == n1) && ((floorf(n2)) == n2)) {
        // Caso  os dois sejam inteiros
        
        multiplicacao = [NSString stringWithFormat:@"%d",((int)n1) * ((int)n2)];
        
        
    }else if(((floorf(n1)) != n1) && ((floorf(n2)) == n2)) {
        // Caso n1 float e n2 Inteiro
        
        multiplicacao = [NSString stringWithFormat:@"%f",(n1) * ((int)n2)];
        
    }else if(((floorf(n1)) == n1) && ((floorf(n2)) != n2)){
        // Caso n1 inteiro e n2 Float
        
        multiplicacao = [NSString stringWithFormat:@"%f",((int)n1) * (n2)];
    }else{
        // Caso os dois sejam float
        multiplicacao = [NSString stringWithFormat:@"%f",n1 * n2];
    }
    
    return multiplicacao;
}

-(NSString*)divide:(float)n1 n2:(float)n2{
    
    NSString *divisao;
    if (((floorf(n1)) == n1) && ((floorf(n2)) == n2)) {
        // Caso  os dois sejam inteiros
        if ((int)n2 == 0) {
            divisao = @"0";
        }else{
            divisao = [NSString stringWithFormat:@"%d",((int)n1) / ((int)n2)];
        }
        
    }else if(((floorf(n1)) != n1) && ((floorf(n2)) == n2)) {
        // Caso n1 float e n2 Inteiro
        
        divisao = [NSString stringWithFormat:@"%f",(n1) / ((int)n2)];
        
    }else if(((floorf(n1)) == n1) && ((floorf(n2)) != n2)){
        // Caso n1 inteiro e n2 Float
        
        divisao = [NSString stringWithFormat:@"%f",((int)n1) / (n2)];
    }else{
        // Caso os dois sejam float
        divisao = [NSString stringWithFormat:@"%f",n1 / n2];
    }
    
    return divisao;
}


@end
