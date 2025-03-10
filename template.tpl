___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Tracking-Expert CMP",
  "categories": [
    "TAG_MANAGEMENT",
    "PERSONALIZATION"
  ],
  "brand": {
    "id": "Tracking-Expert",
    "displayName": "Tracking-Expert",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEUElEQVRYha2Xf2hWVRjHP+c5r2/zbbzVMBEJEtMIKdM1R9gGmZo5MFcrw2HhHyX99B8ZC4xAQ0wECySKWfiWoNIPV6PWDzeFsok6aphFP8X2T2IkMWKlvOc5/XHfH/e+v/bO7YGHe+45zznfz3PPufeca6jWWj5MItJCLLYEa+uxdhbWJhH5GZEO9jV/VvVYITNjRtxzcA4inVjbjrUJrKWEX8aYO9jXfGa8ALGyLYtTNYi8hHMbgTimImsckUeA8gAbBmcAy4Bm4G26GgbKAzR0zca5bmD+GAnkzfvo/eMnE4g0ASsywuGx4kAZgNtfm4/qYWB61eJwGe8PsPboTETWYe1yVJswpqbMkzueLUQB5r06e5zil4EfgQ4+WPEDa/o+Be7DGHAuiLCWEhBHigHm7qxBtXsM8VFgP8Z0A4MYc4He1nyr6uvAzcDsSK8oxDng12IA1S1UnvMU0Mmxxy6UjXj/3h4ePtyLaiuwCbizBEQfXQ256gDrxm1zEPkekTgiQXD+msbaJ/jmyVQFuGJbexSMaUHkk8gra8xauhoOZsMkk30nqnFUQTWYv/x1/OIAB5bA/rt7ca4P58i4onokHCbMeLEW59pzolGIFN89N37xsKnuDAGc4c3GyBQK3regmohkHvgoznVOSBzA+y9w7jTOQTrdV9gsOLe0ROagup9fOsovuGrt3WWgugnnjqG6t7DZUPf8CUQaEaHAVzH8wscTBgjbmr7piDyItTFEetjXPBxDdVaZ8MFJFW/tXYBz/UAdxoAxO3j0q1UxVK8tEZ4Gzk8qgHOvAHWhmgQiu2N4H8x5oZWqmxjAghK18wTVv3MQeY/h/Xg2o8q2/L0EziVDr2PWRwXvh1GlBETD2CNXaar1qEoJgGFBdSgnGobwfvWkATj3QOTrmvchwfv+AuFsuZ3rOqdNWHxxKkk6vT4nGoZIp/sF73vxfrQERC3e75iE7LegWhfJPIBIo9pjcScvYRtvAhZGOgZb50Jq7vqNSwOnr0i8/o1WYBdgShxKDvF5WyrYDb3fjmoa7wvXAXi/l2s62sctftvuVpw7EFl8+cevOLcNwAKgpy5iG5N4v7iI1BgB2pjaNJOpTQP89/W/FYXn7kwyfeXLwC6MmZIZIzwewFt8uW4PhP8LYk8ngBMYcysiZD6X+b0hKI8g8g7GdCMyyJ/bRgC4YWstIvWIrMba9YjUFRxqwtezWLuQgfUjUYAAYg5wHGOmVYAI+z+IKCLJiEjWi8VHEGlmcENuTdkIgJ66iCzqB9qARInpKHzgceCqijHZe2NGgJV8+1Rkk4sCBBB/IIs+ApYC11cBUWzFfc4CKzizsWiHLQYIIP5CFqUw5mq8b8gsxCuBUGAP0MZPm4ZLho050JRnbsGYzRjzUO5Pp/yayHoaaw8hsp3fNw9V5Bw7lYzFn63DmPsxZinGLEBkFiK1GYhRRM4hMoTIUUR6OL+1quPc/z+lAgP8VdoeAAAAAElFTkSuQmCC"
  },
  "description": "CMP powered by Tracking-Expert",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true
  },
  {
    "type": "GROUP",
    "name": "affiliate",
    "displayName": "Affiliate",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "affiliate_id",
        "displayName": "Affiliate-ID",
        "simpleValueType": true
      },
      {
        "type": "TEXT",
        "name": "campaign_key",
        "displayName": "Campaign Key",
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');
const setDefaultConsentState = require('setDefaultConsentState');
const updateConsentState = require('updateConsentState');
const getCookieValues = require('getCookieValues');
const callInWindow = require('callInWindow');
const getTimestampMillis = require('getTimestampMillis');
const Math = require('Math');

const cachingKey = Math.floor(getTimestampMillis() / 86400 / 1000);

const postScriptUrl = 'https://api.experten.tools/js/etcmp.min.js?cache='+cachingKey;

const consentCookieStatus = getCookieValues('ET_Consent').toString();
const statsCookieStatus = getCookieValues('ET_Stats').toString();

const defaultConsentStates = {
  ad_storage: 'denied',
  ad_user_data: 'denied',
  ad_personalization: 'denied',
  analytics_storage: 'denied',
  functionality_storage: 'granted',
  personalization_storage: 'denied',
  security_storage: 'granted'
};

// Get Data from Template and create Objects
const bodyData = {
  apiKey: data.apiKey
};

const affiliateValues = {
  affiliate_id: data.affiliate_id,
  campaign_key: data.campaign_key
};

// Check permissions for injected Script
if (queryPermission('inject_script', postScriptUrl)) {
  injectScript(postScriptUrl, onSuccess, data.gtmOnFailure, postScriptUrl);
} else {
  log('postScriptUrl: Script load failed due to permissions mismatch.');
  data.gtmOnFailure();
}

function onSuccess() {
  // Add appropriate permission to call `sendData` variable in GTM template's privileges tab
  callInWindow('ETCMP.handler.etCmpIntegration', bodyData, affiliateValues);
  callInWindow('ETCMP.handler.etCmpAddConsentListener', onUserConsent);
  data.gtmOnSuccess();
}

/*
 *   Called from cmp backend when consent changes. Assumes that consent object contains keys which
 *   directly correspond to Google consent types.
 */
const onUserConsent = (consent) => {
  if (typeof consent === 'boolean') {
    const consentModeStates = {
      ad_storage: consent ? 'granted' : 'denied',
      ad_user_data: consent ? 'granted' : 'denied',
      ad_personalization: consent ? 'granted' : 'denied',
      analytics_storage: consent ? 'granted' : 'denied',
      functionality_storage: 'granted',
      personalization_storage: consent ? 'granted' : 'denied',
      security_storage: 'granted'
    };

    updateConsentState(consentModeStates);
  } else {
    updateConsentState({
      ad_storage: 'denied',
      ad_user_data: 'denied',
      ad_personalization: 'denied',
      analytics_storage: 'denied',
      functionality_storage: 'granted',
      personalization_storage: 'denied',
      security_storage: 'granted'
    });
  }
};

/*
 *   Executes the default command, sets the developer ID, and sets up the consent
 *   update callback
 */
(() => {
  defaultConsentStates.wait_for_update = 500;
  setDefaultConsentState(defaultConsentStates);

  if (statsCookieStatus === 'true' && consentCookieStatus === 'true') {
    onUserConsent(true);
  } else if (statsCookieStatus !== 'true' && consentCookieStatus === 'true') {
    onUserConsent(false);
  }

  data.gtmOnSuccess();
})();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ETCMP.handler.etCmpAddConsentListener"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ETCMP.handler.etCmpIntegration"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://api.experten.tools/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_user_data"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ad_personalization"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "analytics_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "functionality_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "personalization_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "consentType"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "security_storage"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10.3.2024, 09:35:08
