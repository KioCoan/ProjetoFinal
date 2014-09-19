//
//  containerView.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuNode.h"


@implementation MenuNode{
    NSMutableArray *secoes;
    BOOL aberto;
    SKAction *abrirMenu;
    SKAction *fecharMenu;
    int nSecoes;
}

- (BOOL)getAberto{
    return aberto;
}

//METODO DO PROTOCOLO SecaoMenuDELEGATE
- (void)fuiClicado:(NSString *)titulo{
    
    CGPoint posicaoInicial;
    CGPoint posicaoMutavel;
    posicaoInicial = CGPointMake(-50, 350);
    posicaoMutavel = posicaoInicial;
    
    
    for (SecaoMenu *secao in secoes){
        
        NSLog(@"titulo %@ -- tituloParametro %@",secao.titulo,titulo);
        
        if ([secao.titulo isEqualToString:titulo]) {
            
            
            for (int i = 0;i < secao.icones.count;i++) {
                
                IconeSecao *icone = [secao.icones objectAtIndex:i];
                
                [icone setSize:CGSizeMake(120, 120)];
                
                [icone setPosition:posicaoMutavel];
                [icone setPosicaoAnterior:posicaoMutavel];
                
                [self addChild:icone];
                
                if ((i % 2) == 0) {
                    posicaoMutavel.x += icone.size.width - 10;
                }else{
                    posicaoMutavel.x = posicaoInicial.x;
                    posicaoMutavel.y -= icone.size.height - 10;
                }
                
                
                
            }

            
            
            return;
        }
        
        
    }
    
}

- (void)configuraIconesVetor:(NSMutableArray *)array{
    
    CGPoint posicaoInicial;
    
    switch (array.count) {
        case 1:
        case 2:
            
            posicaoInicial = CGPointMake(-100, 350);
            
            for (IconeSecao *icone in array) {
                
                [icone setSize:CGSizeMake(400, 400)];
                
                [icone setPosition:posicaoInicial];
                [icone setPosicaoAnterior:posicaoInicial];
                
                
                [self addChild:icone];
                
                posicaoInicial.y -= icone.size.height;
                
            }
            
            
            break;
            
        }
    
}

// CRIA SECOES DO MENU CONFORME O INDICE
- (SecaoMenu *)criaSecaoIndice:(int)indice{
    
    
    switch (indice) {
        
        //VARIAVEL
        case 0:
            return [[SecaoMenuVariavel alloc]init];
            break;
            
        default:
            break;
    }
    
    
    
    return nil;
}

- (void)testando : (CGPoint)abrir PosicaoFechar:(CGPoint)fechar tamanho:(CGSize)tamanho{
    
    abrirMenu = [SKAction moveToX:abrir.x duration:0.2];
    fecharMenu = [SKAction moveToX:fechar.x duration:0.2];
    
    self.position = fechar;
    
    [self setTexture:[SKTexture textureWithImageNamed:@"livre-menu.png"]];
    self.size = tamanho;
    self.name = @"menu";
    
    aberto = NO;
    
    
    // CRIANDO SECOES
    
    secoes = [NSMutableArray array];
    
    nSecoes = 1;
    
    CGPoint posicaoInicial = CGPointMake(-220, 450);
    
    for (int i = 0; i < nSecoes; i++) {
        
        
        SecaoMenu *novaSecao = [self criaSecaoIndice:i];
        [novaSecao setMyDelegate:self];
        [novaSecao runAction:[SKAction rotateToAngle: -M_PI / 2 duration:0]];
        
        [novaSecao setPosition:posicaoInicial];
        
        [self addChild:novaSecao];
        
        [secoes addObject: novaSecao];
        
        posicaoInicial.y -= novaSecao.size.width;
    }

    
    
}


- (id)initWithPosicaoAbrir : (CGPoint)abrir PosicaoFechar:(CGPoint)fechar tamanho:(CGSize)tamanho{
    
   self = [super init];
    
    // CONFIGURANDO MENU
    
    abrirMenu = [SKAction moveToX:abrir.x duration:0.2];
    fecharMenu = [SKAction moveToX:fechar.x duration:0.2];
    
    self.position = fechar;
    
    [self setTexture:[SKTexture textureWithImageNamed:@"livre-menu.png"]];
    self.size = tamanho;
    self.name = @"menu";
    
    aberto = NO;
    
    
    // CRIANDO SECOES
    
    secoes = [NSMutableArray array];
    
    nSecoes = 1;
    
    CGPoint posicaoInicial = CGPointMake(-220, 450);
    
    for (int i = 0; i < nSecoes; i++) {
        
        
        SecaoMenu *novaSecao = [self criaSecaoIndice:i];
        [novaSecao setMyDelegate:self];
        [novaSecao runAction:[SKAction rotateToAngle: -M_PI / 2 duration:0]];
        
        [novaSecao setPosition:posicaoInicial];
        
        [self addChild:novaSecao];
        
        [secoes addObject: novaSecao];
        
        posicaoInicial.y -= novaSecao.size.width;
    }

    
    return self;
}

- (IconeSecao *)criaIconeIndice:(int)indice{
    
    IconeSecao *icone;
    
    switch (indice) {
        case 1:
            icone = [[IconeSecao alloc]initWithImageNamed:@"abrir-caixa1.png"];
            icone.tipo = @"variavel";
            break;
        case 2:
            icone = [[IconeSecao alloc]initWithImageNamed:@"parte-operador.png"];
            icone.tipo = @"operador";
            break;
        case 3:
            icone = [[IconeSecao alloc]initWithImageNamed:@"se-verde.png"];
            icone.tipo = @"se";
            break;
        case 4:
            icone = [[IconeSecao alloc]initWithImageNamed:@"valores-errado.png"];
            icone.tipo = @"senao";
            break;
        case 5:
            icone = [[IconeSecao alloc]initWithImageNamed:@"valores-verdadeiro.png"];
            icone.tipo = @"senaoSE";
            break;
        
        default:
            NSLog(@"erro, switch default opcao");
            break;
    }
    
    icone.name = @"iconeMenu";
    
    return icone;
}


- (void)abrirFechar{
    
    if (aberto) {
        
        [self fecharMenu];
        
        
    }else{
        [self abrirMenu];
    }
    
}

- (void)abrirMenu{
    
    [self runAction:abrirMenu];
    aberto = YES;
}

- (void)fecharMenu{
    
    [self runAction:fecharMenu];
    aberto = NO;
}

@end
