//
//  AnimaCondSimples.h
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SpriteCondicaoNode.h"
#import "SpriteLabelNode.h"

@interface AnimaCondSimples : SKScene <UITextFieldDelegate>
{
    SpriteLabelNode *nota1;
    SpriteLabelNode *nota2;
    SpriteLabelNode *media;
    
    NSMutableArray *pontos;
}

@end
