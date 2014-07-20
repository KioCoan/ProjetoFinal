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
        
        [self setUserInteractionEnabled:YES];
        partesVisiveis = NO;
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:position];
    
    if([node.name isEqualToString:@"operador"]){
        [self iniciarAnimacoes];
    }
}


-(void)iniciarAnimacoes{
    
    if(partesVisiveis){
        [nodeResultado iniciarAnimacao];
        [nodeResultado runAction:[nodeResultado getAnimacaoSubir] completion:^{
            [nodeValores iniciarAnimacao];
            
            [nodeValores runAction:[nodeValores getAnimacaoDiminuir] completion:^{
                [nodeResultado removeAllActions];
                [nodeValores removeAllActions];
            }];
        }];
    
    }else{
        [nodeValores iniciarAnimacao];
        [nodeValores runAction:[nodeValores getAnimacaoExpandir] completion:^{
            [nodeResultado iniciarAnimacao];
            
            [nodeResultado runAction:[nodeResultado getAnimacaoDescer] completion:^{
                [nodeResultado removeAllActions];
                [nodeValores removeAllActions];
            }];
        }];
    }
    
    partesVisiveis = !partesVisiveis;
}

@end
