//
//  PDF_Printer_for_TMLI_SPAJ.h
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// INTERFACE

@interface PrintEngine : NSObject<UIPrintInteractionControllerDelegate>

    /* INITIALIZATION */

    @property (nonatomic, assign, readwrite) BOOL booleanComplete;


    /* STRING */

    @property (nonatomic, weak) NSString *stringHeaderSPAJContent;
    @property (nonatomic, weak) NSString *stringHeaderSPAJLabel;
    @property (nonatomic, weak) NSString *stringImageLogo;
    @property (nonatomic, weak) NSString *stringHeaderSPAJShape;

    @property (nonatomic, weak) NSString *stringHeaderTitle;
    @property (nonatomic, weak) NSString *stringHeaderLabelIllustrationNumber;
    @property (nonatomic, weak) NSString *stringHeaderValueIllustrationNumber;
    @property (nonatomic, weak) NSString *stringHeaderImageLogo;

    @property (nonatomic, weak) NSString *stringFooterLabelAgentCode;
    @property (nonatomic, strong) NSString *stringFooterValueAgentCode;
    @property (nonatomic, weak) NSString *stringFooterLabelDate;
    @property (nonatomic, strong) NSString *stringFooterValueDate;
    @property (nonatomic, weak) NSString *stringFooterLabelVersion;
    @property (nonatomic, strong) NSString *stringFooterValueVersion;
    @property (nonatomic, weak) NSString *stringFooterLabelOfficeName;
    @property (nonatomic, strong) NSString *stringFooterValueOfficeName;
    @property (nonatomic, weak) NSString *stringFooterLabelLegalNumber;
    @property (nonatomic, strong) NSString *stringFooterValueLegalNumber;

    @property (nonatomic, weak) NSString *stringEquals;


    /* PRINT WITH INTERACTION CONTROLLER */

    - (void) printSPAJHTMLWithAutoPaging: (UIWebView *) webViewHTML stringPDFFileName : (NSString *) stringPDFFileName;

    - (void) printSIHTMLWithAutoPaging: (UIWebView *) webViewHTML stringPDFFileName : (NSString *) stringPDFFileName;


    /* SETTER & GETTER */

    - (BOOL) getBooleanComplete;

    - (void) setBooleanComplete: (BOOL) booleanComplete;

    - (void) guardObjectInsert: (NSString *) stringInput stringObject : (NSString *) stringObject;

@end
