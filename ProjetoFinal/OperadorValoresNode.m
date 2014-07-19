//
//  SpriteOperadorValores.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "OperadorValoresNode.h"

@implementation OperadorValoresNode

-(id)initWithValor1:(NSString*)valor1 valor2:(NSString*)valor2{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-valores.png"]];
        [self setSize:CGSizeMake(380, 95)];
        [self setPosition:CGPointMake(0, 80)];
        [self inicializaLabelsValores:valor1 :valor2];
    }
    
    return self;
}

-(id)init{
    
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-valores.png"]];
    }
    
    return self;
}

-(void)inicializaLabelsValores:(NSString*)valor1 :(NSString*)valor2{
    lblValor1 = [SKLabelNode labelNodeWithFontNamed:@"Avenir Next Condensed Medium"];
    [lblValor1 setText:valor1];
    [lblValor1 setFontSize:38];
    [lblValor1 setFontColor:[SKColor blackColor]];
    [lblValor1 setPosition:CGPointMake(-130, 0)];
    [lblValor1 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblValor1 setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
    
    
    lblValor2 = [SKLabelNode labelNodeWithFontNamed:@"Avenir Next Condensed Medium"];
    [lblValor2 setText:valor2];
    [lblValor2 setFontSize:38];
    [lblValor2 setFontColor:[SKColor blackColor]];
    [lblValor2 setPosition:CGPointMake(130, 0)];
    [lblValor2 setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblValor2 setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
    
    
    [self addChild:lblValor1];
    [self addChild:lblValor2];
}

@end
