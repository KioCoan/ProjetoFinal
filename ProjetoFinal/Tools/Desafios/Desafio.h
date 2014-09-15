//
//  Desafio.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 15/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Desafio : NSObject

{
    int nTasks, nivel;
    NSMutableArray *listaDesafios;
    NSString *tipo;
}

-(id)initWithLevel:(int)nivel andType:(NSString*)tipo andTasks:(int)tasks;
-(int)nTarefas;

@end
