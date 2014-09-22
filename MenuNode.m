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
    NSString *secaoAtivo;
}

- (BOOL)getAberto{
    return aberto;
}

//METODO DO PROTOCOLO SecaoMenuDELEGATE
- (void)fuiClicado:(NSString *)titulo{
    
    if (![secaoAtivo isEqualToString:titulo]) {
        
        
        
        
        if (secaoAtivo != nil) {
            SecaoMenu *secaoAntiga = [self retornaSecaoPorTitulo:secaoAtivo];
            [secaoAntiga removeTodosIcones];
        }
        
        SecaoMenu *secao = [self retornaSecaoPorTitulo:titulo];
        secaoAtivo = secao.titulo;
        
        
        CGPoint posicaoInicial;
        CGPoint posicaoMutavel;
        posicaoInicial = CGPointMake(0, 350);
        posicaoMutavel = posicaoInicial;
        
        
        for (int i = 0; i < [secao retornaNumeroIcones];i++) {
            
            IconeSecao *icone = [secao retornaIconeIndice:i];
            
            [icone setSize:CGSizeMake(200, 200)];
            
            [icone setPosition:posicaoMutavel];
            [icone setPosicaoAnterior:posicaoMutavel];
            
            [self addChild:icone];
            
            //if ((i % 2) == 0) {
//                posicaoMutavel.x += icone.size.width - 10;
//            }else{
//                posicaoMutavel.x = posicaoInicial.x;
                posicaoMutavel.y -= icone.size.height - 10;
            //}

        
        
    }
    
   
    
    
    
   
    
    
    //for (SecaoMenu *secao in secoes){
        
        NSLog(@"titulo %@ -- tituloParametro %@",secao.titulo,titulo);
        
        //if ([secao.titulo isEqualToString:titulo]) {
            
            
    
                
                
            //}

            
            
            return;
        //}
        
        
    }
    
}

- (SecaoMenu *)retornaSecaoPorTitulo:(NSString *)titulo{
    
    
    for (SecaoMenu *secao in secoes) {
        
        if ([secao.titulo isEqualToString:titulo]) {
            return secao;
        }
        
        
    }
    NSLog(@"ERRO nao retornou nenhuma secao");
    return nil;
    
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
    
    nSecoes = 2;
    
    [self criarTodasSecoes];
    
    
    return self;
}

- (void)criarTodasSecoes{
    
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

// CRIA SECOES DO MENU CONFORME O INDICE
- (SecaoMenu *)criaSecaoIndice:(int)indice{
    
    
    switch (indice) {
            
            //VARIAVEL
        case 0:
            return [[SecaoMenuVariavel alloc]init];
            break;
        case 1:
            return [[SecaoMenuOperador alloc]init];
        default:
            break;
    }
    
    
    
    return nil;
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
