//
//  SpriteAtualizarNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 10/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteAtualizarNode.h"

@implementation SpriteAtualizarNode

-(id)init{
    if(self = [super init]){
        [self setTexture:[SKTexture textureWithImageNamed:@"atualizar-dados.png"]];
        [self setName:@"atualizar"];
        [self setSize:CGSizeMake(80, 80)];
        [self setPosition:CGPointMake(384, 300)];
        
        
        simboloAtualizar = [[SKSpriteNode alloc] initWithImageNamed:@"simbolo-atualizar.png"];
        [simboloAtualizar setName:@"atualizar"];
        [self setSimboAtualizarSize];
        
        [self addChild:simboloAtualizar];
        
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //SPRITE QUE ATUALIZAR OS VALORES INICIA UMA ANIMAÇÃO DE ROTAÇÃO
    SKAction *rotation = [SKAction rotateByAngle: -M_PI duration:0.2];
    [simboloAtualizar runAction:rotation];
    [self runAction:[SKAction playSoundFileNamed:@"refresh2.mp3" waitForCompletion:NO]];
    
    //AVISA AO DELEGATE QUE O BOTÃO ATUALIZAR FOI CLICADO
    [self.myDelegate botaoAtualizarClicado];
}

-(void)setSimboAtualizarSize{
    [simboloAtualizar setSize:CGSizeMake(self.size.width / 1.2 , self.size.height / 1.6)];
}

-(void)setSize:(CGSize)size{
    [super setSize:size];
    
    [self setSimboAtualizarSize];
}

@end
