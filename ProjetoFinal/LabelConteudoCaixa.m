//
//  Conteudo.m
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 08/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import "LabelConteudoCaixa.h"


@implementation LabelConteudoCaixa

- (id)initWithType:(NSString *)tipo texto:(NSString *)texto{
    
    
    self = [super init];
    
    if (self) {
        [self setTipo:tipo];
        [self setText:texto];
        [self setName:@"conteudo"];
        [self setFontName:@"Chalkduster"];
        
        
        
    }
    
    
    
    return self;
    
}




@end
