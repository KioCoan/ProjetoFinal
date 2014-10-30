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
        
        nSecoes = 1;
        
        [self criarTodasSessoes];
        
//        lbltitulo = [[SKLabelNode alloc]initWithFontNamed:@"Helvetica"];
//        lbltitulo.fontColor = [SKColor whiteColor];
//        lbltitulo.fontSize = 60;
//        lbltitulo.position = CGPointMake(-40, 390);
//        lbltitulo.alpha = 0;
//        [self addChild:lbltitulo];
        
        
        
    }
    
    
    
    return self;
}


- (BOOL)getAberto{
    return aberto;
}


- (void)posiciona{
    
    // metodo teste
    /*
    CGRect minhaPosicao = CGRectMake(120, 20, 200, 200);
    
    
    for (UIImageView *imagem in self.imagensIcones) {
        
        imagem.frame = minhaPosicao;
        [imagem addGestureRecognizer:self.panGesture];
        [self.menuScroll addSubview:imagem];
        
        minhaPosicao.origin.y *= 2;
    }

   */
    
}

- (void)removeTodosIcones{
    
    for (UIView *iconeView in self.menuScroll.subviews) {
        [iconeView removeFromSuperview];
    }
    
    
}


//METODO DO PROTOCOLO SecaoMenuDELEGATE
- (void)sessaoAtivada:(NSString *)titulo{
    
    // VERIFICA SE A SECAO CLICADA É A MESMA
    if (![secaoAtivo isEqualToString:titulo]) {
        
        //SETA A SECAO CLICADA COMO SECAO ATIVA
        if (secaoAtivo != nil) {
            [self removeTodosIcones];
            
        }
        
        
        // PEGANDO SESSAO SELECIONADA PELO USUARIO
        SessaoMenu *sessaoSelecionada = [self retornaSessaoPorTitulo:titulo];
        secaoAtivo = sessaoSelecionada.titulo;
        
        // PEGANDO ICONES DA SESSAO
        
        NSMutableArray *icones = [sessaoSelecionada retornaIcones];
        
//        CGPoint posicaoInicial;
//        CGPoint posicaoMutavel;
//        posicaoInicial = CGPointMake(0, 270);
//        posicaoMutavel = posicaoInicial;
        
      CGRect posicaoInicial = CGRectMake(120, 20, 200, 200);
        
        
        for (UIImageView *icone in icones) {
            
            
            [icone setFrame:posicaoInicial];
            
            //[icone addGestureRecognizer:self.panGesture];
            
            [self.menuScroll addSubview:icone];
            
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
    
   
    
    
    
   
    
    
    //for (SecaoMenu *secao in secoes){
        
        NSLog(@"titulo %@ -- tituloParametro %@",sessaoSelecionada.titulo,titulo);
        
        //if ([secao.titulo isEqualToString:titulo]) {
            
            
    
                
                
            //}

            
            
            return;
        //}
        
        
    }
    
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
    
    CGPoint posicaoInicial = CGPointMake(-220, 405);
    
    for (int i = 0; i < nSecoes; i++) {
        
        
        SessaoMenu *novaSecao = [self criaSecaoIndice:i];
        [novaSecao setMyDelegate:self];
        
        [novaSecao runAction:[SKAction rotateToAngle: -M_PI / 2 duration:0]];
        [novaSecao setPosition:posicaoInicial];
        
        [self addChild:novaSecao];
        
        [sessoes addObject: novaSecao];
        
        posicaoInicial.y -= novaSecao.size.width;
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
