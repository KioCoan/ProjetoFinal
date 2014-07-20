//
//  SpriteOperadorResultado.h
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 18/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface OperadorResultadoNode : SKSpriteNode
{
    SKLabelNode *lblResultado;
    
    SKAction *animacaoDescer;
    SKAction *animacaoSubir;
    
    BOOL estaVisivel;
}


-(id)initWithResultado:(NSString*)resultado;
-(SKAction*)getAnimacaoSubir;
-(SKAction*)getAnimacaoDescer;
-(void)iniciarAnimacao;
@end
