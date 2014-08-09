//
//  AnimaCondSimples.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaCondSimples.h"


@implementation AnimaCondSimples

-(id)initWithCondicao:(NSString*)condicao{
    if(self = [super init]){
        
        NSArray *condicoes;
        
        //É VERIFICADO COMO SERÁ A ESTRUTURA DA CONDICIONAL
        //PARA QUE SEJA CRIADO UM VETOR COM OS OBJETOS NECESSÁRIOS PARA ESTA ESTRUTUA
        if([condicao isEqualToString:@"SE"]){
            condicoes = [NSArray arrayWithObjects:@"se", nil];
            
        }else if([condicao isEqualToString:@"SE-SENAO"]){
            condicoes = [NSArray arrayWithObjects:@"se", @"senao", nil];
        
        }else if([condicao isEqualToString:@"SE-SENAOSE"]){
            condicoes = [NSArray arrayWithObjects:@"se", @"senaoSe", nil];
        
        }else if([condicao isEqualToString:@"SE-SENAOSE-SENAO"]){
            condicoes = [NSArray arrayWithObjects:@"se", @"senaoSe", @"senao", nil];
            
        }
        
        [self inicializarClasseComCondicoes :condicoes];
        [self inicializaSaidadeDados];
    }
    
    return self;
}


-(void)inicializarClasseComCondicoes:(NSArray*)condicoes{
    [self setBackgroundColor:[SKColor whiteColor]];
    contadorDeTeste = 0;
    [self inicializarBotaoIniciarAnimacao];
    
    [self inicializaCondicoes:condicoes];
    
    
    [self inicializarParametros];
    
}


-(void)inicializaCondicoes:(NSArray*)condicoes{
    //PRIMEIRAMENTE VERIFICA SE O ARRAY EXISTE
    if(!condicoes){
        return;
    }
    
    condicoesNode = [[NSMutableArray alloc] init];
    NSString *tipoCondicao;
    CGPoint posicao = CGPointMake(180, 550);
    
    //O LAÇO PERCORRE INSERINDO UMA NOVA CONDIÇÃO NO VETOR CONFORME O TAMANHO DO VETOR PASSADO POR PARAMETRO
    for(int i=0; i<condicoes.count; i++){
        tipoCondicao = [condicoes objectAtIndex:i];

        SpriteCondicaoNode *node = [self inicializaCondicaoNode:tipoCondicao];
        
        if(i == 2){
            posicao.y -= node.size.height / 1.2;
        
        }else{
            posicao.y -= node.size.height / 1.6;
        }
            
        
        [node setPosition:posicao];
        [condicoesNode addObject:node];
        
        
        
    }
}


//PERCORRE O VETOR DE SpriteCondicaoNode DEFININDO OS VALORES ALEATÓRIOS
-(void)inicializarParametros{
    for(SpriteCondicaoNode* node in condicoesNode){
        //DEFINE OS VALORES, OPERADOR E RESULTADO
        Gerador *gerador = [[Gerador alloc] init];
        
        NSString* valor1 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:20]];
        NSString* valor2 = [NSString stringWithFormat:@"%d",[gerador retornaInteiro:0 ate:20]];
        NSString* operador = [gerador retornaOperadorRelacional];
        
        [node criarValores:valor1 eOperador:operador eValor2:valor2 resultado:valor1];
        
        
    }
}

-(void)inicializaSaidadeDados{
    console = [[SaidaDeDados alloc] init];
    [console setPosition:CGPointMake(594, 83)];
    [self addChild:console];
    //[console exibeTexto:@">"];
    
}

-(SpriteCondicaoNode*)inicializaCondicaoNode:(NSString*)tipo{
    
    SpriteCondicaoNode *condicaoNode = [[SpriteCondicaoNode alloc] initWithType:tipo];
    condicaoNode.myDelegate = self;
    
    [self addChild:condicaoNode];
    
    
    
    return condicaoNode;

}

-(void)inicializarBotaoIniciarAnimacao{
    botaoIniciarTeste = [SKSpriteNode spriteNodeWithImageNamed:@"atualizar-dados.png"];
    [botaoIniciarTeste setSize:CGSizeMake(50, 50)];
    [botaoIniciarTeste setPosition:CGPointMake(600, 400)];
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
   
    //CASO O TESTE NÃO TENHA ENCONTRADO UMA CONDIÇAO VERDADEIRA E AINDA NÃO TENHA CHEGADO AO FIM DO VETOR
    if(!verdadeiro && contadorDeTeste < condicoesNode.count - 1){
        //É INICIADO O TESTE DO PRÓXIMO OBJETO NO VETOR DE CONDIÇÕES
        [[condicoesNode objectAtIndex:++contadorDeTeste] iniciarTeste];
    
    }else{
        //CASO TENHA TERMINADO OS TESTES, SE O ULTIMO OBJETO TESTADO SEJA VERDADEIRO
        if ([[condicoesNode objectAtIndex:contadorDeTeste] retornaVeracidade]) {
            //É INSERIDO NO CONSOLE O TEXTO DO BLOCO DE CÓDIGO DESTA CONDIÇÃO VERDADEIRA
            [console exibeTexto:[[condicoesNode objectAtIndex:contadorDeTeste] retornaTextoASerExibido]];
        }
        
        //BOTÃO DE INICIAR OS TESTE APARECE NA TELA
        [self addChild:botaoIniciarTeste];
        
        //CONTADOR QUE CONTROLA AS CONDIÇOES TESTADAS É ZERADO
        contadorDeTeste = 0;
    }
    
}


@end
