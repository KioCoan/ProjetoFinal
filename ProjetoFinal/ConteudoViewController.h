//
//  ConteudoViewController.h
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 29/06/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlteraAnimacaoDelegate.h"
#import "GerenciadorDeAssunto.h"
@interface ConteudoViewController : UIViewController <AlteraAnimacaoDelegate>
{
    GerenciadorDeAssunto *gerenciador;
}
@property (weak, nonatomic) IBOutlet UIView *myViewContainer;


@end
