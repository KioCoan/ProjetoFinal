//
//  ExeVariavel2.m
//  ProjetoFinal
//
//  Created by Henrique Pereira de Lima on 07/08/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ExeVariavel2.h"

@implementation ExeVariavel2


-(id)init{
    self = [super init];
    // ao inicializar o exercício ele seta o título e a descrição do mesmo
    if (self) {
        self.tituloExercicio = [NSString stringWithFormat:@"Teste"];
        self.descricaoExercicio = [NSString stringWithFormat:@"Teste"];
    }
    return self;
}


-(void)instanciaCena{
    cenaExercicio = [[CenaExercicioVariavel2 alloc] init];
}





@end
