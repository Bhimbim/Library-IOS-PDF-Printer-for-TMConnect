//
//  TMLI PDF Paging Helper.h
//  TMConnect
//
//  Created by Ibrahim Aziz Tejokusumo on 11/16/16.
//  Copyright © 2016 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


// INTERFACE

@interface PaperFormatTMLISI : UIPrintPageRenderer

    /* STRING */

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


    /* FUNCTION */

    - (void) generateEquals;

@end
