//
//  FormatViewController.m
//  PDF Printer for TMLI SPAJ
//
//  Created by Ibrahim Aziz Tejokusumo on 1/5/17.
//  Copyright © 2017 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import "Paper Format TMLI SPAJ.h"


// IMPLEMENTATION

@implementation PaperFormatTMLISPAJ

    /* SYNTHESIZE */

    @synthesize stringImageLogo = _stringImageLogo;
    @synthesize stringHeaderSPAJContent = _stringHeaderSPAJContent;
    @synthesize stringHeaderSPAJLabel = _stringHeaderSPAJLabel;
    @synthesize stringHeaderSPAJShape = _stringHeaderSPAJShape;


    /* INITIALIZATION */

    - (instancetype)init
    {
        self = [super init];
        
        if (self)
        {
            _stringHeaderSPAJContent = @"";
            _stringImageLogo = @"logo_tmlihorizontal_web";
            _stringHeaderSPAJShape = @"shape_spajnumber_primary";
            _stringHeaderSPAJLabel = @"Nomor E - SPAJ : ";
        }
        else
        {
            
        }
        
        return self;
    }


    /* HEADER */

    - (void)drawHeaderForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)headerRect
    {
        UIFont *fontArialContent = [UIFont fontWithName:@"Arial" size:9.5f];
        UIFont *fontArialLabel = [UIFont fontWithName:@"Arial" size:8.5f];
        CGSize sizeHeaderSPAJContent = [_stringHeaderSPAJContent sizeWithAttributes:@{NSFontAttributeName:fontArialContent}];
        UIImage *imageSPAJShape = [UIImage imageNamed:_stringHeaderSPAJShape];
        int intMarginTop = 40;
        int intHeaderHeight;
        
        if (pageIndex == 0)
        {
            UIImage *imageLogo = [UIImage imageNamed:_stringImageLogo];
            [imageLogo drawAtPoint:CGPointMake(CGRectGetMaxX(headerRect) - (imageSPAJShape.size.width / 5) - imageLogo.size.width - 35, intMarginTop)];
            [imageSPAJShape drawAtPoint:CGPointMake(CGRectGetMaxX(headerRect) - imageSPAJShape.size.width - 35, imageLogo.size.height + 10 + intMarginTop)];
            [_stringHeaderSPAJContent drawAtPoint:
                CGPointMake
                (
                    CGRectGetMaxX(headerRect) - sizeHeaderSPAJContent.width - (sizeHeaderSPAJContent.width / 4) - 35,
                    imageLogo.size.height + 12 + intMarginTop
                )
                withAttributes:@{NSFontAttributeName:fontArialContent}
            ];
            [_stringHeaderSPAJLabel drawAtPoint:
                CGPointMake
                (
                    CGRectGetMaxX(headerRect) - sizeHeaderSPAJContent.width - 35 - sizeHeaderSPAJContent.width - 60,
                    imageLogo.size.height + 13 + intMarginTop
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
             ];
            
            intHeaderHeight = imageLogo.size.height + intMarginTop + imageSPAJShape.size.height;
        }
        else
        {
            [imageSPAJShape drawAtPoint:CGPointMake(CGRectGetMaxX(headerRect) - imageSPAJShape.size.width - 35, intMarginTop)];
            [_stringHeaderSPAJContent drawAtPoint:
                CGPointMake
                (
                    CGRectGetMaxX(headerRect) - sizeHeaderSPAJContent.width - (sizeHeaderSPAJContent.width / 4) - 35,
                    4 + intMarginTop
                )
                withAttributes:@{NSFontAttributeName:fontArialContent}
            ];
            [_stringHeaderSPAJLabel drawAtPoint:
                CGPointMake
                (
                    CGRectGetMaxX(headerRect) - sizeHeaderSPAJContent.width - 35 - sizeHeaderSPAJContent.width - 60,
                    3 + intMarginTop
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            intHeaderHeight = 5 + imageSPAJShape.size.height + intMarginTop;
        }
    }


    /* FOOTER */

    - (void)drawFooterForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)footerRect
    {
        
    }

@end
