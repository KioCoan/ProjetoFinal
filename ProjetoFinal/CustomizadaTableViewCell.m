//
//  CustomizadaTableViewCell.m
//  ProjetoFinal
//
//  Created by Rafael Aparecido de Freitas on 27/09/14.
//  Copyright (c) 2014 SENAC - iOS. All rights reserved.
//

#import "CustomizadaTableViewCell.h"
#import "GerenciadorDesafios.h"
@implementation CustomizadaTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}


-(void)setNeedsLayout{
    [super setNeedsLayout];
    GerenciadorDesafios *gerenciador = [GerenciadorDesafios sharedGerenciador];
    [[self titulo]setFont:[UIFont fontWithName:FONT_LIGHT size:40]];
    [[self descricao]setFont:[UIFont fontWithName:FONT_LIGHT size:25]];
    self.contentView.backgroundColor = [gerenciador retornaCorDesafioAtual];
    NSLog(@"%@",[gerenciador retornaCorDesafioAtual]);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
