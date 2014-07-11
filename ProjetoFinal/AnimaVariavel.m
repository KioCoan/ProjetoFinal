//
//  AnimaVariavel.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 04/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaVariavel.h"

@implementation AnimaVariavel

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.caixa = [[SpriteCaixaNode alloc] initWithConteudo:@"\"Hello World\"" Nome:@"Mensagem" Tipo:@"String" tamanho:CGSizeMake(250, 267)];
        [[self caixa] setPosition:CGPointMake(400, 400)];
        [[self caixa] setName:@"caixa"];
        [self addChild:self.caixa];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
