//
//  Geral.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 17/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Geral.h"

@implementation Geral


-(id)calculaOperador:(NSString*)operacao numero1:(NSString*)numero1 numero2:(NSString*)numero2{
    
    int oper;
    int n1 = [numero1 intValue];
    int n2 = [numero2 intValue];
    BOOL v1;
    BOOL v2;
    
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
    
    
       
    return nil;
}
@end
