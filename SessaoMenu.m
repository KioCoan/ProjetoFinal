//
//  SecaoMenu.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 16/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SessaoMenu.h"

@implementation SessaoMenu





- (id)init{
    
    self = [super init];
    
    
    if  (self){
        
        [self setUserInteractionEnabled:YES];
        
        
    }
    return self;
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.myDelegate sessaoAtivada:self.titulo infoIcones:self.tiposIcones];

}

- (int)retornaNumeroIcones{
    
    return self.tiposIcones.count;
    
}

- (NSMutableArray *)retornaInfoIcones{
    
    return self.tiposIcones;
    
}


- (NSDictionary *)retornaDictionaryPorIndice:(int)indice{
    
    return [self.tiposIcones objectAtIndex:indice];
    
}


@end
