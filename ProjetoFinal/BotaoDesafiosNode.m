//
//  BotaoDesafiosNode.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 18/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "BotaoDesafiosNode.h"

@implementation BotaoDesafiosNode



-(id)init{
    
    self = [super initWithImageNamed:@"check.png"];
    if (self) {
        valor = [[SKLabelNode alloc] initWithFontNamed:FONT_THIN];
        valor.fontSize = self.size.width / valor.frame.size.width + 20;
        [valor setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
        [valor setVerticalAlignmentMode:SKLabelVerticalAlignmentModeCenter];
        [self addChild:valor];
    }
    return self;
}

-(void)setValor:(NSString *)texto{
    [valor setText:texto];
    valor.fontSize = self.size.width / valor.frame.size.width + 20;
}

-(NSString*)getValor{
    return valor.text;
}



@end
