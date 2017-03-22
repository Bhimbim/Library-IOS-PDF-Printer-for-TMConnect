//
//  Print HelperViewController.m
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import "Print Helper.h"


// IMPLEMENTATION

@implementation PrintHelper

    /* PRINT FROM PAGE RENDERER */

    - (NSData*) printToPDF: (UIPrintPageRenderer *) printPageRenderer
    {
        NSMutableData *dataPDF = [NSMutableData data];
        
        UIGraphicsBeginPDFContextToData( dataPDF, printPageRenderer.paperRect, nil );
        
        [printPageRenderer prepareForDrawingPages: NSMakeRange(0, printPageRenderer.numberOfPages)];
        
        CGRect boundsPDF = UIGraphicsGetPDFContextBounds();
        
        for ( int i = 0 ; i < printPageRenderer.numberOfPages ; i++ )
        {
            UIGraphicsBeginPDFPage();
            
            [printPageRenderer drawPageAtIndex: i inRect: boundsPDF];
        }
        
        UIGraphicsEndPDFContext();
        
        return dataPDF;
    }

@end
