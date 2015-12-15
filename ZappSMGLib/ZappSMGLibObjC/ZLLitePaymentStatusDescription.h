//
//  ZLLitePaymentStatusDescription.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#ifndef ZLLitePaymentStatusDescription_h
#define ZLLitePaymentStatusDescription_h

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, ZLLitePaymentStatusDescription) {
    ZLLitePaymentStatusDescriptionDeclined,
    ZLLitePaymentStatusDescriptionLateAuthorised,
    ZLLitePaymentStatusDescriptionLateDeclined,
    ZLLitePaymentStatusDescriptionProcessingError,
    ZLLitePaymentStatusDescriptionTransactionError
};

#endif /* ZLLitePaymentStatusDescription_h */
