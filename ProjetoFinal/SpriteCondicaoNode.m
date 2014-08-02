//
//  SpriteCondicaoNode.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 25/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "SpriteCondicaoNode.h"

static const  uint32_t bolinhaCatergory = 0x1 << 0;
static const  uint32_t condicaoCatergory = 0x1 << 1;


static const int NUM_TEXTURAS = 14;

@implementation SpriteCondicaoNode

-(id)init{
    self = [super init];
    
    if(self){
        [self inicializarClasse];
    }
    
    return self;
}


-(void)inicializarClasse{
    [self setTexture:[SKTexture textureWithImageNamed:@"estrutura-condicionais1.png"]];
    [self setSize:CGSizeMake(190, 494)];
    [self inicializarFundosCondicoes];
}

-(void)inicializarFundosCondicoes{
    int numCondicoes = 2;
    CGPoint posicoes = CGPointMake(135, 160);
    
    for(int i=0; i<numCondicoes; i++){
        SKSpriteNode *fundoCondicao = [[SKSpriteNode alloc] initWithImageNamed:@"modo-condicao.png"];
        [fundoCondicao setSize:CGSizeMake(190, 133)];
        [fundoCondicao setPosition:posicoes];
        [self addChild:fundoCondicao];
        
        posicoes.y -= 180;
    }
    
}


-(void)criarCondicaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2{
    condicaoSe = [self criarNovaCondicao:valor1 operador:operador valor2:valor2 :CGPointMake(135, 145)];
}


-(void)criarCondicaoSenaoSe:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2{
    condicaoSenaoSe = [self criarNovaCondicao:valor1 operador:operador valor2:valor2 :CGPointMake(135, -34)];
}

-(SpriteOperadorNode*)criarNovaCondicao:(NSString*)valor1 operador:(NSString*)operador valor2:(NSString*)valor2 :(CGPoint)posicao{
    SpriteOperadorNode *novo = [[SpriteOperadorNode alloc] initWithValor1:valor1 operador:operador valor2:valor2 resultado:@""];
    [novo ativarModoCondicao];
    [novo setPosition:posicao];
    [novo iniciarAnimacaoAbrir];
    
    [self addChild:novo];
    return novo;
}

-(SKPhysicsBody*)getCorpoCondicao{
    SKPhysicsBody *corpo = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(200, 190)];
    [corpo  setCategoryBitMask:condicaoCatergory];
    [corpo setContactTestBitMask:bolinhaCatergory];
    [corpo setDynamic:NO];
    
    return corpo;
}


-(void)iniciarAnimacao{
    NSMutableArray *texturas = [[NSMutableArray alloc] init];
    
    for(int i=1; i<=NUM_TEXTURAS; i++){
        [texturas addObject:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"estrutura-condicionais%d.png", i]]];
    }
    
    SKAction *animacao = [SKAction animateWithTextures:texturas timePerFrame:0.06];
    
    
    [self runAction:[SKAction waitForDuration:1] completion:^{
        [self runAction:animacao completion:^{
            [self removeAllActions];
        }];
    }];
}


-(void)resetarDefinicoes{
    [condicaoSe setPhysicsBody:[self getCorpoCondicao]];
    [condicaoSenaoSe setPhysicsBody:[self getCorpoCondicao]];
    [self setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"estrutura-condicionais%d.png", NUM_TEXTURAS]]];
}

-(void)iniciarTeste{
    [self resetarDefinicoes];
    
    bolinha = [[SKSpriteNode alloc] initWithImageNamed:@"atualizar-dados.png"];
    [bolinha setSize:CGSizeMake(40, 40)];
    [bolinha setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:bolinha.size.width / 2]];
    
    [bolinha setPosition:CGPointMake(50, 500)];
    [[bolinha physicsBody] setDynamic:YES];
    
    [self addChild:bolinha];
}

-(void)encerrarTeste{
    [bolinha runAction:[SKAction waitForDuration:0.91] completion:^{
        [self setTexture:[SKTexture textureWithImageNamed:[NSString stringWithFormat:@"%@-verde.png", condicaoCorreta]]];
        [bolinha removeFromParent];
        bolinha = nil;
    }];
    
}

-(void)removerCorpoSe{
    [condicaoSe setPhysicsBody:nil];
}


-(NSString*)getCondicaoCorreta{
    if(!condicaoSe || !condicaoSenaoSe){
        @throw [NSException exceptionWithName:@"Condição não criada" reason:@"Crie todas as condições." userInfo:nil];
    }
    
    if([self validarCondicao:condicaoSe]){
        condicaoCorreta = @"se";
    
    }else if([self validarCondicao:condicaoSenaoSe]){
        condicaoCorreta = @"senaoSe";
        
    }else{
        condicaoCorreta = @"senao";
    }
    
    return condicaoCorreta;
}

-(BOOL)validarCondicao:(SpriteOperadorNode*)condicao{
    Calculador *calculador = [[Calculador alloc] init];
    NSString *valor1 = [condicao getValor1];
    NSString *operador = [condicao getOperador];
    NSString *valor2 = [condicao getValor2];
    
    NSString *resultado = [calculador calculaOperador:operador numero1:valor1 numero2:valor2];
    
    if([resultado isEqualToString:@"Verdadeiro"]){
        return YES;
    }
    
    return NO;
}

@end
