//
//  Conteudo.h
//  Exercicio
//
//  Created by Henrique Pereira de Lima on 08/07/14.
//  Copyright (c) 2014 Henrique Pereira de Lima. All rights reserved.
//

// ##### Classe Especializada utilizada pelo exercício 1 de variáveis ######


#import <SpriteKit/SpriteKit.h>

@interface SpriteLabelNode : SKLabelNode

@property NSString *tipo;
@property CGPoint posicaoInicial;

- (id)initWithType:(NSString *)tipo texto:(NSString *)texto;

@end
