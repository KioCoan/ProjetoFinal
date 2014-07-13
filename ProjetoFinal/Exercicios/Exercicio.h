//
//  Exercicio.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface Exercicio : SKScene <SKPhysicsContactDelegate>

@property NSString *tituloExercicio,*descricaoExercicio;
@property UIImage* icone;



@end
