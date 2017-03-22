//
//  TMLI PDF Paging Helper.m
//  TMConnect
//
//  Created by Ibrahim Aziz Tejokusumo on 11/16/16.
//  Copyright © 2016 Ibrahim Aziz Tejokusumo. All rights reserved.
//


// IMPORT

#import "Paper Format TMLI SI.h"


// ON PAGE CONSTANT

#define GENERAL_MARGIN_TINY 5
#define GENERAL_MARGIN_LITTLE 10
#define GENERAL_MARGIN_SMALL 15
#define GENERAL_MARGIN_MEDIUM 20
#define GENERAL_MARGIN_LARGE 30
#define GENERAL_MARGIN_HUGE 40
#define GENERAL_MARGIN_ENORMOUS 120

#define PAPER_MARGIN_TOP 25
#define PAPER_MARGIN_LEFT 65
#define PAPER_MARGIN_RIGHT 25
#define PAPER_MARGIN_BOTTOM 15

#define LABEL_WIDTH_SMALL 40
#define LABEL_WIDTH_MEDIUM 120
#define LABEL_WIDTH_LARGE 180
#define VALUE_WIDTH_SMALL 60
#define VALUE_WIDTH_MEDIUM 140
#define VALUE_WIDTH_LARGE 200


// INTERFACE

@interface PaperFormatTMLISI ()

@end


// IMPLEMENTATION

@implementation PaperFormatTMLISI

    /* SYNTHESIZE */

    @synthesize stringHeaderTitle = _stringHeaderTitle;
    @synthesize stringHeaderLabelIllustrationNumber = _stringHeaderLabelIllustrationNumber;
    @synthesize stringHeaderValueIllustrationNumber = _stringHeaderValueIllustrationNumber;
    @synthesize stringHeaderImageLogo = _stringHeaderImageLogo;

    @synthesize stringFooterLabelAgentCode = _stringFooterLabelAgentCode;
    @synthesize stringFooterValueAgentCode = _stringFooterValueAgentCode;
    @synthesize stringFooterLabelOfficeName = _stringFooterLabelOfficeName;
    @synthesize stringFooterValueOfficeName = _stringFooterValueOfficeName;
    @synthesize stringFooterLabelDate = _stringFooterLabelDate;
    @synthesize stringFooterValueDate = _stringFooterValueDate;
    @synthesize stringFooterLabelVersion = _stringFooterLabelVersion;
    @synthesize stringFooterValueVersion = _stringFooterValueVersion;
    @synthesize stringFooterLabelLegalNumber = _stringFooterLabelLegalNumber;
    @synthesize stringFooterValueLegalNumber = _stringFooterValueLegalNumber;

    @synthesize stringEquals = _stringEquals;


    /* INITIALIZE */

    - (instancetype)init
    {
        self = [super init];
        
        if (self)
        {
            _stringHeaderImageLogo = @"logo_tmlihorizontal_web";
            _stringHeaderTitle = @"Illustrasi TM Link";
            _stringHeaderLabelIllustrationNumber = @"Nomor Illustrasi";
            _stringHeaderValueIllustrationNumber = @"";
            _stringFooterLabelAgentCode = @"Nama / Kode Financial Konsultan";
            _stringFooterValueAgentCode = @"";
            _stringFooterLabelOfficeName = @"Nama Kantor Pemasaran";
            _stringFooterValueOfficeName = @"";
            _stringFooterLabelDate = @"Tanggal";
            _stringFooterValueDate = @"";
            _stringFooterLabelVersion = @"Versi";
            _stringFooterValueVersion = @"";
            _stringFooterLabelLegalNumber = @"Legal No.";
            _stringFooterValueLegalNumber = @"";
            _stringEquals = @":";
        }
        else
        {
            
        }
        
        return self;
    }

    - (void) generateEquals
    {
        _stringFooterValueAgentCode = [NSString stringWithFormat:@"%@ %@", _stringEquals, _stringFooterValueAgentCode];
        _stringFooterValueOfficeName = [NSString stringWithFormat:@"%@ %@", _stringEquals, _stringFooterValueOfficeName];
        _stringFooterValueDate = [NSString stringWithFormat:@"%@ %@", _stringEquals, _stringFooterValueDate];
        _stringFooterValueVersion = [NSString stringWithFormat:@"%@ %@", _stringEquals, _stringFooterValueVersion];
        _stringFooterValueLegalNumber = [NSString stringWithFormat:@"%@ %@", _stringEquals, _stringFooterValueLegalNumber];
    }


    /* HEADER */

    - (void)drawHeaderForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)headerRect
    {
        /* INITIALIZE */
        
        UIFont *fontArialTitle = [UIFont fontWithName:@"Arial" size:14.0f];
        UIFont *fontArialTitleBold = [UIFont boldSystemFontOfSize:14.0f];
        UIFont *fontArialLabel = [UIFont fontWithName:@"Arial" size:9.0f];
        
        CGSize sizeHeaderTitle = [_stringHeaderTitle sizeWithAttributes:@{NSFontAttributeName:fontArialTitle}];
        CGSize sizeHeaderLabelIllustrationNumber = [_stringHeaderLabelIllustrationNumber sizeWithAttributes:@{NSFontAttributeName:fontArialLabel}];
        
        UIImage *imageHeaderShapeIllustrationNumber = [UIImage imageNamed:@"shape_sinumber_primary"];
        UIImage *imageHeaderLogo = [UIImage imageNamed:_stringHeaderImageLogo];

        int intHeaderHeight;
        
        
        /* DRAW */
        
        [imageHeaderLogo drawAtPoint:CGPointMake(CGRectGetMaxX(headerRect) - imageHeaderLogo.size.width - PAPER_MARGIN_RIGHT, PAPER_MARGIN_TOP)];
        
        if (pageIndex == 0)
        {
            [_stringHeaderTitle drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    PAPER_MARGIN_TOP
                )
                withAttributes:@{NSFontAttributeName:fontArialTitle, NSFontAttributeName:fontArialTitleBold}
            ];
            
            [_stringHeaderLabelIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    sizeHeaderTitle.height + GENERAL_MARGIN_LITTLE + PAPER_MARGIN_TOP
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [imageHeaderShapeIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + sizeHeaderLabelIllustrationNumber.width + GENERAL_MARGIN_MEDIUM,
                    sizeHeaderTitle.height +  GENERAL_MARGIN_LITTLE - 2 + PAPER_MARGIN_TOP
                )
            ];
            
            [_stringHeaderValueIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + sizeHeaderLabelIllustrationNumber.width + GENERAL_MARGIN_LARGE,
                    sizeHeaderTitle.height + GENERAL_MARGIN_LITTLE + PAPER_MARGIN_TOP
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            intHeaderHeight = imageHeaderShapeIllustrationNumber.size.height + sizeHeaderTitle.height +  GENERAL_MARGIN_LITTLE - 2 + PAPER_MARGIN_TOP;
        }
        else
        {
            [_stringHeaderLabelIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    PAPER_MARGIN_TOP
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [imageHeaderShapeIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + sizeHeaderLabelIllustrationNumber.width + GENERAL_MARGIN_MEDIUM,
                    -2 + PAPER_MARGIN_TOP
                )
            ];
            
            [_stringHeaderValueIllustrationNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + sizeHeaderLabelIllustrationNumber.width + GENERAL_MARGIN_LARGE,
                    PAPER_MARGIN_TOP
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            intHeaderHeight = imageHeaderShapeIllustrationNumber.size.height + GENERAL_MARGIN_LITTLE - 2 + PAPER_MARGIN_TOP;
        }
        
        NSLog(@"Header -> index = %ld, intHeaderHeight = %d", (long)pageIndex, intHeaderHeight);
        // self.headerHeight = intHeaderHeight;
    }


    /* FOOTER */

    - (void)drawFooterForPageAtIndex:(NSInteger)pageIndex inRect:(CGRect)footerRect
    {
        /* INITIALIZE */
        
        UIFont *fontArialLabel = [UIFont fontWithName:@"Arial" size:7.5f];
        NSString *stringFooterLabelPageNumber = [NSString stringWithFormat:@"%ld of %ld", (long)pageIndex + 1, (long)self.numberOfPages];
        
        CGSize sizeFooterLabelAgentCode = [_stringFooterLabelAgentCode sizeWithAttributes:@{NSFontAttributeName:fontArialLabel}];
        CGSize sizeFooterLabelOfficeName = [_stringFooterLabelOfficeName sizeWithAttributes:@{NSFontAttributeName:fontArialLabel}];
        CGSize sizeFooterLabelDate = [_stringFooterLabelDate sizeWithAttributes:@{NSFontAttributeName:fontArialLabel}];
        CGSize sizeFooterLabelPageNumber = [stringFooterLabelPageNumber sizeWithAttributes:@{NSFontAttributeName:fontArialLabel}];
        
        int intFooterHeight = sizeFooterLabelAgentCode.height + sizeFooterLabelOfficeName.height + sizeFooterLabelDate.height + sizeFooterLabelPageNumber.height + PAPER_MARGIN_BOTTOM;
        
        
        /* DRAW */
        
            /* COLUMN 1 */
            
            [_stringFooterLabelDate drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterValueDate drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterLabelOfficeName drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterValueOfficeName drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterLabelAgentCode drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - sizeFooterLabelAgentCode.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterValueAgentCode drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - sizeFooterLabelAgentCode.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
        
            /* COLUMN 2 */
            
            [_stringFooterLabelLegalNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM + VALUE_WIDTH_MEDIUM + GENERAL_MARGIN_LITTLE,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterValueLegalNumber drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM + VALUE_WIDTH_MEDIUM + GENERAL_MARGIN_LITTLE + LABEL_WIDTH_SMALL,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterLabelVersion drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM + VALUE_WIDTH_MEDIUM + GENERAL_MARGIN_LITTLE,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - sizeFooterLabelAgentCode.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
            
            [_stringFooterValueVersion drawAtPoint:
                CGPointMake
                (
                    PAPER_MARGIN_LEFT + LABEL_WIDTH_MEDIUM + VALUE_WIDTH_MEDIUM + GENERAL_MARGIN_LITTLE + LABEL_WIDTH_SMALL,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - sizeFooterLabelOfficeName.height - sizeFooterLabelAgentCode.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
        
            [stringFooterLabelPageNumber drawAtPoint:
                CGPointMake
                (
                    CGRectGetMaxX(footerRect) - sizeFooterLabelPageNumber.width - PAPER_MARGIN_RIGHT,
                    CGRectGetMaxY(footerRect) - sizeFooterLabelDate.height - PAPER_MARGIN_BOTTOM
                )
                withAttributes:@{NSFontAttributeName:fontArialLabel}
            ];
        
        NSLog(@"Footer -> index = %ld, intFooterHeight = %d", (long)pageIndex, intFooterHeight);
        // self.footerHeight = intFooterHeight;
    }

@end
