//
//  CenaExercicioCondSimples1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 21/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioCondSimples1.h"
#import <stdlib.h>

@implementation CenaExercicioCondSimples1
{
    NSMutableArray *expressoes;
    NSMutableArray *alternativas;
    float font;
    int n;
    int indice;
    SKSpriteNode *espaco;
    SKSpriteNode *breakpoint;
    SKAction *verificaCondicao;
    BOOL jaApareceu;
    CGPoint posicaoBreakPoint;
    Geral *calculador;
    BOOL animaBrekPoint;
    BOOL animaCondicao;
    SpriteLabelNode *alternativaMarcada;
    
}

-(void)corrigeExercicio{
    //n = 7;
    NSMutableArray *caracteres;
    
    for (NSDictionary *linha in expressoes) {
        SpriteLabelNode *condicao = [linha objectForKey:@"condicao"];
        
        
        //verifica se a condicao existe
        NSLog(@"condicao == %@",condicao.name);
        if (![condicao.name isEqualToString:@"nula"]) {
            caracteres = [self converteCondicaoTexto:condicao.text];
            
            
            //chamando interpretador para devolver o resultado da condicao
            NSString *resultado = [calculador calculaOperador:[caracteres objectAtIndex:1] numero1:[caracteres objectAtIndex:0] numero2:[caracteres objectAtIndex:2]];
            
            
            
            if ([resultado isEqualToString:@"Verdadeiro"]) {
                resultado = condicao.tipo;
                
                
                for (SpriteLabelNode *alternativaCorreta in alternativas) {
                    if ([resultado isEqualToString:alternativaCorreta.tipo]) {
                        alternativaCorreta.fontColor = [SKColor greenColor];
                        return;
                    }
                }
                
                

                
            }
            
        }
        
        
        
        
    }
    for (SpriteLabelNode *alternativaCorreta in alternativas) {
        if ([alternativaCorreta.tipo isEqualToString:@"senao"]) {
            alternativaCorreta.fontColor = [SKColor greenColor];
            break;
        }
    }
    
    
}

- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        font = self.frame.size.height * 25;
        calculador = [[Geral alloc]init];
        
        
        [self criaEnunciado];
        [self criaExpressoes];
        [self criaAlternativas];
        
        //cria espaco onde as condicoes serao movidas
        
        espaco = [SKSpriteNode spriteNodeWithImageNamed:@"fundo-cinza.png"];
        espaco.size = CGSizeMake(150, 100);
        espaco.position = CGPointMake(600, 100);
        posicaoBreakPoint.x = 500;
        
        [self addChild:espaco];
        
        //prepara botao para obter resposta
        
        SKLabelNode *botao = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
        botao.text = @"Botao Resposta";
        botao.name = @"botaoResposta";
        botao.fontSize = 30;
        botao.position = CGPointMake(550, 500);
        
        [self addChild:botao];
        
        [self preparaAnimacao];
        
        
        
        
    }
    return self;
    
    
}

- (void)preparaAnimacao{
    
    breakpoint = [SKSpriteNode spriteNodeWithImageNamed:@"fundo-cinza.png"];
    breakpoint.size = CGSizeMake(1000, 35);
    //breakpoint.position = CGPointMake(500, 770);
    //[self addChild:breakpoint];
    
}

-(NSMutableArray *)converteCondicaoTexto :(NSString *)texto{
    
    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:texto.length];
    for (int i=0; i<texto.length; ++i) {
        NSString *charStr = [texto substringWithRange:NSMakeRange(i, 1)];
        
        
        if ([charStr isEqualToString:@"n"]) {
            [charArray addObject:[NSString stringWithFormat:@"%d",n]];
        }else if (![charStr isEqualToString:@" "]){
            [charArray addObject:charStr];
        }
        
        
        
        
    }

    return charArray;
    
}

-(void)testeAnima{
    
    animaCondicao = YES;
    animaBrekPoint = YES;
    
    [self runAction:[SKAction waitForDuration:1] completion:^{
        
        
    
        
        //pega condicao do vetor de expressoes
        
        SpriteLabelNode *condicao = [[expressoes objectAtIndex:indice] objectForKey:@"condicao"];
        NSLog(@"%@",condicao.name);
        //configura posicao break point
        posicaoBreakPoint.y = condicao.position.y;
        breakpoint.position = posicaoBreakPoint;
        
        
        //verifica se o breakpoint ja esta na tela
        if (!jaApareceu) {
            [self addChild:breakpoint];
            jaApareceu = YES;
        }else{
            
            //acao de mover o breakpoint uma linha abaixo
            
            [breakpoint runAction:[SKAction moveToY:posicaoBreakPoint.y duration:3] completion:^{
                
                //verifica se a condicao é nula
                
                    if (![condicao.name isEqualToString:@"nula"]) {
                        
                        //se a condicao for diferente de nula a cor da label e posicao sao alterados
                        condicao.fontColor = [SKColor yellowColor];
                        
                        [condicao runAction:[SKAction moveTo:espaco.position duration:5] completion:^{
                           
                            //pega os caracteres da condicao e jogam no vetor *charArray
                            
                            NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:condicao.text.length];
                            for (int i=0; i<condicao.text.length; ++i) {
                                NSString *charStr = [condicao.text substringWithRange:NSMakeRange(i, 1)];
                                
                                if (![charStr isEqualToString:@" "]) {
                                    [charArray addObject:charStr];
                                }
                                
                                
                                
                            }
                            
                            //caracteres do vetor *charArray sao passados para o calculador retornar o resultado da expressao
                            
                            NSString *resultado = [calculador calculaOperador:[charArray objectAtIndex:1] numero1:[NSString stringWithFormat:@"%d",n] numero2:[charArray objectAtIndex:2]];
                            
                            //dependendo do resultado altera novamente a cor da label
                            
                            if ([resultado isEqualToString:@"Verdadeiro"]) {
                                condicao.fontColor = [SKColor greenColor];
                            }else{
                                condicao.fontColor = [SKColor redColor];
                            }
                            //label retonar ao local original
                            [condicao runAction:[SKAction moveTo:condicao.posicaoInicial duration:3] completion:^{
                                
                            }];
                            //[condicao runAction:[SKAction moveTo:condicao.posicaoInicial duration:3]];
                            
                            
                        }];
                        
                        
                        
                    }
                
            }];
            
            
            
            
        }
        
        while ((animaBrekPoint == YES) && (animaCondicao == YES)) {
            animaBrekPoint = [breakpoint hasActions];
            animaCondicao = [condicao hasActions];
            NSLog(@"nao terminou");
        }
        
                //incrementa o indice
        
        indice++;
        
        //para ou chama a funcao novamente
        if (indice >= expressoes.count) {
            return;
        }else{
            [self testeAnima];
        }

        
        
        
    }];
    
    
    
    
}


- (void)criaEnunciado{
    

    
    NSString *texto1 = @"Assinale a alternativa Correta.";
    NSString *texto2 = @"O que será escrito na tela, segundo as seguintes instruções:";
    
    
    
    //Criando Label 1
    
        SKLabelNode *lblEnunciado1 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
        [lblEnunciado1 setText:texto1];
        lblEnunciado1.position = CGPointMake(self.frame.size.width * 230, self.frame.size.height * 900);
        lblEnunciado1.fontSize = font;
        [self addChild:lblEnunciado1];
    

    //Criando Label 2
    
    
    SKLabelNode *lblEnunciado2 = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    [lblEnunciado2 setText:texto2];
    lblEnunciado2.position = CGPointMake(self.frame.size.width * 400, self.frame.size.height * 850);
    lblEnunciado2.fontSize = font;
    [self addChild:lblEnunciado2];
    
    
}

- (void)criaExpressoes{
    
    SKLabelNode *lblCodigo1;
    SpriteLabelNode *condicao;
    expressoes = [NSMutableArray array];
    float altura = self.frame.size.height * 770;
    
    
    //linha 1
    
    //editando texto
    n = arc4random() % 10;
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = [NSString stringWithFormat:@"n <- %d",n];
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando tamanho e posicao
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    lblCodigo1.fontSize = font;
    
    //salvando e aadicionado linha
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    condicao = nil;
    altura -= 40;
    
    
    //linha 2
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"se(          )";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]initWithType:@"se1" texto:@"n < 3"];
    condicao.fontName = @"Helvetica";
    condicao.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    condicao.name = @"condicao";
    
    //editando posicao
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    NSLog(@"tamanho tela %f",self.frame.size.width * 50);
    
    condicao.position = CGPointMake(self.frame.size.width * 90, altura);
    condicao.posicaoInicial = condicao.position;
    condicao.fontSize = font;
    
    //adicionando e salvando linha
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    [self addChild:condicao];
    
    //preparando para proxima linha
    lblCodigo1 = nil;
    condicao = nil;
    altura -= 40;
    
    
    //linha 3
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva (vou ao parque);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);;
    lblCodigo1.fontSize = font;
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;
    
    //linha 4
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}senao se (          ){";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]initWithType:@"se2" texto:@"n < 6"];
    condicao.fontName = @"Helvetica";
    condicao.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    condicao.name = @"condicao";
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);;
    lblCodigo1.fontSize = font;
    
    condicao.position = CGPointMake(self.frame.size.width * 180, altura);
    condicao.posicaoInicial = condicao.position;
    condicao.fontSize = font;
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    [self addChild:condicao];
    altura -= 40;

    //linha 5
    
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva (vou para o cinema);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;

    
    //codigo 6
    
    //editando texto
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}senao{";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;
    

 
    //codigo 7
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"escreva(ficarei em casa);";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 80, altura);
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;

    //codigo 8
    
    lblCodigo1 = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    lblCodigo1.text = @"}";
    lblCodigo1.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    
    condicao = [[SpriteLabelNode alloc]init];
    
    
    //editando posicionamento e font
    
    lblCodigo1.position = CGPointMake(self.frame.size.width * 50, altura);
    condicao.position = lblCodigo1.position;
    condicao.name = @"nula";
    lblCodigo1.fontSize = font;
    
    
    //salvando e adicionando linha
    
    [self salvaExpressoes:condicao texto:lblCodigo1];
    [self addChild:lblCodigo1];
    altura -= 40;


    
}

- (void)criaAlternativas{
    
    int fontAlternativas = self.frame.size.height * 35;
    
    alternativas = [NSMutableArray array];

    CGPoint posiciaoInicial = CGPointMake(self.frame.size.width * 70, self.frame.size.height * 300);
    CGPoint posicaoMutavel = posiciaoInicial;
    
    NSMutableArray *textos = [NSMutableArray array];
    NSMutableArray *tipos = [NSMutableArray array];
    NSMutableArray *tiposETextos = [NSMutableArray array];
    
    //textos das alternativas
    [textos addObject:@"vou ao parque"];
    [textos addObject:@"vou para o cinema"];
    [textos addObject:@"ficarei em casa"];
    [textos addObject:@"todas alternativas"];
    
    [tipos addObject:@"se1"];
    [tipos addObject:@"se2"];
    [tipos addObject:@"senao"];
    [tipos addObject:@"errada"];
    
    
    for (int i =0; i < textos.count; i++) {
        NSDictionary *dict = @{
                                @"tipo":[tipos objectAtIndex:i],
                                @"texto":[textos objectAtIndex:i]
                                };
        [tiposETextos addObject:dict];
    }
    
    tiposETextos = [self embaralha:tiposETextos];
    
    
    
    //criando alternativas
    
    SpriteLabelNode *alternativaA = [[SpriteLabelNode alloc]initWithType:[[tiposETextos objectAtIndex:0] objectForKey:@"tipo"] texto:[NSString stringWithFormat:@"a. %@",[[tiposETextos objectAtIndex:0] objectForKey:@"texto"] ]];
    
    SpriteLabelNode *alternativaB = [[SpriteLabelNode alloc]initWithType:[[tiposETextos objectAtIndex:1] objectForKey:@"tipo"] texto:[NSString stringWithFormat:@"b. %@",[[tiposETextos objectAtIndex:1] objectForKey:@"texto"] ]];
    
    SpriteLabelNode *alternativaC = [[SpriteLabelNode alloc]initWithType:[[tiposETextos objectAtIndex:2] objectForKey:@"tipo"] texto:[NSString stringWithFormat:@"c. %@",[[tiposETextos objectAtIndex:2] objectForKey:@"texto"] ]];
    
    SpriteLabelNode *alternativaD = [[SpriteLabelNode alloc]initWithType:[[tiposETextos objectAtIndex:3] objectForKey:@"tipo"] texto:[NSString stringWithFormat:@"d. %@",[[tiposETextos objectAtIndex:3] objectForKey:@"texto"] ]];
    
    
    //inserindo no vetor
    
    [alternativas addObject:alternativaA];
    [alternativas addObject:alternativaB];
    [alternativas addObject:alternativaC];
    [alternativas addObject:alternativaD];
    
    
    
    for (SKLabelNode *aux in alternativas) {
        aux.fontSize = fontAlternativas;
        aux.position = posicaoMutavel;
        aux.fontName = @"Arial";
        aux.name = @"alternativa";
        aux.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        posicaoMutavel.y -= 60;
        [self addChild:aux];
    }
    
    
    
}

-(void)salvaExpressoes:(SpriteLabelNode*)condicao texto:(SKLabelNode *)texto{
    
    NSDictionary *linha = @{
                           @"condicao":condicao,
                           @"texto":texto
                           };
    
    [expressoes addObject:linha];
}

- (NSMutableArray *)embaralha :(NSMutableArray *)antigo{
    
    int n1;
    NSMutableArray *vetorEmbaralhado = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n1 = arc4random() % antigo.count;
        
        [vetorEmbaralhado addObject:[antigo objectAtIndex:n1]];
        [antigo removeObjectAtIndex:n1];
    }
    
    
    
    
    return vetorEmbaralhado;
    
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    /*indice = 0;
    calculador = [[Geral alloc]init];
    [self testeAnima];
    //[self movimentaBreakPoint];
    */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *teste = [self nodeAtPoint:location];
    
    
    if ([teste.name isEqualToString:@"alternativa"]) {
        
        if (alternativaMarcada != nil) {
            alternativaMarcada.fontColor = [SKColor whiteColor];
        }
        SpriteLabelNode *aux = (SpriteLabelNode *) [self nodeAtPoint:location];
        alternativaMarcada = aux;
        alternativaMarcada.fontColor = [SKColor yellowColor];
    }else if ([teste.name isEqualToString:@"botaoResposta"] && alternativaMarcada != nil){
        [self corrigeExercicio];
    }


    
}


@end
