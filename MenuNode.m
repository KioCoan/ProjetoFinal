//
//  containerView.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "MenuNode.h"



@implementation MenuNode{
    NSMutableArray *sessoes;
    BOOL aberto;
    SKAction *abrirMenu;
    SKAction *fecharMenu;
    int nSecoes;
    NSString *secaoAtivo;
    SKLabelNode *lbltitulo;
    
}

- (NSMutableArray *)retornaSessoes{
    return sessoes;
}

- (id)initWithPosicaoAbrir : (CGPoint)abrir tamanho:(CGSize)tamanho{
    
    
    
    self = [super init];
    
    if (self) {
        
        
        // CONFIGURANDO POSICOES DO MENU
        
        
        CGPoint fechar = CGPointMake(abrir.x * (-1), abrir.y);
        
        abrirMenu = [SKAction moveToX:abrir.x duration:0.2];
        fecharMenu = [SKAction moveToX:fechar.x duration:0.2];
        
        self.position = fechar;
        
        // SETANDO TEXTURE, TAMANHO E NOME
        
        [self setTexture:[SKTexture textureWithImageNamed:@"livre-menu.png"]];
        self.size = tamanho;
        self.name = @"menu";
        
        // MENU INICIA FECHADO
        aberto = NO;
        
        
        // CONFIGURANDO SESSOES
        
        sessoes = [NSMutableArray array];
        
        nSecoes = 2;
        
        [self criarTodasSessoes];
        [self insereTodosIcones];
        
    }
    
    
    
    return self;
}


- (BOOL)getAberto{
    return aberto;
}


- (void)removeTodosIcones{
    
    for (IconeView *icone in self.scroll.subviews) {
        
        if ([icone isKindOfClass:[IconeView class]]) {
            [icone removeFromSuperview];
        }
        
    }
    
    
}


//METODO DO PROTOCOLO SecaoMenuDELEGATE

- (void)sessaoAtivada:(NSString *)titulo infoIcones:(NSMutableArray *)vetorInfoIcones{
    
    
    // VERIFICA SE A SECAO CLICADA É A MESMA
    if (![secaoAtivo isEqualToString:titulo]) {
        
        //SETA A SECAO CLICADA COMO SECAO ATIVA
        if (secaoAtivo != nil) {
            [[self retornaSessaoPorTitulo:secaoAtivo] ativarAnimacaoSecaoDesativada];
            [self removeTodosIcones];
            
        }
        
        [[self retornaSessaoPorTitulo:titulo] ativarAnimacaoSecaoAtivada];
        
        // SETANDO A NOVA VERSAO ATIVA
        secaoAtivo = titulo;
        
        // DELEGA A CRIACAO DE ICONES PARA A CENA
        
        NSMutableArray *icones = [self.myDelegate criarIconesVetorInfo:vetorInfoIcones categoria:titulo];
        
        //        CGPoint posicaoInicial;
        //        CGPoint posicaoMutavel;
        //        posicaoInicial = CGPointMake(0, 270);
        //        posicaoMutavel = posicaoInicial;
        
        
        
        CGRect posicaoInicial = CGRectMake(120, 20, 200, 200);
        
        
        
        
        for (IconeView *icone in icones) {
            
            
            [icone setFrame:posicaoInicial];
            
            [self.scroll addSubview:icone];
            
            posicaoInicial.origin.y += posicaoInicial.size.height;
            
            
            
            /*  IconeSecao *icone = [secao retornaIconeIndice:i];
             
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
             
             descomentar  */
            
        }
        
        self.scroll.contentSize = CGSizeMake(self.scroll.contentSize.width, (posicaoInicial.size.height * icones.count) + 30);
        
    }else{
        [[self retornaSessaoPorTitulo:titulo] ativarAnimacaoSecaoDesativada];
        [self removeTodosIcones];
        [self insereTodosIcones];
        
    }
    
}


-(void)insereTodosIcones{
    CGRect posicaoInicial = CGRectMake(120, 20, 200, 200);
    NSMutableArray *icones;
    int nIcones = 0;
    
    for(SessaoMenu *s in sessoes){
        icones = [self.myDelegate criarIconesVetorInfo:[s retornaInfoIcones] categoria:[s titulo]];
        
        for(IconeView *icone in icones){
            [icone setFrame:posicaoInicial];
            
            [self.scroll addSubview:icone];
            
            posicaoInicial.origin.y += posicaoInicial.size.height;
            
            nIcones++;
        }
    }
    
    self.scroll.contentSize = CGSizeMake(self.scroll.contentSize.width, (posicaoInicial.size.height * nIcones) + 30);

}

- (SessaoMenu *)retornaSessaoPorTitulo:(NSString *)titulo{
    
    
    for (SessaoMenu *secao in sessoes) {
        
        if ([secao.titulo isEqualToString:titulo]) {
            return secao;
        }
        
        
    }
    NSLog(@"ERRO nao retornou nenhuma secao");
    return nil;
    
}


- (void)criarTodasSessoes{
    
    CGPoint posicaoInicial = CGPointMake(-250, 405);
    
    for (int i = 0; i < nSecoes; i++) {
        
        
        SessaoMenu *novaSecao = [self criaSecaoIndice:i];
        [novaSecao setMyDelegate:self];
        
        //[novaSecao runAction:[SKAction rotateToAngle: -M_PI / 2 duration:0]];
        [novaSecao setPosition:posicaoInicial];
        [novaSecao inicializarAnimacoesMovimento];
        
        [self addChild:novaSecao];
        
        [sessoes addObject: novaSecao];
        
        posicaoInicial.y -= novaSecao.size.height;
    }
    
    
}

// CRIA SECOES DO MENU CONFORME O INDICE
- (SessaoMenu *)criaSecaoIndice:(int)indice{
    
    
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
    
    // SETANDO HIDDEN DO MENU
    [self.scroll setHidden:!aberto];
}

- (void)abrirMenu{
    
    [self runAction:abrirMenu];
    aberto = YES;
}

- (void)fecharMenu{
    
    [self runAction:fecharMenu];
    aberto = NO;
}

- (void)removeTudo{
    
    for (int i = 0; i < sessoes.count; i++) {
        SessaoMenu *secao = [sessoes objectAtIndex:i];
        secao.myDelegate = nil;
    }
    
    [sessoes removeAllObjects];
    [self removeAllChildren];
    [self removeAllActions];
    
}

@end
