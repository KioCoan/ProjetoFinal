//
//  ExeVariavel1.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 14/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "ExeVariavel1.h"
#import "CenaExercicioVariavel1.h"
@implementation ExeVariavel1


-(id)init{
    self = [super init];
    
    if (self) {
        self.tituloExercicio = [NSString stringWithFormat:@"Movendo valores para suas respectivas variáveis"];
        self.descricaoExercicio = [NSString stringWithFormat:@"Arraste os valores para cima das variáveis de acordo com o tipo de dado."];
    }
    return self;
}


-(void)instanciaCena{
    cenaExercicio = [[CenaExercicioVariavel1 alloc] init];
    
    
}
-(SKScene*)retornaCena{
    return cenaExercicio;
}



@end
