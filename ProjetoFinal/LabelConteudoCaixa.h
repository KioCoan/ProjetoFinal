//
//  Conteudo.h
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 08/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LabelConteudoCaixa : SKLabelNode

@property NSString *tipo;
@property CGPoint posicaoInicial;

- (id)initWithType:(NSString *)tipo texto:(NSString *)texto;

@end
