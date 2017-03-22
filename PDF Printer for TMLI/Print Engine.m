//
//  PDF_Printer_for_TMLI_SPAJ.m
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import "Print Engine.h"
#import "Print Helper.h"
#import "Paper Format TMLI SPAJ.h"
#import "Paper Format TMLI SI.h"


// IMPLEMENTATION

@implementation PrintEngine

    /* INITIALIZATION */

    - (instancetype)init
    {
        self = [super init];
        
        if (self)
        {
            
        }
        else
        {
            
        }
        
        return self;
    }


    /* PRINT WITH INTERACTION CONTROLLER */

    - (void)printSPAJHTMLWithAutoPaging:(UIWebView *) webViewHTML stringPDFFileName:(NSString *)stringPDFFileName
    {
        /* INITIALIZATION */
        
        PrintHelper *objectPrintHelper = [[PrintHelper alloc] init];
        PaperFormatTMLISPAJ *objectPaperFormatTMLISPAJ = [[PaperFormatTMLISPAJ alloc] init];
        
        /* SET HEADER AND FOOTER */
        
        [self guardObjectInsert:_stringHeaderSPAJLabel stringObject:objectPaperFormatTMLISPAJ.stringHeaderSPAJLabel];
        [self guardObjectInsert:_stringHeaderSPAJShape stringObject:objectPaperFormatTMLISPAJ.stringHeaderSPAJShape];
        objectPaperFormatTMLISPAJ.stringHeaderSPAJContent = _stringHeaderSPAJContent;
        [self guardObjectInsert:_stringImageLogo stringObject:objectPaperFormatTMLISPAJ.stringImageLogo];
        [objectPaperFormatTMLISPAJ setHeaderHeight:60];
        
        /* PRINT INTERACTION */
        
        UIPrintInteractionController *printInteractionController = [UIPrintInteractionController sharedPrintController];
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInteractionController.printInfo = printInfo;
        printInteractionController.printFormatter = [webViewHTML viewPrintFormatter];
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
        ^(UIPrintInteractionController *printController, BOOL completed, NSError *error)
        {
            if (!completed && error)
            {
                NSLog(@"Printing could not complete because of error: %@", error);
            }
            else
            {
                /* NSString* stringDocumentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString* stringFileName = [NSString stringWithFormat:@"%@.pdf", stringPDFFileName];
                NSString* stringFilePath = [stringDocumentDirectory stringByAppendingPathComponent:stringFileName];
                NSData *dataPDF = [objectPrintHelper printToPDF:[printController printPageRenderer]];
                
                [dataPDF writeToFile: stringFilePath atomically: YES]; */
                
                NSData *dataPDF = [objectPrintHelper printToPDF:[printController printPageRenderer]];
                
                [dataPDF writeToFile: stringPDFFileName atomically: YES];
                NSLog(@"dataPDF in else = %@", dataPDF);
                _booleanComplete = true;
            }
        };
        [printInteractionController presentAnimated:YES completionHandler:completionHandler];
        
        UIViewPrintFormatter *printFormatter = [webViewHTML viewPrintFormatter];
        [objectPaperFormatTMLISPAJ addPrintFormatter:printFormatter startingAtPageAtIndex:0];
        printInteractionController.printPageRenderer = objectPaperFormatTMLISPAJ;
        
        [self printInteractionControllerWillStartJob:printInteractionController];
    }

    - (void)printSIHTMLWithAutoPaging:(UIWebView *) webViewHTML stringPDFFileName:(NSString *)stringPDFFileName
    {
        /* INITIALIZATION */
        
        PrintHelper *objectPrintHelper = [[PrintHelper alloc] init];
        PaperFormatTMLISI *objectPaperFormatTMLISI = [[PaperFormatTMLISI alloc] init];
        
        /* SET HEADER AND FOOTER */
        
        objectPaperFormatTMLISI.stringHeaderTitle = _stringHeaderTitle;
        [self guardObjectInsert:_stringHeaderLabelIllustrationNumber stringObject:objectPaperFormatTMLISI.stringHeaderLabelIllustrationNumber];
        objectPaperFormatTMLISI.stringHeaderValueIllustrationNumber = _stringHeaderValueIllustrationNumber;
        [self guardObjectInsert:_stringImageLogo stringObject:objectPaperFormatTMLISI.stringHeaderImageLogo];
        
        [self guardObjectInsert:_stringFooterLabelAgentCode stringObject:objectPaperFormatTMLISI.stringFooterLabelAgentCode];
        objectPaperFormatTMLISI.stringFooterValueAgentCode = _stringFooterValueAgentCode;
        [self guardObjectInsert:_stringFooterLabelOfficeName stringObject:objectPaperFormatTMLISI.stringFooterLabelOfficeName];
        objectPaperFormatTMLISI.stringFooterValueOfficeName = _stringFooterValueAgentCode;
        [self guardObjectInsert:_stringFooterLabelDate stringObject:objectPaperFormatTMLISI.stringFooterLabelDate];
        objectPaperFormatTMLISI.stringFooterValueDate = _stringFooterValueDate;
        [self guardObjectInsert:_stringFooterLabelVersion stringObject:objectPaperFormatTMLISI.stringFooterLabelVersion];
        objectPaperFormatTMLISI.stringFooterValueVersion = _stringFooterValueVersion;
        [self guardObjectInsert:_stringFooterValueLegalNumber stringObject:objectPaperFormatTMLISI.stringFooterLabelLegalNumber];
        objectPaperFormatTMLISI.stringFooterValueLegalNumber = _stringFooterValueLegalNumber;
        [objectPaperFormatTMLISI generateEquals];
        [objectPaperFormatTMLISI setHeaderHeight:65 - 25]; // Header max height - margin top.
        [objectPaperFormatTMLISI setFooterHeight:60];
        
        /* PRINT INTERACTION */
        
        UIPrintInteractionController *printInteractionController = [UIPrintInteractionController sharedPrintController];
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInteractionController.printInfo = printInfo;
        printInteractionController.printFormatter = [webViewHTML viewPrintFormatter];
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
        ^(UIPrintInteractionController *printController, BOOL completed, NSError *error)
        {
            if (!completed && error)
            {
                NSLog(@"Printing could not complete because of error: %@", error);
            }
            else
            {
                /* NSString* stringDocumentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString* stringFileName = [NSString stringWithFormat:@"%@.pdf", stringPDFFileName];
                NSString* stringFilePath = [stringDocumentDirectory stringByAppendingPathComponent:stringFileName];
                NSData *dataPDF = [objectPrintHelper printToPDF:[printController printPageRenderer]];
                
                [dataPDF writeToFile: stringFilePath atomically: YES]; */
                
                NSData *dataPDF = [objectPrintHelper printToPDF:[printController printPageRenderer]];
                
                [dataPDF writeToFile: stringPDFFileName atomically: YES];
                NSLog(@"dataPDF in else = %@", dataPDF);
                _booleanComplete = true;
            }
        };
        [printInteractionController presentAnimated:YES completionHandler:completionHandler];
        
        UIViewPrintFormatter *printFormatter = [webViewHTML viewPrintFormatter];
        [objectPaperFormatTMLISI addPrintFormatter:printFormatter startingAtPageAtIndex:0];
        printInteractionController.printPageRenderer = objectPaperFormatTMLISI;
        
        [self printInteractionControllerWillStartJob:printInteractionController];
    }

    - (BOOL) getBooleanComplete
    {
        return _booleanComplete;
    }

    - (void) setBooleanComplete:(BOOL)booleanComplete
    {
        _booleanComplete = booleanComplete;
    }

    - (void) printInteractionControllerWillStartJob:(UIPrintInteractionController *)printInteractionController
    {
        UIView * topView = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
        [topView setHidden:TRUE];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
        {
            [NSThread sleepForTimeInterval:3.0f]; dispatch_async(dispatch_get_main_queue(), ^
            {
                [printInteractionController dismissAnimated:TRUE];
            });
        });
    }

    - (void) guardObjectInsert:(NSString *)stringInput stringObject:(NSString *)stringObject
    {
        if ([stringInput isEqualToString:@""] || stringInput == nil || stringInput == NULL || stringInput.length == 0)
        {
            
        }
        else
        {
            stringObject = stringInput;
        }
    }

@end
