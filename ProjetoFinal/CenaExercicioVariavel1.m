//
//  MyScene.m
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 07/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import "CenaExercicioVariavel1.h"

@implementation CenaExercicioVariavel1



-(id)init{
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        codigo = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
        codigo.position = CGPointMake(50, 100);
        [codigo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
        //codigo.text = @"teste";
        
        [self addChild:codigo];
        
        [self criaEnunciado];
        [self criarCaixas];
        [self criarLabels];
        _corretos = 0;
        
    }
    return self;
}


- (void)criaEnunciado{
    
    SKLabelNode *enunciado1 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
    SKLabelNode *enunciado2 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];

    
    CGPoint posicao = CGPointMake(400, 850);
    CGPoint posicao2 = posicao;
    posicao2.y -= enunciado1.fontSize * 1.2 ;
    
    NSString *texto1 = @"Arraste cada conteudo para";
    NSString *texto2 = @"dentro da variável adequada";
    
    [enunciado1 setText:texto1];
    [enunciado2 setText:texto2];
    [enunciado1 setPosition:posicao];
    [enunciado2 setPosition:posicao2];
    
    [self addChild:enunciado1];
    [self addChild:enunciado2];
    
}

- (void)criarLabels{
    
    // criando vetor e labels
    NSMutableArray *conteudos = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++) {
        SpriteLabelNode *conteudo = [[SpriteLabelNode alloc]init];
        conteudo.name = @"conteudo";
        [self configuraLabel:conteudo indice:i];
        [conteudos addObject:conteudo];
    }
    
    
    

    //embaralhando labels
    conteudos = [self embaralha:conteudos];
    
    // criando e inserindo posicoes
    
    CGPoint posicaoOriginal = CGPointMake(650,  650);
    CGPoint posicao = posicaoOriginal;
    int font =  30;
    
    for (int i = 0; i < conteudos.count; i++) {
        
        [[conteudos objectAtIndex:i] setFontSize:font];
        
        [[conteudos objectAtIndex:i] setPosition:posicao];
        [[conteudos objectAtIndex:i] setPosicaoInicial:posicao];
        
        
        posicao.y -= (font * 5) ;
        
        [self addChild:[conteudos objectAtIndex:i]];
        
    }
    
    
}

- (void)configuraLabel:(SpriteLabelNode *)label indice :(int)indice{
    
    
    Gerador *gerador = [[Gerador alloc]init];
    
    
    
    switch (indice) {
        case 0:
            label.tipo = @"inteiro";
            label.text = [gerador retornaValorInteiro:1 ate:50];
            break;
        case 1:
            label.tipo = @"real";
            label.text = [gerador retornaValorFloat:1 ate:200];
            break;
        case 2:
            label.tipo = @"caractere";
            label.text = [gerador retornaValorCaractere];
            break;
        case 3:
            label.tipo = @"logico";
            label.text = [gerador retornaValorLogico];
            break;
            
            
        default:
            break;
    }
    
    
}

- (NSMutableArray *)embaralha :(NSMutableArray *)antigo{
    
    //EMBARALHA OS ITENS DE UM VETOR
    
    int n;
    NSMutableArray *vetorEmbaralhado = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n = arc4random() % antigo.count;
        
        [vetorEmbaralhado addObject:[antigo objectAtIndex:n]];
        [antigo removeObjectAtIndex:n];
    }
    
    
    
    
    return vetorEmbaralhado;
    
    
    
}

- (void)configuraCaixa:(SpriteCaixaNode*)caixa indice:(int)indice{
    
    Gerador *gerador = [[Gerador alloc]init];
    
    switch (indice) {
            
            //CAIXA DO TIPO INTEIRO
        case 0:
            [caixa setLabelTipo:@"inteiro"];
            [caixa setLabelNome:[gerador retornaNomeVariavel:[caixa retornaTipo]]];
            
            break;
            
        case 1:
            [caixa setLabelTipo:@"real"];
            [caixa setLabelNome:[gerador retornaNomeVariavel:[caixa retornaTipo]]];
            
            break;
            
        case 2:
            [caixa setLabelTipo:@"caractere"];
            [caixa setLabelNome:[gerador retornaNomeVariavel:[caixa retornaTipo]]];
            
            break;
            
        case 3:
            [caixa setLabelTipo:@"logico"];
            [caixa setLabelNome:[gerador retornaNomeVariavel:[caixa retornaTipo]]];
            
            break;
            
        default:
            break;
    }
    
    [caixa setLabelEndereco:indice+1];
    
    
}

- (void)criarCaixas{
    
    // Criar as caixas
    vetorCaixas = [NSMutableArray array];
    CGSize tamanho = CGSizeMake( 290,  320);
    //CGSize tamanho = CGSizeMake(200, 213.6);
    
    for (int i = 0; i < 4; i++) {
        SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc]init];
        [self configuraCaixa:caixa indice:i];
        caixa.size = tamanho;
        [vetorCaixas addObject:caixa];
    }
    
    
    //embaralha ordem das caixas
    vetorCaixas = [self embaralha:vetorCaixas];
    
    //criando e inserindo posicoes
    
    CGPoint primeiraPosicao = CGPointMake( 200.0,  630.0);
    CGPoint posicao = primeiraPosicao;
    
    for (int i = 0; i < vetorCaixas.count; i++) {
        
        // caixas do lado direito
        if (i == 2) {
            
            posicao = primeiraPosicao;
            posicao.x += tamanho.width * 1.0;
            [[vetorCaixas objectAtIndex:i] setPosition:posicao];
            posicao.y -= tamanho.height * 1.15;
            
            
            
        }else{
            [[vetorCaixas objectAtIndex:i] setPosition:posicao];
            posicao.y -= tamanho.height * 1.15;
            
        }
        
        // inserindo nó
        [self addChild:[vetorCaixas objectAtIndex:i]];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];

    if([node.name isEqualToString:@"conteudo"]){
        conteudoAtivo = (SpriteLabelNode *) [self nodeAtPoint:location];
    }
    
    
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    if ([conteudoAtivo.name isEqualToString:@"conteudo"]) {
    
        [conteudoAtivo setPosition:location];
        
    }else{
        conteudoAtivo = nil;
    }

    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (conteudoAtivo) {
       
        for (SpriteCaixaNode * c in vetorCaixas) { //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
            float xInicio = c.frame.origin.x;
            float xFim = xInicio + c.frame.size.width;
            //float xMeio = (xInicio + xFim)/2; PARA O FUTURO
            float yInicio = c.frame.origin.y;
            float yFim = yInicio + c.frame.size.height;
            //float yMeio = (yInicio + yFim)/2; PARA O FUTURO
            
            if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
                
                if ([[conteudoAtivo tipo] isEqualToString: [c retornaTipo]]) { // Caso a resposta esteja correta (Nó de resposta no local correto)
                    _corretos++;
                    [self runAction:[SKAction playSoundFileNamed:@"correto.aiff" waitForCompletion:NO]];
                    [c setLabelConteudo:conteudoAtivo.text];
                    
                    //Ação a ser feita caso a resposta esteja correta
                    [c executaSprite];
                    [self traduzParaPortugol:c];
                    [conteudoAtivo removeFromParent];
                    
                    conteudoAtivo = nil;
                    [self verificaConclusao];
                
                }else{
                    [self runAction:[SKAction playSoundFileNamed:@"errado.wav" waitForCompletion:NO]];
                    conteudoAtivo.fontColor = [UIColor redColor];
                    SKAction *animacaoVoltar = [SKAction moveTo:conteudoAtivo.posicaoInicial duration:0.5];
                    [conteudoAtivo runAction:animacaoVoltar completion:^{
                        [conteudoAtivo removeAllActions];
                        conteudoAtivo.fontColor = [UIColor whiteColor];
                    }];
                }
                
                //[conteudoAtivo setPosition:CGPointMake(xMeio, yMeio)]; //Coloca o node no centro da caixa
            }
            
        }
    }
}



-(void)traduzParaPortugol: (SpriteCaixaNode *)c{
    
    
    
    NSString *nomeVariavel = [c retornaNome];
    NSString *tipoVariavel = [c retornaTipo];
    NSString *valor = [conteudoAtivo text];
    
    
    //CONCATENA STRING
    
    NSArray *strings = [[NSArray alloc]initWithObjects:tipoVariavel ,nomeVariavel,@"<-",valor ,nil];
    
    NSString *portugol = [strings componentsJoinedByString:@" "];
    codigo.text = portugol;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)verificaConclusao{
    if (_corretos == 4) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ExeVariavel1"];
    }
}
@end
