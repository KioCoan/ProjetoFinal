//
//  AnimaVariavel.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 04/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>
#import "Animacao.h"
#import "SpriteCaixaNode.h"

@interface AnimaVariavel : Animacao <SpriteCaixaNodeDelegate>
{
    NSMutableArray *spritesCaixa;
    CGSize tamanhoCaixa;
    int enderecoCaixa;
}



@end
