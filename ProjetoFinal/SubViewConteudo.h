//
//  SubViewConteudo.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GerenciadorDeAssunto.h"
@interface SubViewConteudo : UIViewController <UIPageViewControllerDataSource>


{
    NSMutableArray *teoria;
    GerenciadorDeAssunto *gerenciadorDeAssuntos;
    
}

@property (strong, nonatomic) UIPageViewController *pageController;


@end
