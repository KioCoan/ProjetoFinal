//
//  SaidaDeDados.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SaidaDeDados.h"

@implementation SaidaDeDados

-(id)init{
    if (self = [super init]) {
        textoExibido = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
        [textoExibido setText:@">"];
        [textoExibido setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
        [textoExibido setPosition:CGPointMake(-50, 100)];
        SKTexture *textura = [SKTexture textureWithImageNamed:@"saida-texto.png"];
        [self setTexture:textura];
        [self setSize:CGSizeMake(346, 278)];
        [self addChild:textoExibido];
        
    }
    return self;
}


-(void)exibeTexto:(NSString*)texto{
    [textoExibido setText:[NSString stringWithFormat:@"> %@",texto]];
}
@end
