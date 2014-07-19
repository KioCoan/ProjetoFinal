//
//  SpriteOperadorValores.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface OperadorValoresNode : SKSpriteNode
{
    SKLabelNode *lblValor1;
    SKLabelNode *lblValor2;
}

-(id)initWithValor1:(NSString*)valor1 valor2:(NSString*)valor2;

@end
