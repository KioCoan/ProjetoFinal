//
//  AnimaCondSimples.m
//  ProjetoFinal
//
//  Created by Felipe Costa Nascimento on 26/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "AnimaCondSimples.h"

static const  uint32_t bolinhaCatergory = 0x1 << 0;
static const  uint32_t condicaoCatergory = 0x1 << 1;

@implementation AnimaCondSimples

-(id)init{
    if(self = [super init]){
        SpriteCondicaoNode *teste = [[SpriteCondicaoNode alloc] initWithTipoDeCondicao:SE_SENAO];
        [teste setSize:CGSizeMake(300, 100)];
        [teste setPosition:CGPointMake(500, 300)];
        [teste setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:teste.size]];
        [[teste physicsBody] setCategoryBitMask:condicaoCatergory];
        [[teste physicsBody] setContactTestBitMask:bolinhaCatergory];
        [[teste physicsBody] setDynamic:NO];
        
        [[self physicsWorld] setContactDelegate:self];
        [[self physicsWorld] setGravity:CGVectorMake(0, -5)];
        [self addChild:teste];
        [self inicializarlabels];
        [self setBackgroundColor:[SKColor whiteColor]];
    }
    
    return self;
}

-(void)inicializarlabels{
    CGPoint posicoes = CGPointMake(50, 540);
    
    nota1 = [self criarLabelComTexto:@"nota1 <-" tipo:@"float" posicao:posicoes];
    [self addChild:nota1];
    
    posicoes.y -= 35;
    nota2 = [self criarLabelComTexto:@"nota2 <-" tipo:@"float" posicao:posicoes];
    [self addChild:nota2];
    
    posicoes.y -= 35;
    media = [self criarLabelComTexto:@"media <- (nota1 + nota2) / 2" tipo:@"float" posicao:posicoes];
    [self addChild:media];
}


-(SpriteLabelNode*)criarLabelComTexto:(NSString*)texto tipo:(NSString*)tipo posicao:(CGPoint)posicao{
    SpriteLabelNode *novoLabel = [[SpriteLabelNode alloc] initWithType:tipo texto:texto];
    [novoLabel setFontName:@"Helvetica"];
    [novoLabel setPosition:posicao];
    [novoLabel setFontSize:18];
    [novoLabel showTipo];
    [novoLabel setName:@"teste"];
    [novoLabel setFontColor:[SKColor blackColor]];
    [novoLabel setHorizontalAlignmentMode:SKLabelHorizontalAlignmentModeLeft];
    
    return novoLabel;
}


-(void)didMoveToView:(SKView *)view{
    CGRect frame = CGRectMake(20, 75, 100, 30);
    frame.origin.x += frame.size.width + 20;
    int numLabels = 2;
    
    for(int i=0; i<numLabels; i++){
        [self criarTextField:frame texto:@"5"];
        
        frame.origin.y -= 35;
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint posicao = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:posicao];
    
    if([node.name isEqualToString:@"teste"]){
        [self testes];
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    //if(!jaPingou){
    //[[contact bodyB] applyImpulse:CGVectorMake(-7, -5)];
        [[contact bodyB] applyImpulse:CGVectorMake(11, 15)];
    //}
    

}

-(void)testes{
    SKSpriteNode *teste = [[SKSpriteNode alloc] initWithImageNamed:@"atualizar-dados.png"];
    [teste setSize:CGSizeMake(60, 60)];
    [teste setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:teste.size.width / 2]];
    [teste setPosition:CGPointMake(410, 600)];
    [[teste physicsBody] setRestitution:0.5];
    [[teste physicsBody] setDynamic:YES];
    

    [self addChild:teste];

    
    CGMutablePathRef path = CGPathCreateMutable();
    if (pontos && pontos.count > 0) {
        CGPoint p = [(NSValue *)[pontos objectAtIndex:0] CGPointValue];
        CGPathMoveToPoint(path, nil, p.x, p.y);
        for (int i = 1; i < pontos.count; i++) {
            p = [(NSValue *)[pontos objectAtIndex:i] CGPointValue];
            CGPathAddLineToPoint(path, nil, p.x, p.y);
        }
    }
    
    //CGPathRef circle = CGPathCreateWithEllipseInRect(CGRectMake(100,100,50,50), NULL);

//    SKAction *followTrack = [SKAction followPath:path asOffset:NO orientToPath:YES duration:5.0];
//    SKAction *forever = [SKAction repeatActionForever:followTrack];
//    [teste runAction:forever];
}

-(void)criarTextField:(CGRect)frame texto:(NSString*)texto{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.font = [UIFont systemFontOfSize:17.0];
    textField.backgroundColor = [SKColor whiteColor];
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    textField.text = texto;
    
    
    [self.view addSubview:textField];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];

    return YES;
}

@end
