//
//  ListaDeExerciciosViewController.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 13/07/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorDeAssunto.h"

@interface ListaDeExerciciosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    GerenciadorDeAssunto *gerenciador;
    
}

@end
