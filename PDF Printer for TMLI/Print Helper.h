//
//  Print HelperViewController.h
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// INTERFACE

@interface PrintHelper : NSObject

    /* PRINT FROM PAGE RENDERER */

    - (NSData*) printToPDF: (UIPrintPageRenderer *) printPageRenderer;

@end
