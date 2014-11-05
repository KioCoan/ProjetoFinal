//
//  Validador.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 26/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Validador.h"

@implementation Validador


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


- (BOOL)tabelaAscii:(NSString *)string tamanho:(NSInteger)tamanhoString{
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    char caractere = [string characterAtIndex:0];
    int indice = (int) caractere;
    
    if (indice == 8 || ((indice == 46) && tamanhoString > 0) || ((indice >= 48) && (indice <= 57)) || ((indice >= 65) && (indice <= 90)) || ((indice >= 97) && (indice <= 122))) {
        return YES;
    }
    return NO;
}



@end
