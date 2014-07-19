//
//  SpriteOperadorNode.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteOperadorNode.h"

@implementation SpriteOperadorNode

-(id)init{
    self = [super init];
    
    if(self){
        nodeResultado = [[OperadorResultadoNode alloc] initWithResultado:@"verdadeiro"];
        [self addChild:nodeResultado];
        
        nodeValores = [[OperadorValoresNode alloc] initWithValor1:@"350" valor2:@"350"];
        [nodeResultado addChild:nodeValores];
        
        nodeOperador = [[OperadorNode alloc] initWithOperador:@"=="];
        [nodeValores addChild:nodeOperador];
    }
    
    return self;
}

@end
