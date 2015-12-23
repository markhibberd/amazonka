{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.APIGateway.GetRestAPIs
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Lists the RestApis resources for your collection.
--
-- /See:/ <http://docs.aws.amazon.com/apigateway/api-reference/resource/GetRestAPIs.html AWS API Reference> for GetRestAPIs.
--
-- This operation returns paginated results.
module Network.AWS.APIGateway.GetRestAPIs
    (
    -- * Creating a Request
      getRestAPIs
    , GetRestAPIs
    -- * Request Lenses
    , graLimit
    , graPosition

    -- * Destructuring the Response
    , getRestAPIsResponse
    , GetRestAPIsResponse
    -- * Response Lenses
    , grarsItems
    , grarsPosition
    , grarsResponseStatus
    ) where

import           Network.AWS.APIGateway.Types
import           Network.AWS.APIGateway.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Pager
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Request to list existing RestApis defined for your collection.
--
-- /See:/ 'getRestAPIs' smart constructor.
data GetRestAPIs = GetRestAPIs'
    { _graLimit    :: !(Maybe Int)
    , _graPosition :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetRestAPIs' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'graLimit'
--
-- * 'graPosition'
getRestAPIs
    :: GetRestAPIs
getRestAPIs =
    GetRestAPIs'
    { _graLimit = Nothing
    , _graPosition = Nothing
    }

-- | The maximum number of RestApi resources in the collection to get
-- information about. The default limit is 25. It should be an integer
-- between 1 - 500.
graLimit :: Lens' GetRestAPIs (Maybe Int)
graLimit = lens _graLimit (\ s a -> s{_graLimit = a});

-- | The position of the current RestApis resource in the collection to get
-- information about.
graPosition :: Lens' GetRestAPIs (Maybe Text)
graPosition = lens _graPosition (\ s a -> s{_graPosition = a});

instance AWSPager GetRestAPIs where
        page rq rs
          | stop (rs ^. grarsPosition) = Nothing
          | stop (rs ^. grarsItems) = Nothing
          | otherwise =
            Just $ rq & graPosition .~ rs ^. grarsPosition

instance AWSRequest GetRestAPIs where
        type Rs GetRestAPIs = GetRestAPIsResponse
        request = get aPIGateway
        response
          = receiveJSON
              (\ s h x ->
                 GetRestAPIsResponse' <$>
                   (x .?> "item" .!@ mempty) <*> (x .?> "position") <*>
                     (pure (fromEnum s)))

instance ToHeaders GetRestAPIs where
        toHeaders = const mempty

instance ToPath GetRestAPIs where
        toPath = const "/restapis"

instance ToQuery GetRestAPIs where
        toQuery GetRestAPIs'{..}
          = mconcat
              ["limit" =: _graLimit, "position" =: _graPosition]

-- | Contains references to your APIs and links that guide you in ways to
-- interact with your collection. A collection offers a paginated view of
-- your APIs.
--
-- /See:/ 'getRestAPIsResponse' smart constructor.
data GetRestAPIsResponse = GetRestAPIsResponse'
    { _grarsItems          :: !(Maybe [RestAPI])
    , _grarsPosition       :: !(Maybe Text)
    , _grarsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GetRestAPIsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'grarsItems'
--
-- * 'grarsPosition'
--
-- * 'grarsResponseStatus'
getRestAPIsResponse
    :: Int -- ^ 'grarsResponseStatus'
    -> GetRestAPIsResponse
getRestAPIsResponse pResponseStatus_ =
    GetRestAPIsResponse'
    { _grarsItems = Nothing
    , _grarsPosition = Nothing
    , _grarsResponseStatus = pResponseStatus_
    }

-- | An array of links to the current page of RestApi resources.
grarsItems :: Lens' GetRestAPIsResponse [RestAPI]
grarsItems = lens _grarsItems (\ s a -> s{_grarsItems = a}) . _Default . _Coerce;

-- | Undocumented member.
grarsPosition :: Lens' GetRestAPIsResponse (Maybe Text)
grarsPosition = lens _grarsPosition (\ s a -> s{_grarsPosition = a});

-- | The response status code.
grarsResponseStatus :: Lens' GetRestAPIsResponse Int
grarsResponseStatus = lens _grarsResponseStatus (\ s a -> s{_grarsResponseStatus = a});
