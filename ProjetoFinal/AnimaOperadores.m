//
//  AnimaOperadores.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 08/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaOperadores.h"

@implementation AnimaOperadores

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SpriteOperadorNode *spriteOperador = [[SpriteOperadorNode alloc] init];
        [spriteOperador setPosition:CGPointMake(400, 400)];
        [self addChild:spriteOperador];
        
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


@end
