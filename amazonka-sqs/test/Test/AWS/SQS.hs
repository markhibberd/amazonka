{-# LANGUAGE OverloadedStrings #-}

-- Module      : Test.AWS.SQS
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Test.AWS.SQS
    ( tests
    , fixtures
    ) where

import           Network.AWS.SQS
import           Test.AWS.Gen.SQS
import           Test.Tasty

tests :: [TestTree]
tests = []

fixtures :: [TestTree]
fixtures =
    [ testGroup "response"
        [ getQueueURLResponseTest $
            getQueueURLResponse 200 "http://us-east-1.amazonaws.com/123456789012/testQueue"

        , purgeQueueResponseTest $
            purgeQueueResponse
        ]
    ]
