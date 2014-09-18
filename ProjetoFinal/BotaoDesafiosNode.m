//
//  BotaoDesafiosNode.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "BotaoDesafiosNode.h"

@implementation BotaoDesafiosNode


-(instancetype)initWithImageNamed:(NSString *)name{
    
    self = [super initWithImageNamed:name];
    if (self) {
        valor = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        [valor setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        [valor setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [valor setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [self addChild:valor];
    }
    return self;
}

-(void)setValor:(NSString *)texto{
    [valor setText:texto];  
}
@end
