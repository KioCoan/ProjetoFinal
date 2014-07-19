//
//  SpriteOperadorResultado.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "OperadorResultadoNode.h"

@implementation OperadorResultadoNode

-(id)initWithResultado:(NSString*)resultado{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-resultado.png"]];
        
        [self setSize:CGSizeMake(265, 98)];
        [self inicializaLabelResultado:resultado];
    }
    
    return self;
}

-(id)init{
    
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-resultado.png"]];
    }
    
    return self;
}

-(void)inicializaLabelResultado:(NSString*)resultado{
    lblResultado = [SKLabelNode labelNodeWithFontNamed:@"Avenir Next Condensed Medium"];
    [lblResultado setText:resultado];
    [lblResultado setFontSize:50];
    [lblResultado setFontColor:[SKColor whiteColor]];
    [lblResultado setPosition:CGPointMake(0, self.frame.size.height * -0.3)];
    [lblResultado setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    
    [self addChild:lblResultado];
}

@end
