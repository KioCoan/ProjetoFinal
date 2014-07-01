//
//  Assunto.m
//  ProjetoFinal
//
//  Created by Kio Coan on 30/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "Assunto.h"

@implementation Assunto

-(void)addExercicio:(Exercicio *)exercicio{
    [self.exercicios addObject:exercicio];
}

@end
