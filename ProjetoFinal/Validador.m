//
//  Validador.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 26/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Validador.h"

@implementation Validador


- (id)init{
    
    self = [super init];
    
    if (self) {
        self.dictNumerico = @{
                              @"inicio": [NSNumber numberWithInt:48],
                              @"fim": [NSNumber numberWithInt:57]};
        
        
        self.dictLetrasMaiuscula = @{
                              @"inicio": [NSNumber numberWithInt:65],
                              @"fim": [NSNumber numberWithInt:90]};
        
        self.dictLetrasMinuscula = @{
                                     @"inicio": [NSNumber numberWithInt:97],
                                     @"fim": [NSNumber numberWithInt:122]};
        
        
        
    }
    
    
    return self;
    
}

- (int)transformaStringParaAscii:(NSString *)string{
    
    char caractere = [string characterAtIndex:0];
    return (int) caractere;
    
}

- (BOOL)validaDados:(int)tipo string:(NSString *)string texto:(NSString *)texto{
    
    
    if ([self isCaracterNulo:string]) {
        return YES;
    }
    
    switch (tipo) {
        case 1:
            
            return [self alfaNumerico:string texto:texto];
            
            
            break;
            
        default:
            return NO;
    }
    
    
    
}

- (BOOL)alfaNumerico :(NSString *)string texto:(NSString *)texto{
    
    
    
    [self isCaracterNulo:string];
    
    int indice = [self transformaStringParaAscii:string];
    
    if ([self naoIniciaComNumero:indice texto:texto]) {
        return YES;
    }else if ([self isLetraMaiuscula:indice]){
        return YES;
    }else if ([self isLetraMinuscula:indice]){
        return YES;
    }
    
    return NO;
}

- (BOOL) naoIniciaComNumero : (int)indice texto:(NSString *)texto{
    
    if (texto.length < 1) {
        return NO;
    }
    
    return [self isNumerico:indice];
}

- (BOOL)isNumerico:(int)indice{
    
    if (indice >= 48 && indice <= 57) {
        return YES;
    }else{
        return NO;
    }
    
}

- (BOOL)isLetraMaiuscula: (int)indice{
    
    if (indice >= 65 && indice <= 90) {
        return YES;
    }else{
        return NO;
    }

}

- (BOOL)isLetraMinuscula: (int)indice{
    
    
    if (indice >= 97 && indice <= 122) {
        return YES;
    }else{
        return NO;
    }

}

- (BOOL)isCaracterNulo:(NSString *)string{
    
    if ([string isEqualToString:@""]) {
        return YES;
    }else{
        return NO;
    }
    
}

- (BOOL)isPonto:(int)indice texto:(NSString *)texto{
    
    if (indice == 46 && texto.length  > 0) {
        
        return [self quantPontos:texto];
        
    }else{
        return NO;
    }
    
}

- (BOOL)quantPontos:(NSString *)texto{
    
    int contador = 0;
    
    for (int i = 0; i < texto.length;i++) {
        
        int caractere = (int) [texto characterAtIndex:i];
        
        if (caractere == 46) {
            contador++;
        }
        
    }
    if (contador > 0) {
        return NO;
    }else{
        return YES;
    }
}

- (NSString *)removeTodoEspaco:(NSString *)string{
    
    NSString *nova = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ( [nova isEqualToString:@""]) {
        return nil;
    }
    
    
    return nova;
}

- (NSString *)removeEspacoDasPontas:(NSString *)string{
    
    
    NSString *nova = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([nova isEqualToString:@""]) {
        return nil;
    }
    
    return nova;
}

@end
