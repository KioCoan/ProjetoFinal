//
//  SpriteCaixaself.m
//  testeSprite
//
//  Created by Felipe Costa Nascimento on 11/07/14.
//  Copyright (c) 2014 Felipe Costa Nascimento. All rights reserved.
//

#import "SpriteCaixaNode.h"

@implementation SpriteCaixaNode

-(id)init{
    self = [super init];
    
    if(self){
        [self setSize:CGSizeMake(307, 328)];
        [self inicializarClasse];
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
}

-(id)initWithConteudo:(NSString*)conteudo nome:(NSString*)nome tipo:(NSString*)tipo tamanho:(CGSize)tamanho{
    self = [super init];
    
    if(self){
        
        [self setSize:tamanho];
        [self inicializarClasse];
        [self setLabelConteudo:conteudo];
        [self setLabelNome:nome];
        [self setLabelTipo:tipo];
        
        [lblNome setFontColor:[SKColor blackColor]];
        [lblTipo setFontColor:[SKColor blackColor]];
        
        [self setUserInteractionEnabled:YES];

    }
    
    return self;
}

-(void)inicializarClasse{
    //THREAD PARA CRIAR A ANIMAÇÃO COM SOM
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        somCaixaAbrir = [SKAction playSoundFileNamed:@"abrirCaixa.mp3" waitForCompletion:NO];
        somCaixaFechar = [SKAction playSoundFileNamed:@"fecharCaixa.mp3" waitForCompletion:NO];
    });
    
    [self setTexture:[SKTexture textureWithImageNamed:@"abrir-caixa1.png"]];
    [self inicializaAnimacaoIntroducao];
    [self inicializaLabels];
    [self inicializaAnimacaoAbrirCaixa];
    [self inicializaAnimacaoFecharCaixa];

}

-(void)inicializaLabels{
    //CRIA A SKLABELNODE QUE MOSTRA O CONTEÚDO DA VARIÁVEL
    lblConteudo = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [lblConteudo setText:@"Insira o conteúdo"];
    [lblConteudo setFontSize:self.frame.size.width * 0.08];
    [lblConteudo setFontColor:[SKColor grayColor]];
    [lblConteudo setPosition:CGPointMake(self.frame.origin.x * -0.35, self.frame.origin.y * -0.43)];
    [lblConteudo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblConteudo setHidden:YES];
    
    //CRIA A SKLABELNODE QUE MOSTRA O NOME DA VARIÁVEL
    lblNome = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [lblNome setText:@"Insira um nome"];
    [lblNome setFontSize:24];
    [lblNome setFontColor:[SKColor grayColor]];
    [lblNome setPosition:CGPointMake(self.frame.origin.x * 0.75, self.frame.origin.y * 0.2)];
    [lblNome setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    //CRIA A SKLABELNODE QUE MOSTRA O TIPO DA VARIÁVEL
    lblTipo = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [lblTipo setText:@"Insira um tipo"];
    [lblTipo setFontSize:24];
    [lblTipo setFontColor:[SKColor grayColor]];
    [lblTipo setPosition:CGPointMake(self.frame.origin.x * 0.75, self.frame.origin.y * 0.65)];
    [lblTipo setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    //CRIA A SKLABELNODE QUE MOSTRA O ENDEREÇO DA VARIÁVEL
    [self criarLabelEndereco];
    
    //ADICIONA AS LABELS COMO FILHO DESTE NODE
    [self addChild:lblConteudo];
    [self addChild:lblNome];
    [self addChild:lblTipo];
}


-(void)inicializaAnimacaoAbrirCaixa{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL
    int numTexturas = 13;
    
    NSMutableArray *vetorTexturas = [[NSMutableArray alloc] init];
    
    for(int i=1; i<=numTexturas; i++){
        SKTexture *textura = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"abrir-caixa%d.png", i]];
        
        [vetorTexturas addObject:textura];
    }
    
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    animacaoAbrir = [SKAction animateWithTextures:vetorTexturas timePerFrame:0.05];
}


-(void)inicializaAnimacaoIntroducao{
    //CRIO TEXTURAS PARA TODAS OS SPRITES DA VARIAVEL
    int numTexturas = 9;
    
    NSMutableArray *vetorTexturas = [[NSMutableArray alloc] init];
    
    for(int i=1; i<=numTexturas; i++){
        SKTexture *textura = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"sprite-introducao%d.png", i]];
        
        [vetorTexturas addObject:textura];
    }
    
    
    //INSTANCIO A SKACTION COM O ARRAY DE TEXTURAS CRIADO
    animacaoIntroducao = [SKAction animateWithTextures:vetorTexturas timePerFrame:0.05];
}

-(void)criarLabelEndereco{
    //CRIA A SKLABELNODE QUE SIMBOLIZA O ENDEREÇO DE MEMÓRIA DA VARIÁVEL
    lblEndereco = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica"];
    [lblEndereco setText:@"0x000"];
    [lblEndereco setFontSize:self.frame.size.width * 0.06];
    [lblEndereco setFontColor:[SKColor blackColor]];
    [lblEndereco setPosition:CGPointMake(self.frame.origin.x * -0.27, self.frame.origin.y * 0.6)];
    [lblEndereco setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeCenter];
    [lblEndereco setZRotation:6.07];
    
    //ADICIONA A LABEL COMO FILHO DESTE NODE
    [self addChild:lblEndereco];
}


-(void)setLabelEndereco:(int)numero{
    if(numero < 0){
        @throw [NSException exceptionWithName:@"Número de endereço inválido" reason:@"número informado é menor que zero." userInfo:nil];
    }
    
    //CONDIÇÕES PARA DEIXAR O ENDEREÇO SEMPRE COM 3 DIGITOS DEPOIS DO X
    if(numero < 10){
        [lblEndereco setText:[NSString stringWithFormat:@"0x00%d", numero]];
    
    }else if(numero > 9 && numero < 100){
        [lblEndereco setText:[NSString stringWithFormat:@"0x0%d", numero]];
    
    }else{
        [lblEndereco setText:[NSString stringWithFormat:@"0x%d", numero]];
    }
}

-(void)setLabelConteudo:(NSString*)text{
    [lblConteudo setText: text];
    
    //VERIFICA SE O TEXTO TEM ASPAS PARA ENTÃO DEIXÁ-LO LARANJA
    if([[text substringToIndex:1] isEqualToString:@"\""]){
        [lblConteudo setFontColor:[SKColor colorWithRed:0.9 green:0.5 blue:0.2 alpha:1.0]];
    
    }else{
        [lblConteudo setFontColor:[SKColor blackColor]];
    }
}

-(void)iniciarAnimacaoIntroducao{
    [self esconderLabels:YES];
    [self setUserInteractionEnabled:NO];
    SKEmitterNode *particula = [[SKEmitterNode alloc] init];
    
    SKAction *somEncostouChao = [SKAction playSoundFileNamed:@"caixaEncostaChao.mp3" waitForCompletion:NO];
    NSString *myParticlePath = [[NSBundle mainBundle] pathForResource:@"AnimaVariavel" ofType:@"sks"];
    particula = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    particula.particlePosition = CGPointMake(-20, -120);
    
    
    [self runAction:animacaoIntroducao completion:^{
        [self runAction:[SKAction moveToY:self.position.y - 30 duration:0.2] completion:^{
            [self runAction:somEncostouChao];
            [self setTexture:[SKTexture textureWithImageNamed:@"abrir-caixa1.png"]];
            [self addChild:particula];
            [self runAction:[SKAction waitForDuration:1.1] completion:^{
                [particula removeFromParent];
                [self removeAllActions];
                [self setUserInteractionEnabled:YES];
            }];
        }];
        [self esconderLabels:NO];
    }];
}

-(void)esconderLabels:(BOOL)resultado{
    [lblNome setHidden:resultado];
    [lblTipo setHidden:resultado];
    [lblEndereco setHidden:resultado];
}

-(void)setLabelNome:(NSString*)text{
    [lblNome setText: text];
}

-(void)setLabelTipo:(NSString*)text{
    [lblTipo setText: text];
}

-(void)executaSprite{
    [self setUserInteractionEnabled:NO];
    
    //VERIFICA O ESTADO DA CAIXA, SE ELA ESTÁ ABERTA OU FECHADA PARA ACIONAR A SKACTION CORRETA
    if(caixaAberta){
        [self fecharCaixa];
        
    }else{
        [self abrirCaixa];
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self executaSprite];
}



-(void)fecharCaixa{
    //INICIA A SKACTION QUE FECHA A CAIXA
    [lblConteudo setHidden:YES];
    [self runAction:somCaixaFechar];
    [self runAction:animacaoFechar completion:^{
        [self removeAllActions];
        caixaAberta = NO;
        [self setUserInteractionEnabled:YES];
    }];
}


-(void)abrirCaixa{
    //INICIA A SKACTION QUE ABRE A CAIXA
    [lblConteudo setHidden:YES];
    [self runAction:somCaixaAbrir];
    [self runAction:animacaoAbrir completion:^{
        [self removeAllActions];
        caixaAberta = YES;
        [lblConteudo setHidden:NO];
        [self setUserInteractionEnabled:YES];
    }];
}


-(void)inicializaAnimacaoFecharCaixa{
    //CRIO UMA ANIMAÇÃO EM ORDEM INVERSA (CAIXA FECHANDO)
    animacaoFechar = [animacaoAbrir reversedAction];
}

-(void)alteraCorLabels:(NSString *)tipo{
    
    if ([tipo isEqualToString:@"tipo"] || [tipo isEqualToString:@"Tipo"] || [tipo isEqualToString:@"TIPO"]) {
        [lblTipo setFontColor:[SKColor blackColor]];
        
    }else if ([tipo isEqualToString:@"nome"] || [tipo isEqualToString:@"Nome"] || [tipo isEqualToString:@"NOME"]){
        
        [lblNome setFontColor:[SKColor blackColor]];
        
    }else if ([tipo isEqualToString:@"conteudo"] || [tipo isEqualToString:@"Conteudo"] || [tipo isEqualToString:@"CONTEUDO"]){
        [lblConteudo setFontColor:[SKColor blackColor]];
    }
    
    
}

-(NSString *)retornaTipo{
    return lblTipo.text;
}

-(NSString *)retornaNome{
    return lblNome.text;
}

-(NSString *)retornaConteudo{
    return lblConteudo.text;
}


@end
