//
//  SpriteOperador.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "OperadorNode.h"

@implementation OperadorNode

-(id)initWithOperador:(NSString*)operador{
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-operador.png"]];
        [self setSize:CGSizeMake(139, 139)];
        [self inicializarLabelOperador:operador];
    }
    
    return self;
}

-(id)init{
    
    self = [super init];
    
    if(self){
        [self setTexture:[SKTexture textureWithImageNamed:@"parte-operador.png"]];
    }
    
    return self;
}


-(void)inicializarLabelOperador:(NSString*)operador{
    lblOperador = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    [lblOperador setText:operador];
    [lblOperador setFontSize:80];
    [lblOperador setFontColor:[SKColor whiteColor]];
    [lblOperador setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblOperador setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
    
    [self addChild:lblOperador];
}

@end
