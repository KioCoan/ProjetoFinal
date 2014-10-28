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
    SKLabelNode *lbltitulo;
    UIScrollView *menuScroll;
    UIGestureRecognizer *panGesture;
}

- (BOOL)getAberto{
    return aberto;
}

- (UIScrollView *)retornaMenuScroll{
    
    
    return menuScroll;
    
}

- (void)iniciarPanGesture{
    
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(acaoDoGesture:)];
    
    
    
    
}

-(IBAction)acaoDoGesture:(UIPanGestureRecognizer*)recognizer{
    
    SecaoMenu *secao = [self retornaSecaoPorTitulo:secaoAtivo];
    
    CGPoint point = [recognizer locationInView:menuScroll];
    //[self insereNode:point];
    //[ setCenter:point];
    
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
       // lblNode.center = CGPointMake(50, 100);
    }
}

- (void)iniciarScroll{

    menuScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(70, 100, 400, 900)];
    [menuScroll setBackgroundColor:[UIColor blueColor]];
    [menuScroll setContentSize:CGSizeMake(menuScroll.frame.size.width, menuScroll.frame.size.height * 2)];
}

//METODO DO PROTOCOLO SecaoMenuDELEGATE
- (void)fuiClicado:(NSString *)titulo{
    
    // VERIFICA SE A SECAO CLICADA É A MESMA
    if (![secaoAtivo isEqualToString:titulo]) {
        
        //SETA A SECAO CLICADA COMO SECAO ATIVA
        
        if (secaoAtivo != nil) {
            SecaoMenu *secaoAntiga = [self retornaSecaoPorTitulo:secaoAtivo];
            
            
            [secaoAntiga removeTodosIcones2];
        }
        
        SecaoMenu *secao = [self retornaSecaoPorTitulo:titulo];
        secaoAtivo = secao.titulo;
        lbltitulo.text = titulo;
        lbltitulo.alpha = 1;
        
        CGPoint posicaoInicial;
        CGPoint posicaoMutavel;
        posicaoInicial = CGPointMake(0, 270);
        posicaoMutavel = posicaoInicial;
        
      CGRect minhaPosicao = CGRectMake(120, 20, 200, 200);
        
        
        for (int i = 0; i < [secao retornaNumeroIcones];i++) {
            
            UIImageView *iconeView = [secao retornaIconeIndice2:i];
            [iconeView setFrame:minhaPosicao];
            
            [menuScroll addSubview: iconeView];
            
            minhaPosicao.origin.y += minhaPosicao.size.height;
            
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


- (id)initWithPosicaoAbrir : (CGPoint)abrir tamanho:(CGSize)tamanho{
    
    CGPoint fechar = CGPointMake(abrir.x * (-1), abrir.y);
    
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
    
    lbltitulo = [[SKLabelNode alloc]initWithFontNamed:@"Helvetica"];
    lbltitulo.fontColor = [SKColor whiteColor];
    lbltitulo.fontSize = 60;
    lbltitulo.position = CGPointMake(-40, 390);
    lbltitulo.alpha = 0;
    [self addChild:lbltitulo];
    
    
    return self;
}

- (void)criarTodasSecoes{
    
    CGPoint posicaoInicial = CGPointMake(-220, 405);
    
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

- (void)removeTudo{
    
    for (int i = 0; i < secoes.count; i++) {
        SecaoMenu *secao = [secoes objectAtIndex:i];
        secao.myDelegate = nil;
    }
    
    [secoes removeAllObjects];
    [self removeAllChildren];
    [self removeAllActions];
    
}

@end
