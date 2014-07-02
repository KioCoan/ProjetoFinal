//
//  SubViewConteudoFilho.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorDeAssunto.h"

@interface SubViewConteudoFilho : UIViewController
{
    GerenciadorDeAssunto *gerenciadorDeAssuntos;
    NSMutableArray *teoria;
    __weak IBOutlet UITextView *txtConteudo;
}
@property (assign, nonatomic) NSInteger index;
//@property (strong, nonatomic) IBOutlet UILabel *screenNumber;
//@property (weak, nonatomic) IBOutlet UILabel *screenNumber;

@property (weak, nonatomic) IBOutlet UILabel *lblConteudo;

@end
