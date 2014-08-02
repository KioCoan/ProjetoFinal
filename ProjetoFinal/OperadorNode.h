//
//  SpriteOperador.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface OperadorNode : SKSpriteNode
{
    SKLabelNode *lblOperador;
}

-(id)initWithOperador:(NSString*)operador;
-(void)setLabelOperador:(NSString*)operador;
-(NSString*)getOperador;
-(void)iniciarAnimacaoDiminuir;
-(void)iniciarAnimacaoExpandir;
@end
