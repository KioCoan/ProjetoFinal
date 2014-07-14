//
//  Conteudo.m
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 08/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import "ConteudoCaixaNode.h"


@implementation ConteudoCaixaNode

- (id)initWithType:(NSString *)tipo texto:(NSString *)texto{
    
    
    self = [super init];
    
    if (self) {
        
        [self setLblConteudo:[[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"]];
        [[self lblConteudo] setText:texto];
        
        [[self lblConteudo] setFontColor:[SKColor whiteColor]];
        
        [self addChild:self.lblConteudo];
        
        [self setTipo:tipo];
        [self setName:@"conteudo"];
        
        
        
        CGSize tamanhoNode = CGSizeMake(self.lblConteudo.frame.size.width, self.lblConteudo.frame.size.height);
        tamanhoNode.width *= 1.5;
        tamanhoNode.height *= 1.5;
        
        [self setSize:tamanhoNode];
        
    }
    
    
    
    return self;
    
}


-(NSString*)getText{
    return self.lblConteudo.text;
}


@end
