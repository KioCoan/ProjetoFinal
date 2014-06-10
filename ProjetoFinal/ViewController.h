//
//  ViewController.h
//  ProjetoFinal
//
//  Created by RAFAEL APARECIDO DE FREITAS on 23/05/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController : UIViewController

@property SKSpriteNode *meuNo;
@property (weak, nonatomic) IBOutlet SKView *minhaCena;

@property (weak, nonatomic) IBOutlet UILabel *minhaLabel;


- (IBAction)mudarLabel:(id)sender;

@end
