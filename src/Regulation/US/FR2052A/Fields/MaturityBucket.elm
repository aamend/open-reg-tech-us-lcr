{-
   Copyright 2022 Morgan Stanley
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-}

module Regulation.US.FR2052A.Fields.MaturityBucket exposing (..)


type MaturityBucket
    = Open
    | Day Int


isOpen : MaturityBucket -> Bool
isOpen maturityBucket =
    case maturityBucket of
        Open ->
            True

        _ ->
            False


isGreaterThan30Days : MaturityBucket -> Bool
isGreaterThan30Days maturityBucket =
    case maturityBucket of
        Day n ->
            n > 30

        _ ->
            False


isLessThanOrEqual30Days : MaturityBucket -> Bool
isLessThanOrEqual30Days maturityBucket =
    case maturityBucket of
        Day n ->
            n <= 30

        _ ->
            False


fromInt : Int -> MaturityBucket
fromInt days =
    case days of
        0 ->
            Open

        _ ->
            Day days
