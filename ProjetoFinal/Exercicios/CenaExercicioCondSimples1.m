//
//  CenaExercicioCondSimples1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 21/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioCondSimples1.h"

@implementation CenaExercicioCondSimples1


- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        [self enunciado];
    }
    return self;
    
    
}

- (void)enunciado{
    
    CGPoint posicaoInicial = CGPointMake(self.frame.size.width * 200, self.frame.size.height * 700);
    CGPoint posicaoMutavel = posicaoInicial;
    
         NSArray *textos = [NSArray arrayWithObjects:@"Assinale a alternativa \n correta",
                            @"Qual sera a saida da instrução a seguir:",
                            @"n <- ?",
                            @"se( n < 3){",
                            @"escreva (vou ao parque);",
                            @"}senao se ( n < 6){",
                            @"escreva (vou para o cinema);",
                            @"}senao{",
                            @"escreva(ficarei em casa);",
                            @"}",
                            nil];
    
    
    
    for (int i = 0; i < textos.count; i++) {
        SKLabelNode *lblEnunciado = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        [lblEnunciado setText:[textos objectAtIndex:i]];
        lblEnunciado.position = posicaoMutavel;
        lblEnunciado.fontSize = 20;
        //[enunciado addObject:lblEnunciado];
        [self addChild:lblEnunciado];
        posicaoMutavel.y -= lblEnunciado.fontSize * 1.3;
        
    }

    
    
    
    
    
    
        
    
    
    
    
    
    
   
    
    
    
    
}

@end
