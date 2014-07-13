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
        
        
        
        //COLOQUEI UM CORPO PARA AS LABELS MAS AINDA ESTA RUIM DE MOVER ELAS
        CGSize tamanhoCorpo = CGSizeMake(self.frame.size.width, self.frame.size.height);
        tamanhoCorpo.width *= 2;
        tamanhoCorpo.height *= 2;
        
        [self setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:tamanhoCorpo]];
        self.physicsBody.dynamic = NO;
        
    }
    
    
    
    return self;
    
}




@end
