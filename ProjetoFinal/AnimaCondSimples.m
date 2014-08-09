//
//  AnimaCondSimples.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaCondSimples.h"


@implementation AnimaCondSimples

-(id)init{
    if(self = [super init]){
        
        [self inicializarClasse];
    }
    
    return self;
}


-(void)inicializarClasse{
    [self setBackgroundColor:[SKColor whiteColor]];
    contadorDeTeste = 0;
    [self inicializarBotaoIniciarAnimacao];
    
    condicoesNode = [[NSMutableArray alloc] init];
    
    [condicoesNode addObject:[self inicializaCondicaoNode:@"se" posicao:CGPointMake(130, 450)]];
    //[condicoesNode addObject:[self inicializaCondicaoNode:@"senaoSe" posicao:CGPointMake(130, 320)]];
    
    [self inicializarParametros];
    
}


//PERCORRE O VETOR DE SpriteCondicaoNode DEFININDO OS VALORES ALEATÓRIOS
-(void)inicializarParametros{
    for(SpriteCondicaoNode* node in condicoesNode){
        //DEFINE OS VALORES, OPERADOR E RESULTADO
        Gerador *gerador = [[Gerador alloc] init];
        
        NSString* valor1 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
        NSString* valor2 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:10]];
        NSString* operador = [gerador retornaOperadorRelacional];
        
        [node criarValores:valor1 eOperador:operador eValor2:valor2 resultado:valor1];
        [self inicializaSaidadeDados];
        
        // Teste remover depois
        
    }
}

-(void)inicializaSaidadeDados{
    console = [[SaidaDeDados alloc] init];
    [console setPosition:CGPointMake(594, 83)];
    [self addChild:console];
    //[console exibeTexto:@">"];
    
}

-(SpriteCondicaoNode*)inicializaCondicaoNode:(NSString*)tipo posicao:(CGPoint)posicao{
    
    SpriteCondicaoNode *condicaoNode = [[SpriteCondicaoNode alloc] initWithType:tipo];
    [condicaoNode setPosition:posicao];
    condicaoNode.myDelegate = self;
    [self addChild:condicaoNode];
    
    return condicaoNode;

}

-(void)inicializarBotaoIniciarAnimacao{
    botaoIniciarTeste = [SKSpriteNode spriteNodeWithImageNamed:@"atualizar-dados.png"];
    [botaoIniciarTeste setSize:CGSizeMake(40, 40)];
    [botaoIniciarTeste setPosition:CGPointMake(100, 100)];
    [botaoIniciarTeste setName:@"iniciarAnimacao"];
    
    [self addChild:botaoIniciarTeste];
}



-(SpriteLabelNode*)criarLabelComTexto:(NSString*)texto tipo:(NSString*)tipo posicao:(CGPoint)posicao{
    SpriteLabelNode *novoLabel = [[SpriteLabelNode alloc] initWithType:tipo texto:texto];
    [novoLabel setFontName:@"Helvetica"];
    [novoLabel setPosition:posicao];
    [novoLabel setFontSize:18];
    [novoLabel showTipo];
    [novoLabel setName:@"teste"];
    [novoLabel setFontColor:[SKColor blackColor]];
    [novoLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    return novoLabel;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint posicao = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:posicao];
    
    if([node.name isEqualToString:@"iniciarAnimacao"]){
        [node removeFromParent];
        
        [self iniciarAnimacaoCondicional];
    }
}


-(void)iniciarAnimacaoCondicional{
    //O CONSOLE INICIA SEM TEXTO
    [console exibeTexto:@""];
    
    //VARRE O VETOR DEFININDO AS TEXTURAS PADROES DE INÍCIO
    for(SpriteCondicaoNode *c in condicoesNode){
        [c resetarTextura];
    }
    
    //INICIA O TESTE SEMPRE DO PRIMEIRO OBJETO DO VETOR
    [[condicoesNode objectAtIndex:contadorDeTeste] iniciarTeste];
}


-(void)testeFinalizado:(BOOL)verdadeiro{
   
    
    if(!verdadeiro && contadorDeTeste < condicoesNode.count - 1){
        [[condicoesNode objectAtIndex:++contadorDeTeste] iniciarTeste];
    
    }else{
        if ([[condicoesNode objectAtIndex:contadorDeTeste] retornaVeracidade]) {
            [console exibeTexto:[[condicoesNode objectAtIndex:contadorDeTeste] retornaTextoASerExibido]];
        }
        
        [self addChild:botaoIniciarTeste];
        contadorDeTeste = 0;
    }
    
}


@end
