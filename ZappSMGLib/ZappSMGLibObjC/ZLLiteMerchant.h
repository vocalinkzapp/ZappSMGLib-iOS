//
//  ZLLiteMerchant.h
//  ZappSMGLib
//
//  Created by Alexandru Maimescu on 12/14/15.
//  Copyright © 2015 Zapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLValidatable.h"

@class ZLLiteAddressDetails;

/**
 * Merchant model object for Lite merchant gateway.
 */
@interface ZLLiteMerchant : NSObject <ZLValidatable>

/**
 *  The unique merchant id assigned to merchant and it must be supplied in payment request message.
 */
@property (nonatomic, copy) NSString *merchantId;

/**
 *  The merchant sequence which will be incremented for each added client and merchant will pass this as part of Adhoc
 *  field when submitting payment request.
 */
@property (nonatomic, copy) NSString *merchantClientSequence;

/**
 *  Admin password to control administrative activities.
 */
@property (nonatomic, copy) NSString *passcode;

/**
 *  The name of the merchant.
 */
@property (nonatomic, copy) NSString *merchantName;

/**
 *  The merchant's company registration number.
 */
@property (nonatomic, copy) NSString *companyRegistrationNumber;

/**
 *  The company name of the merchant organisation.
 */
@property (nonatomic, copy) NSString *companyName;

/**
 *  The company VAT number of merchant organisation.
 */
@property (nonatomic, copy) NSString *companyVATNumber;

/**
 *  The company sort code of merchant organisation.
 */
@property (nonatomic, copy) NSString *companySortCode;

/**
 *  The company account number of merchant organisation.
 */
@property (nonatomic, copy) NSString *companyAccountNumber;

/**
 *  The company registered address of merchant organisation.
 */
@property (nonatomic, strong) ZLLiteAddressDetails *companyRegisteredAddress;

/**
 *  The dictionary representation of mobile app preferences and it will be returned when merchant is adding more client as new till.
 */
@property (nonatomic, copy) NSDictionary *mobileAppPreference;

- (instancetype)initWithMerchantId:(NSString *)merchantId
            merchantClientSequence:(NSString *)merchantClientSequence
                          passcode:(NSString *)passcode
                      merchantName:(NSString *)merchantName
         companyRegistrationNumber:(NSString *)companyRegistrationNumber
                       companyName:(NSString *)companyName
                  companyVATNumber:(NSString *)companyVATNumber
                   companySortCode:(NSString *)companySortCode
              companyAccountNumber:(NSString *)companyAccountNumber
          companyRegisteredAddress:(ZLLiteAddressDetails *)companyRegisteredAddress
               mobileAppPreference:(NSDictionary *)mobileAppPreference;

@end
