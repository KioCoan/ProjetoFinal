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
        [self setUserInteractionEnabled:NO];
        [self iniciarAnimacoes];
        partesVisiveis = !partesVisiveis;
    }
}


//O METODO VERIFICA QUAIS ANIMAÇÕES SERÃO EXECUTADAS CONFORME O ESTADO ATUAL DOS SPRITES
//CASO OS SPRITES ESTIVEREM VISIVEIS SERÁ ACIONADO AS ANIMAÇÕES QUE "ESCONDERAM" OS SPRITES E ASSIM POR DIANTE
-(void)iniciarAnimacoes{
    if(partesVisiveis){
        //MANDA O NODE RESULTADO INICIAR A ANIMAÇÃO DA LABEL DELE
        [nodeResultado iniciarAnimacao];
        //EXECUTA A ANIMAÇÃO DO NODE RESULTADO QUE ESCONDE O NODE
        [nodeResultado runAction:[nodeResultado getAnimacaoSubir] completion:^{
            
            //MANDA O NODE VALORES INICIAR A ANIMAÇÃO DAS LABELS DELE
            [nodeValores iniciarAnimacao];
            //EXECUTA A ANIMAÇÃO DO NODE VALORES QUE ESCONDE O NODE
            [nodeValores runAction:[nodeValores getAnimacaoDiminuir] completion:^{
                
                [self setUserInteractionEnabled:YES];
                [nodeResultado removeAllActions];
                [nodeValores removeAllActions];
            }];
        }];
    
    }else{
        //MANDA O NODE VALORES INICIAR A ANIMAÇÃO DAS LABELS DELE
        [nodeValores iniciarAnimacao];
        //EXECUTA A ANIMAÇÃO DO NODE VALORES QUE ESCONDE O NODE
        [nodeValores runAction:[nodeValores getAnimacaoExpandir] completion:^{
            
            //MANDA O NODE RESULTADO INICIAR A ANIMAÇÃO DA LABEL DELE
            [nodeResultado iniciarAnimacao];
            //EXECUTA A ANIMAÇÃO DO NODE RESULTADO QUE ESCONDE O NODE
            [nodeResultado runAction:[nodeResultado getAnimacaoDescer] completion:^{
                
                [self setUserInteractionEnabled:YES];
                [nodeResultado removeAllActions];
                [nodeValores removeAllActions];
            }];
        }];
    }
    
}

@end
