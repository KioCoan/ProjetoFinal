//
//  LivreViewController.m
//  ProjetoFinal
//
//  Created by ANDRE NORIYUKI TOKUNAGA on 12/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "LivreViewController.h"

@interface LivreViewController (){

    SKView *viewLivre;
    UIView *novaView;
    
}

@end

@implementation LivreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	
    novaView = [[UIView alloc]initWithFrame:self.view.bounds];
    
    //[self.view addSubview:novaView];
    
    viewLivre = [[SKView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:viewLivre];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    CenaLivre *cena = [[CenaLivre alloc]init];
    
    [cena setSize: viewLivre.frame.size];
    //[cena setSize: viewExercicio.frame.size];
    
    [viewLivre presentScene:cena];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
