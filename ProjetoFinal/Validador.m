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





@end
