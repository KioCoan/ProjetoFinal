//
//  SecaoMenuVariavel.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SecaoMenuVariavel.h"

@implementation SecaoMenuVariavel


- (id)init{
    
    self = [super init];
    
    if (self) {
        
        NSArray *tiposVariaveis = [NSArray arrayWithObjects:@"inteiro", @"real",@"caractere",@"logico",nil];
        
        self.icones = [NSMutableArray array];
        
        for (int i = 0; i < tiposVariaveis.count; i++) {
            
            IconeSecao *novo = [[IconeSecao alloc]init];
            [novo setSize:CGSizeMake(120, 120)];
            [novo setName:@"iconeSecao"];
            [novo setTipo: [tiposVariaveis objectAtIndex:i]];
            [novo setSecao:self.titulo];
            
            [self.icones addObject:novo];
            
        }
    }
    
    return nil;
}



@end
