//
//  CenaLivre.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CenaLivre.h"
#import "SpriteOperadorNode.h"
#import "MenuNode.h"

@implementation CenaLivre{
    
    MenuNode *menu;
    SKNode *conteudoAtivo;
    SKSpriteNode *botaoMenu;
    SKSpriteNode *menuEdicao;
    NSArray *vetorTiposObjetos;
    NSMutableArray *vetorTextField;
    BOOL menuEditarAberto;
    int contadorVariavel;
    BOOL caixaDentroExcluir;
}


-(id)init{
    
    self = [super init];
    
    if (self) {
        
        //CONFIGURANDO CENA
        self.backgroundColor = [SKColor whiteColor];
        self.name = @"fundo";
        
        //CRIANDO BOTAO QUE ABRE MENU
        botaoMenu = [[SKSpriteNode alloc]initWithImageNamed:@"modo livre-09.png"];
        botaoMenu.position = CGPointMake(100, 100);
        botaoMenu.name = @"botaoMenu";
        botaoMenu.zPosition = -2;
        [self addChild:botaoMenu];
        
        
        //CRIANDO MENU
        menu = [[MenuNode alloc]initWithPosicaoAbrir:CGPointMake(245, 480) tamanho:CGSizeMake(490, 960)];
        
        [self addChild:menu];
        
        
        [self criaMenuEdicao];
        
        //ALLOCANDO VETOR TEXTFILED
        vetorTextField = [NSMutableArray array];
        
        //VETOR TIPOS OBJETOS
        vetorTiposObjetos = [NSArray arrayWithObjects:@"variavel",@"operadores", nil];
        
        
    }
    return self;
}

- (void)criaMenuEdicao{
    
    menuEdicao = [[SKSpriteNode alloc] initWithImageNamed:@"MenuEditarFundo.png"];
    [menuEdicao setSize:CGSizeMake(770, 70)];
    [menuEdicao setPosition:CGPointMake(385, 925)];
    
    
    //CRIANDO BOTAO OK
    SKSpriteNode *botaoOK = [[SKSpriteNode alloc]initWithImageNamed:@"MenuEditarBotao.png"];
    botaoOK.name = @"botaoOK";
    [botaoOK setPosition:CGPointMake(300, -3)];
    [botaoOK setSize:CGSizeMake(110, 50)];
    [menuEdicao addChild:botaoOK];
    
    
    //CRIANDO LABEL DO BOTAO OK
    SKLabelNode *lblOk = [[SKLabelNode alloc]initWithFontNamed:@"Helvetica"];
    lblOk.name = @"botaoOK";
    lblOk.fontColor = [SKColor whiteColor];
    lblOk.text = @"OK";
    lblOk.zPosition = 1;
    [lblOk setPosition:CGPointMake(botaoOK.position.x, botaoOK.position.y - 10)];
    [menuEdicao addChild:lblOk];
}

- (void)criandoTodosTextFields{
    
    CGRect bounds = CGRectMake(self.size.width * 0.05, self.size.height * 0.08, 250, 40);

    for (int i = 0; i < 2; i++) {
        UITextField *textField = [self criaTextFieldBounds:bounds];
        
        [self.view addSubview:textField];
        [vetorTextField addObject:textField];
        
        bounds.origin.x += bounds.size.width * 1.2;
        //bounds.origin.y += bounds.size.height * 1.5;
    }
    
}

- (UITextField *)criaTextFieldBounds:(CGRect)bounds{
    
    //CRIA E RETORNA APENAS UM TEXTFIELD
    UITextField *textField = [[UITextField alloc] initWithFrame:bounds];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:25.0];
    textField.placeholder = @"Insira o valor";
    textField.backgroundColor = [UIColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.clearsContextBeforeDrawing = YES;
    textField.delegate = self;
    textField.hidden = YES;
    
    
    return textField;
    
}

-(void)moveMenuEdicao{
    
    if (menuEditarAberto) {
        [menuEdicao removeFromParent];
        menuEditarAberto = NO;
    }else{
        [self addChild:menuEdicao];
        menuEditarAberto = YES;
    }
    
    
    
}

-(void)preparaTextField{
   /*
    int objeto;
    
    
    switch (objeto) {
        case 1:
            // Variavel
            [[vetorTiposObjetos objectAtIndex:0] setPlaceholder:[NSString stringWithFormat:@"insira nome"]];
            
            [vetorTiposObjetos objectAtIndex:0];
            break;
            
        default:
            break;
    }
    
    */
}

- (void)didMoveToView:(SKView *)view{
    
    [self criandoTodosTextFields];
    
}

- (void)rodaeMuda{
    
    //ANIMACAO BOTAO MENU
    
    SKAction *rodaBotao = [SKAction rotateByAngle:-M_PI duration:0.5];
    
    
    
    [botaoMenu runAction:rodaBotao completion:^{
        
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-10.png"];
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-11.png"];
        botaoMenu.size = botaoMenu.texture.size;
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-12.png"];
        
    }];
    
}

- (void)desrodaeDesmuda{
    
    //ANIMACAO BOTAO MENU
    
    SKAction *rodaBotao = [SKAction rotateByAngle:M_PI duration:0.5];
    
    
    
    [botaoMenu runAction:rodaBotao completion:^{
        
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-11.png"];
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-10.png"];
        botaoMenu.size = botaoMenu.texture.size;
        botaoMenu.texture = [SKTexture textureWithImageNamed:@"modo livre-09.png"];
        
    }];
    
    
    
}


- (SKAction *)retornaCrescerDiminuir:(BOOL)aumenta{
    
    //ANIMACAO QUE OCORRE QUANDO USUARIO CLICA NO ICONE
    
    if (aumenta) {
     return [SKAction scaleTo:1.1 duration:0.1];
    }
    
    return [SKAction scaleTo:1 duration:0.1];
    
    
}

-(void)tomaMinhaPosicao:(CGRect)posicaoCaixa{
    
    float xInicio = botaoMenu.frame.origin.x;
    float xFim = xInicio + botaoMenu.frame.size.width;
    float yInicio = botaoMenu.frame.origin.y;
    float yFim = yInicio + botaoMenu.frame.size.height;
    
    float xCaixaInicio = posicaoCaixa.origin.x;
    float xCaixaFim = xCaixaInicio + posicaoCaixa.size.width;
    float yCaixaInicio = posicaoCaixa.origin.y;
    float yCaixaFim = yCaixaInicio + posicaoCaixa.size.height;
    
    if (((xCaixaInicio >= xInicio && xCaixaInicio <= xFim) || (xCaixaFim >= xInicio && xCaixaInicio <= xFim)) && ((yCaixaInicio >= yInicio && yCaixaInicio <= yFim) || (yCaixaFim >= yInicio && yCaixaFim <= yFim))) {
        
        if (caixaDentroExcluir == NO) {
            caixaDentroExcluir = YES;
            [self rodaeMuda];
            return;
        }
        
    }else{
        if (caixaDentroExcluir == YES) {
            caixaDentroExcluir = NO;
            [self desrodaeDesmuda];
            return;
        }
    }
    
}

-(void)criarVariavelTipo:(NSString *)tipo posicao:(CGPoint)posicao{
    
    SpriteCaixaNode *caixa = [[SpriteCaixaNode alloc]init];
    
    
    [caixa setDono:self];
    [caixa setPosition:posicao];
    caixa.name = @"variavel";
    [caixa setMyDelegate:self];
    //caixa.size = CGSizeMake(50, 50);
    caixa.zPosition = -1;
    [caixa setLabelTipo:tipo];
    [caixa setLabelEndereco:++contadorVariavel];
    [self addChild:caixa];
    
}

-(void)criarOperadorNaPosicao:(CGPoint)posicao{
    
    SpriteOperadorNode *operador = [[SpriteOperadorNode alloc]init];
    
    [operador setDono:self];
    [operador setPosition:posicao];
    //caixa.size = CGSizeMake(200, 200);
    operador.zPosition = -1;
    [self addChild:operador];
    
}

-(void)criaObjetoPosicao:(CGPoint)posicao{
    
    IconeSecao *icone = (IconeSecao *)conteudoAtivo;
    
    [icone runAction:[SKAction moveTo:icone.posicaoAnterior duration:0]];
    
    
    if ([icone.secao isEqualToString:@"variavel"]) {
        
        [self criarVariavelTipo:icone.tipo posicao:posicao];
    }else if ([icone.secao isEqualToString:@"operador"]){
        [self criarOperadorNaPosicao:posicao];
    }
    
    
    
}

- (void)identificaNodeGeraAcao{
    
    if ([conteudoAtivo.name isEqualToString:@"botaoMenu"]) {
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
        
        
    }else if ([menu getAberto] && [conteudoAtivo.name isEqualToString:@"fundo"]){
        [menu abrirFechar];
        [self.myDelegate esconderNavigationController: [menu getAberto]];
    }else if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]){
        [conteudoAtivo runAction:[self retornaCrescerDiminuir:YES]];
    }else if ([conteudoAtivo.name isEqualToString:@"variavel"] && menuEditarAberto){
        [self moveMenuEdicao];
    }

    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location =  [touch locationInNode:self];
    
    conteudoAtivo = [self nodeAtPoint:location];
    
    [self identificaNodeGeraAcao];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        CGPoint location = [touch locationInNode:menu];
        [conteudoAtivo setPosition:location];
        
        
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([conteudoAtivo.name isEqualToString:@"iconeMenu"]) {
        
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        
        float xInicio = menu.frame.origin.x;
        float xFim = xInicio + menu.frame.size.width;
        float yInicio = menu.frame.origin.y;
        float yFim = yInicio + menu.frame.size.height;
        

        if ((location.x >= xInicio && location.x <= xFim) && (location.y >= yInicio && location.y <= yFim)) {
            
            
            IconeSecao *icone = (IconeSecao *)conteudoAtivo;
            [icone runAction:[SKAction moveTo:icone.posicaoAnterior duration:0.3]];
            [icone runAction:[self retornaCrescerDiminuir:NO]];
            
            
        }else{
            
            [self criaObjetoPosicao:location];
            
            [menu abrirFechar];
            [self.myDelegate esconderNavigationController: [menu getAberto]];
            
            
        }
        
        
        
    }
    conteudoAtivo = nil;
    
}

@end
