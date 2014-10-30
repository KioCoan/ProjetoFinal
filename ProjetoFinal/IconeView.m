//
//  TestandoNovo.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 27/10/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "IconeView.h"

@implementation IconeView


- (id)initWithCategoria:(NSString *)categoria tipo:(NSString *)tipo imagem:(NSString *)imagem{
    
    self = [super init];
    
    if (self) {
        self.image = [UIImage imageNamed:imagem];
        self.tipo = tipo;
        self.categoria = categoria;
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
    
    
}


@end
