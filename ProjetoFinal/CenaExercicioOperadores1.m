//
//  CenaExercicioOperadores1.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 17/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaExercicioOperadores1.h"
#import <stdlib.h>


@implementation CenaExercicioOperadores1{
    NSMutableArray *expressoes;
    NSMutableArray *opcoes;
    Calculador *calculador;
    NSString *valor1;
    NSString *valor2;
    NSString *resultado;
    SKNode *nodeClicado;
    SpriteLabelNode *operador;
    SKSpriteNode *espacoClicado;
    int quantidadeOperadores;
}




- (id)init{
    
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        
        
        //allocando calculador
        calculador = [[Calculador alloc]init];
        
        opcoes = [NSMutableArray array];
        expressoes = [NSMutableArray array];
        
        quantidadeOperadores = 6;
        
            [self geraDadosAleatorio];
            [self criaSpriteOperador];
        
        opcoes = [self embaralha:opcoes];
        [self posicionamento:opcoes];
        
        
        //coloca na tela
        [self criaEnunciado];
        //[self adicionaNaTela];
        _corretos = 0;
    }
    return self;

    
}

-(void)didMoveToView:(SKView *)view{
    
    //CRIA O GESTURE E A TEXT FIELD
    
    //GESTURE
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureRecognizer:)];
    //[longPress setMinimumPressDuration:1.5];
    //[longPress setNumberOfTouchesRequired:2];
    [longPress setNumberOfTouchesRequired:1];
    [longPress setMinimumPressDuration:1];
    [self.view addGestureRecognizer:longPress];
    
}


- (void)criaEnunciado{
    
    SKLabelNode *enunciado1 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
    SKLabelNode *enunciado2 = [[SKLabelNode alloc]initWithFontNamed:@"HeadLine"];
    
    
    CGPoint posicao = CGPointMake(400, 850);
    CGPoint posicao2 = posicao;
    posicao2.y -= enunciado1.fontSize * 1.2 ;
    
    NSString *texto1 = @"Arraste cada operador para";
    NSString *texto2 = @"dentro da caixa adequada";
    
    [enunciado1 setText:texto1];
    [enunciado2 setText:texto2];
    [enunciado1 setPosition:posicao];
    [enunciado2 setPosition:posicao2];
    
    [self addChild:enunciado1];
    [self addChild:enunciado2];
    
}

- (void)criaSpriteOperador{
    
    CGPoint posicaoInicial = CGPointMake(200, 650);
    CGPoint posicaoMutavel = posicaoInicial;
    
    
    for (int i = 0; i < quantidadeOperadores; i++) {
        
        
        [self geraDadosAleatorio];
        
        
        SpriteOperadorNode *spriteOperador = [[SpriteOperadorNode alloc]init];
        [spriteOperador setLabelValor1:valor1];
        [spriteOperador setLabelValor2:valor2];
        [spriteOperador setLabelResultado:resultado];
//        NSString *temp = operador.text;
//        [spriteOperador setLabelOperador:temp];
        spriteOperador.name = @"sprite";
        
        
        SKSpriteNode *espaco = [[SKSpriteNode alloc]initWithImageNamed:@"fundo-transparente.png"];
        espaco.position = posicaoMutavel;
        [espaco setPosition:CGPointMake(posicaoMutavel.x, posicaoMutavel.y + 60)];
        espaco.size = CGSizeMake(105, 105);
        espaco.name = @"espaco";
        
        spriteOperador.position = posicaoMutavel;
        
        
        
        
        
        [self addChild:spriteOperador];
        [spriteOperador iniciarAnimacaoAbrir];
        [self addChild:espaco];
        
        NSDictionary *expressao = @{
                                    @"espaco":espaco,
                                    @"spriteOperador":spriteOperador
                                    };
        
        [expressoes addObject:expressao];
        
        if (((i+1) % 2) != 0) {
            posicaoMutavel.x = 550;
        }else{
            posicaoMutavel.x = posicaoInicial.x;
            posicaoMutavel.y -= 200;
        }
        
        
    }
    
    
    
}

- (SpriteLabelNode *)criaLabel:(NSString *)texto name:(NSString*)name{
    
    SpriteLabelNode *aux = [[SpriteLabelNode alloc]initWithType:nil texto:texto];
    aux.name = name;
    aux.fontSize = 65;
    
    return aux;
    
}


- (NSMutableArray *)embaralha :(NSMutableArray *)antigo{
    
    int n;
    NSMutableArray *vetorEmbaralhado = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n = arc4random() % antigo.count;
        
        [vetorEmbaralhado addObject:[antigo objectAtIndex:n]];
        [antigo removeObjectAtIndex:n];
    }
    
    
    
    
    return vetorEmbaralhado;
    
    
    
}


- (void)posicionamento:(NSMutableArray *)vetor{
    
    CGPoint posicaoInicial = CGPointMake(50, 100);
    CGPoint posicaoMutavel = posicaoInicial;
    
    posicaoMutavel.x = posicaoInicial.x + 10;
    posicaoMutavel.x = self.frame.size.width * 80;
    
    for (SpriteLabelNode *labelOperador in vetor) {
        [labelOperador setPosition:posicaoMutavel];
        [labelOperador setPosicaoInicial:posicaoMutavel];
        posicaoMutavel.x += (labelOperador.fontSize * 2);
        [self addChild:labelOperador];
    }
    
    
    
    
}

- (void)geraDadosAleatorio{
    
    //criando vetor de operadores
   NSArray *operadores = [NSArray arrayWithObjects:@">", @"<",@"==",@"!=",@">=",@"<=",@"+",@"-",@"*",@"/",nil];
    
    
    int n = 0;
    //sorteia operacao
    
    n = arc4random() % operadores.count;
    operador = [[SpriteLabelNode alloc]initWithType:@"operador" texto:[operadores objectAtIndex:n]];
    operador.name = @"labelOperador";
    operador.fontSize = 65;
    [opcoes addObject:operador];
    
    //SORTEIA VALORES
    
    n = arc4random() % 10 + 1;
    valor1 = [NSString stringWithFormat:@"%d",n];
    
    n = arc4random() % 10 + 1;
    
    valor2 = [NSString stringWithFormat:@"%d",n];
    
    
       //chamando o calculador para retornar o resultado da operacao
    
    resultado = [calculador calculaOperador:operador.text numero1:valor1 numero2:valor2];
    
    //NSArray *strings = [[NSArray alloc]initWithObjects:@"=",aux ,nil];
    //resultado = [[SpriteLabelNode alloc]initWithType:@"resultado" texto:[strings componentsJoinedByString:@" "]];
    
    }


- (void)longPressGestureRecognizer:(UILongPressGestureRecognizer *)recognizer{
    
    //RECONHECE O GESTURE DE LONGPRESS
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan && [nodeClicado.name isEqualToString:@"espaco"]){
        
        //HABILITA A TEXTFIELD
        
        for (NSDictionary *expresssao in expressoes) {
            
            SKSpriteNode *espaco = [expresssao objectForKey:@"espaco"];
            SpriteOperadorNode *spriteOperador = [expresssao objectForKey:@"spriteOperador"];
            if ([espaco isEqual:nodeClicado] && ![[spriteOperador getOperador] isEqualToString:@""]) {
                
                operador = [self criaLabel:[spriteOperador getOperador] name:@"labelOperador"];
                
                [operador setPosicaoInicial:CGPointMake(400, 50)];
                operador.position = operador.posicaoInicial;
                [spriteOperador setLabelOperador:@""];
                [self addChild:operador];
                quantidadeOperadores++;
                NSLog(@"quantidade %d",quantidadeOperadores);
                

                
            }
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
}


- (void)animacaoOperadorErrado:(SpriteLabelNode *)conteudoAtivo{
    
    
    //DEIXA A LABEL VERMELHA E A COLOCA NA SUA COORDENADA DE INICIO
    
    
    
    conteudoAtivo.fontColor = [UIColor redColor];
    SKAction *animacaoVoltar = [SKAction moveTo:conteudoAtivo.posicaoInicial duration:0.5];
    [conteudoAtivo runAction:animacaoVoltar completion:^{
        [conteudoAtivo removeAllActions];
        //conteudoAtivo.fontColor = [UIColor greenColor];
    }];
    
}



-(void)corrigirExercicio:(SpriteOperadorNode*)spriteOperador conteudoAtivo:(SpriteLabelNode *)conteudoAtivo{
    
    
    //PEGA OS VALORES DO SPRITENODE
    
    valor1 = [spriteOperador getValor1];
    valor2 = [spriteOperador getValor2];
    resultado = [spriteOperador getResultado];
    
    
    
    
    //CHAMA O CALCULADOR E SE A EXPRESSAO ESTA CORRETA
    
    //PASSA O OPERADOR PARA O PONTEIRO OPERADORDOSPRITE
    NSString *operadorDoSprite = [spriteOperador getOperador];
    
    //VERIFICA SE JA EXISTE UM OPERADOR NESSE SPRITE NODE (SE TIVER ELE NAO DEIXA POR OUTRO)
    //CHAMA O CALCULADOR E VERIFICA SE A RESPOSTA ESTA CERTA
    
    if ([operadorDoSprite isEqualToString:@""]  && [resultado isEqualToString:[calculador calculaOperador:conteudoAtivo.text numero1:valor1 numero2:valor2]]) { //se a resposta do calculador for a mesma da expressao
        
        [spriteOperador setLabelOperador:conteudoAtivo.text];
        
        [conteudoAtivo removeFromParent];
        conteudoAtivo.dentro = YES;
        quantidadeOperadores--;
        NSLog(@"quantidade %d",quantidadeOperadores);
        _corretos++;
        
    }else{
        [self animacaoOperadorErrado:conteudoAtivo];
    }

    //VERIFICA SE O EXERCICIO JA ACABOU
    
    if (quantidadeOperadores <= 0) {
        NSLog(@"exercicio concluido");
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"ExeOperadores1"];
        //[self.myDelegate exercicioFinalizado];
    }
    NSLog(@"ainda tem");

    
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //criando toque e posicao
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    nodeClicado = [self nodeAtPoint:location];
    
    if ([nodeClicado.name isEqualToString:@"labelOperador"]) {
        
        //move = YES;
        
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //se move estiver YES entao pode mover o NODE
    
    //if (move) {
        
        //identificando toque e posicao
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        
        //setando posicao no NODE
        if ([nodeClicado.name isEqualToString:@"labelOperador"]) {
            [nodeClicado setPosition:location];
        }
        
            
       
   // }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    if ([nodeClicado.name isEqualToString:@"labelOperador"] && nodeClicado) {
        
        SpriteLabelNode *conteudoAtivo = (SpriteLabelNode *)nodeClicado;
        
        conteudoAtivo.dentro = NO;
        
        for (NSDictionary *expressao in expressoes) { //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
            
            SKSpriteNode *espaco = [expressao objectForKey:@"espaco"];
            
            
            
            //COORDENADAS PARA A CAIXA
            
            float xInicio = espaco.frame.origin.x;
            float xFim = xInicio + espaco.frame.size.width;
            //float xMeio = (xInicio + xFim)/2;
            float yInicio = espaco.frame.origin.y;
            float yFim = yInicio + espaco.frame.size.height;
            //float yMeio = (yInicio + yFim)/2;
            
            
            //VERIFICA SE O NODE MOVIDO ESTA DENTRO DA CAIXA
            
            if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
                
               
                // CHAMA O MÉTODO CORRIGIR PASSANDO O SPRITEOPERADORNODE E O CONTEUDO ATIVO COMO PARAMETRO
                
                [self corrigirExercicio:[expressao objectForKey:@"spriteOperador"] conteudoAtivo:conteudoAtivo];
                
                
            }

    
        }
        
        
    }
    
    
   // move = NO;
    
}



@end
