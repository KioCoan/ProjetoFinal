//
//  MyScene.m
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 07/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import "Exercicio1Variavel.h"

@implementation Exercicio1Variavel{
    NSMutableArray *caixas;
    NSMutableArray *conteudos;
    ConteudoDasCaixas *conteudoAtivo;
    NSArray *sprite;
    SKAction *executaSprite;
    NSArray *tipo;
}


-(id)init{
    self = [super init];
    
    if (self) {
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.physicsWorld.contactDelegate = self;
        
        tipo = [NSArray arrayWithObjects:@"inteiro",@"real",@"caractere",@"logico", nil];
        
        
        [self criarCaixas];
        [self criarLabels];
    }
    return self;
}

//-(id)initWithSize:(CGSize)size {    
//    if (self = [super initWithSize:size]) {
//        /* Setup your scene here */
//        
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//        self.physicsWorld.contactDelegate = self;
//        
//        tipo = [NSArray arrayWithObjects:@"inteiro",@"real",@"caractere",@"logico", nil];
//        
//        
//        //[self criarCaixas];
//        [self criarLabels];
//        
//
//    }
//    return self;
//}

- (void)criarLabels{
    
    // criando vetor e labels
    
    
    
    
    conteudos = [NSMutableArray array];
    
    
    [conteudos addObject:[[ConteudoDasCaixas alloc] initWithType:@"inteiro" texto:@"23"]];
    [conteudos addObject:[[ConteudoDasCaixas alloc] initWithType:@"real" texto:@"3.5"]];
    [conteudos addObject:[[ConteudoDasCaixas alloc] initWithType:@"caractere" texto:@"\"João \""]];
    [conteudos addObject:[[ConteudoDasCaixas alloc] initWithType:@"logico" texto:@"falso"]];
    

    
    
    //embaralhando labels
    
    conteudos = [self embaralha:conteudos];
    
    // criando e inserindo posicoes
    
    CGPoint posicaoOriginal = CGPointMake(self.frame.size.width * 0.85, self.frame.size.height * 0.8);
    CGPoint posicao = posicaoOriginal;
    int font = self.frame.size.height * 0.03;
    
    for (int i = 0; i < conteudos.count; i++) {

        
        [[conteudos objectAtIndex:i] setFontSize:font];
        
        [[conteudos objectAtIndex:i] setPosition:posicao];
        
        
        
        posicao.y -= (font * 5) ;
        
        [self addChild:[conteudos objectAtIndex:i]];
        
    }
    
    
}

- (NSMutableArray *)embaralha : (NSMutableArray *)antigo{
    
    int n;
    NSMutableArray *novo = [NSMutableArray array];
    
    while (antigo.count > 0) {
        n = arc4random() % antigo.count;
        
        [novo addObject:[antigo objectAtIndex:n]];
        [antigo removeObjectAtIndex:n];
    }
    
    
    
    
    return novo;
    
    
    
}

- (void)criarCaixas{
    
    // Criar as caixas
    caixas = [NSMutableArray array];
    CGSize tamanho = CGSizeMake(self.frame.size.height * 200, self.frame.size.height * 213);
    //CGSize tamanho = CGSizeMake(200, 213.6);
    
    [caixas addObject:[[SpriteCaixaNode alloc] initWithConteudo:@"23" Nome:@"idade" Tipo:@"inteiro" tamanho:tamanho]];
    [caixas addObject:[[SpriteCaixaNode alloc] initWithConteudo:@"3.2" Nome:@"nota" Tipo:@"real" tamanho:tamanho]];
    [caixas addObject:[[SpriteCaixaNode alloc] initWithConteudo:@"\"João\"" Nome:@"nome" Tipo:@"caractere" tamanho:tamanho]];
    [caixas addObject:[[SpriteCaixaNode alloc] initWithConteudo:@"falso" Nome:@"aprovado" Tipo:@"logico" tamanho:tamanho]];
    
    //embaralha ordem das caixas
    caixas = [self embaralha:caixas];
    
    //criando e inserindo posicoes
    
    CGPoint primeiraPosicao = CGPointMake(self.frame.size.width * 200.0, self.frame.size.height * 600.0);
    
    CGPoint posicao = primeiraPosicao;
    NSLog(@"x = %f, y = %f",self.frame.size.width,self.frame.size.height);
    for (int i = 0; i < caixas.count; i++) {
        
        // caixas do lado direito
        if (i == 2) {
            
            posicao = primeiraPosicao;
            posicao.x += tamanho.width * 1.2;
            [[caixas objectAtIndex:i] setPosition:posicao];
            posicao.y -= tamanho.height * 1.15;
            
            
            
        }else{
            [[caixas objectAtIndex:i] setPosition:posicao];
            posicao.y -= tamanho.height * 1.15;
            
        }
        
        // inserindo nó
        [self addChild:[caixas objectAtIndex:i]];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    self.movendoCaixa = true;
    
   
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    conteudoAtivo = (ConteudoDasCaixas *) [self nodeAtPoint:location];
    //SKNode *node = [self nodeAtPoint:location];
    
    location.y = (location.y* (500.0f / 500.0f));
    
    //SE A POSIÇÃO QUE FOI CLICADA É A MESMA DO SPRITE DA CAIXA, O SPRITE É MOVIDO
    
    if ([conteudoAtivo.name isEqualToString:@"conteudo"]) {
        [conteudoAtivo setPosition:location];
        //NSLog(@"tipo %d", conteudoAtivo.tipo);
    }else{
        conteudoAtivo = nil;
    }
    
    
   // NSLog(@"tipo caixa: %d",[caixa tipo]);
    
        
    //}

    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (conteudoAtivo) {
       
        for (SpriteCaixaNode * c in caixas) { //Ao soltar o node de resposta em algum lugar varre o vetor de caixas para descobrir sobre quem está
            float xInicio = c.frame.origin.x;
            float xFim = xInicio + c.frame.size.width;
            float xMeio = (xInicio + xFim)/2;
            float yInicio = c.frame.origin.y;
            float yFim = yInicio + c.frame.size.height;
            float yMeio = (yInicio + yFim)/2;
            
            if ((conteudoAtivo.position.x > xInicio && conteudoAtivo.position.x < xFim)&&(conteudoAtivo.position.y >yInicio && conteudoAtivo.position.y < yFim)) { // Verifica se o nó "resposta" está sobre alguma caixa
                
                if ([[conteudoAtivo tipo] isEqualToString: [c retornaTipo]]) { // Caso a resposta esteja correta (Nó de resposta no local correto)
                    
                    //Ação a ser feita caso a resposta esteja correta
                    [c abreCaixa];
                    [conteudoAtivo removeFromParent];
                    NSLog(@"Ta ceeeeerto!");
                    conteudoAtivo = nil;
                }
                
                [conteudoAtivo setPosition:CGPointMake(xMeio, yMeio)]; //Coloca o node no centro da caixa
            }
            
        }
        
        
        
    }
    
    
}
/*

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    if (!self.movendoCaixa) {
        NSLog(@"funcionou");
    }
    
    
    
}

- (void)selectNodeForTouch:(CGPoint)touchLocation {
    
    
    SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:touchLocation];
    
    //2
	if(![_selectedNode isEqual:touchedNode]) {
		[_selectedNode removeAllActions];
		[_selectedNode runAction:[SKAction rotateToAngle:0.0f duration:0.1]];
        
		_selectedNode = touchedNode;
		//3
		if([[touchedNode name] isEqualToString:@"conteudo"]) {
			SKAction *sequence = [SKAction sequence:@[[SKAction rotateByAngle:degToRad(-4.0f) duration:0.1],
													  [SKAction rotateByAngle:0.0 duration:0.1],
													  [SKAction rotateByAngle:degToRad(4.0f) duration:0.1]]];
			//[_selectedNode runAction:[SKAction repeatActionForever:sequence]];
		}
	}

    
}

float degToRad(float degree) {
	return degree / 180.0f * M_PI;
}

- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winSize = self.size;
    CGPoint retval = newPos;
    retval.x = MIN(retval.x, 0);
    retval.x = MAX(retval.x, -[self size].width+ winSize.width);
    retval.y = [self position].y;
    return retval;
}

- (void)panForTranslation:(CGPoint)translation {
    CGPoint position = [_selectedNode position];
    if([[_selectedNode name] isEqualToString:@"conteudo"]) {
        [_selectedNode setPosition:CGPointMake(position.x + translation.x, position.y + translation.y)];
    } else {
        CGPoint newPos = CGPointMake(position.x + translation.x, position.y + translation.y);
        [self setPosition:[self boundLayerPos:newPos]];
    }
}

- (void)didMoveToView:(SKView *)view {
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [[self view] addGestureRecognizer:gestureRecognizer];
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer {
	if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        
        touchLocation = [self convertPointFromView:touchLocation];
        
        [self selectNodeForTouch:touchLocation];
        
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [recognizer translationInView:recognizer.view];
        translation = CGPointMake(translation.x, -translation.y);
        [self panForTranslation:translation];
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        if (![[_selectedNode name] isEqualToString:@"conteudo"]) {
            float scrollDuration = 0.2;
            CGPoint velocity = [recognizer velocityInView:recognizer.view];
            CGPoint pos = [_selectedNode position];
            CGPoint p = mult(velocity, scrollDuration);
            
            CGPoint newPos = CGPointMake(pos.x + p.x, pos.y + p.y);
            newPos = [self boundLayerPos:newPos];
            [_selectedNode removeAllActions];
            
            SKAction *moveTo = [SKAction moveTo:newPos duration:scrollDuration];
            [moveTo setTimingMode:SKActionTimingEaseOut];
            [_selectedNode runAction:moveTo];
        }
        
    }
}

CGPoint mult(const CGPoint v, const CGFloat s) {
	return CGPointMake(v.x*s, v.y*s);
}

*/

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
@end
