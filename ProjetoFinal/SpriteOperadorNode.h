//
//  SpriteOperadorNode.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "OperadorNode.h"
#import "OperadorValoresNode.h"
#import "OperadorResultadoNode.h"

@interface SpriteOperadorNode : SKSpriteNode
{
    OperadorNode *nodeOperador;
    OperadorValoresNode *nodeValores;
    OperadorResultadoNode *nodeResultado;
    
    BOOL partesVisiveis;
}


@end
