//
//  PrincipalViewController.h
//  Threads
//
//  Created by Rafael Brigagão Paulino on 24/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imagem1;
@property (nonatomic, weak) IBOutlet UIImageView *imagem2;
@property (nonatomic, weak) IBOutlet UIImageView *imagem3;
@property (nonatomic, weak) IBOutlet UIImageView *imagem4;

//botoes
@property (nonatomic, weak) IBOutlet UIButton *botaoBaixar;
@property (nonatomic, weak) IBOutlet UIButton *botaoBaixarMultithreads;

//carregando
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *indicador;

-(IBAction)baixarFotosClicado:(id)sender;

@end
