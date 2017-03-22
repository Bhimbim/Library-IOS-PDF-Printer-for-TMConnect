//
//  FormatViewController.h
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// INTERFACE

@interface PaperFormatTMLISPAJ : UIPrintPageRenderer

    /* STRING */

    @property (nonatomic, weak) NSString *stringHeaderSPAJContent;
    @property (nonatomic, weak) NSString *stringHeaderSPAJLabel;
    @property (nonatomic, weak) NSString *stringImageLogo;
    @property (nonatomic, weak) NSString *stringHeaderSPAJShape;

@end
