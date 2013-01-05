//
//  PrincipalViewController.m
//  Threads
//
//  Created by Rafael Brigagão Paulino on 24/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()
{
    //declarando aqui ele fica privado
    //variaveis visiveis apenas a essa classe
    
    int qtdeFoTosBaixadas;
}
@end

@implementation PrincipalViewController

-(IBAction)baixarFotosClicado:(id)sender
{
    _imagem1.image = nil;
    _imagem2.image = nil;
    _imagem3.image = nil;
    _imagem4.image = nil;
    
    _indicador.hidden = NO;
    
    qtdeFoTosBaixadas = 0;
    
    //o sender e o bojeto na tela que disparou este evento
    //id e um tipo generico de dados
    if (sender == _botaoBaixar){
        //iniciar o metodo com uma unica thread (thread e a linha de processamento, o que sera processado no momento)
        
        //endereco da imagem
        NSURL *url = [NSURL URLWithString:@"http://www.hdcarwallpapers.com/walls/ferrari_hd_widescreen-wide.jpg"];
        
        //nsdata sao dados binarios que representam os objetos
        NSData *dadosImagem = [[NSData alloc] initWithContentsOfURL:url];
        
        //uiimage = a imagem que será carregada
        //imaem a partir dos dados baixados
        UIImage *foto1 = [UIImage imageWithData:dadosImagem];
        
        //associando a foto baixada ao imageView
        _imagem1.image = foto1;
        
        //imagem 2
        url = [NSURL URLWithString:@"http://1.bp.blogspot.com/--DOM08lguXU/TsV8GUQI0cI/AAAAAAAAFUQ/ZPCvlV76NVU/s1600/01.jpeg"];
        
        //nsdata sao dados binarios que representam os objetos
        dadosImagem = [[NSData alloc] initWithContentsOfURL:url];
        
        //uiimage = a imagem que será carregada
        //imaem a partir dos dados baixados
        UIImage *foto2 = [UIImage imageWithData:dadosImagem];
        
        //associando a foto baixada ao imageView
        _imagem2.image = foto2;
        
        
        //imagem 3
        url = [NSURL URLWithString:@"http://allthecars.files.wordpress.com/2011/05/chevrolet-vectra-collection-2011-01.jpg"];
        
        //nsdata sao dados binarios que representam os objetos
        dadosImagem = [[NSData alloc] initWithContentsOfURL:url];
        
        //uiimage = a imagem que será carregada
        //imaem a partir dos dados baixados
        UIImage *foto3 = [UIImage imageWithData:dadosImagem];
        
        //associando a foto baixada ao imageView
        _imagem3.image = foto3;
        
        
        //imagem 4
        url = [NSURL URLWithString:@"http://allthecars.files.wordpress.com/2011/09/chevrolet-cruze-2012-brasil-oficial-01.jpg"];
        
        //nsdata sao dados binarios que representam os objetos
        dadosImagem = [[NSData alloc] initWithContentsOfURL:url];
        
        //uiimage = a imagem que será carregada
        //imaem a partir dos dados baixados
        UIImage *foto4 = [UIImage imageWithData:dadosImagem];
        
        //associando a foto baixada ao imageView
        _imagem4.image = foto4;
        
    }
    else if (sender == _botaoBaixarMultithreads){
        //iniciar disparando varias threads (aqui vc faz varias linhas de processamento ao mesmo tempo porem secundarias (menos importantes))
        
        
        //iniciar uma nova thread usando o metodo definido no selector
        //selector = @selector(<nome do meotodo>:)
        //target = onde o selector esta implementado (self e no mesmo arquivo)
        //withObject = paramero que posso passar p/o metodo disparado
        [NSThread detachNewThreadSelector:@selector(downloadFoto:) toTarget:self withObject:_imagem1];
        [NSThread detachNewThreadSelector:@selector(downloadFoto:) toTarget:self withObject:_imagem2];
        [NSThread detachNewThreadSelector:@selector(downloadFoto:) toTarget:self withObject:_imagem3];
        [NSThread detachNewThreadSelector:@selector(downloadFoto:) toTarget:self withObject:_imagem4];
        
        //exercicio se quisermos baixar 4 fots diferentes?
        //precisa passar mais e um parametro no withOject do metodo acima
        //podemos usar um NSDictonary, com url e imageView
        
    };
}

//precisamos criar um novo mtodo que sera associado a nova thread
-(void)downloadFoto:(UIImageView*)imagem
{
    //arc nao atual muito bem em thread secundaria
    //criamos uma sintaxe para todos os obj criados por este metodo sejam dealocados no final do seu processamento paralelo
    @autoreleasepool {
        
        //pegando a url da imagem
        //NSString *urlImagem = [imagem objectForKey:@"url"];
        
        //endereco da imagem
        NSURL *url = [NSURL URLWithString:@"http://www.hdcarwallpapers.com/walls/ferrari_hd_widescreen-wide.jpg"];
    
        //nsdata sao dados binarios que representam os objetos
        NSData *dadosImagem = [[NSData alloc] initWithContentsOfURL:url];
    
        //uiimage = a imagem que será carregada
        //imaem a partir dos dados baixados
        UIImage *foto = [UIImage imageWithData:dadosImagem];
    
        //associando a foto baixada ao imageView
        imagem.image = foto;
    
        qtdeFoTosBaixadas++;
    
        if(qtdeFoTosBaixadas == 4){
            _indicador.hidden = YES;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
