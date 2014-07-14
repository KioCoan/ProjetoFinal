//
//  Exercicio.h
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>


// Classe genérica para criação de exercícios 

@interface Exercicio : NSObject

{
    SKScene *cenaExercicio; // Vai ser instanciado conforme o exercício
}
@property NSString *tituloExercicio,*descricaoExercicio;
@property UIImage* icone;

-(void)instanciaCena;
-(SKScene*)retornaCena;
@end
