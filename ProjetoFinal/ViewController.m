//
//  ViewController.m
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 23/05/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setMeuNo:[[SKSpriteNode alloc]init] ];
    //[self.view addSubview:self.meuNo];
    SKScene *cena = [[SKScene alloc]initWithSize:CGSizeMake(self.minhaCena.frame.size.width, self.minhaCena.frame.size.height)];
    [cena setPosition:self.minhaCena.center];
    [cena setBackgroundColor:[UIColor whiteColor]];
    SKTexture *textura = [SKTexture textureWithImageNamed:@"gParada.png"];
    [self.meuNo setTexture:textura];
    
    [self.meuNo setSize:CGSizeMake(50, 50)];
    [self.meuNo setPosition:CGPointMake(cena.size.width / 2, cena.size.height / 2)];
    
    //[cena addChild:self.meuNo];
    
    SKLabelNode *label = [[SKLabelNode alloc] init];
    [label setText:@"Testando SKLabelNode"];
    [label setPosition:CGPointMake(cena.size.width / 2, cena.size.height / 2)];
    
    
    [label setFontColor:[UIColor blackColor]];
    [cena addChild:label];
    
    [self.minhaCena presentScene:cena];
    
    
    self.minhaLabel.text = label.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mudarLabel:(id)sender {
    [self.minhaCena presentScene:nil];
}
@end
