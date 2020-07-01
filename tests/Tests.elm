module Tests exposing (..)

import Expect
import Http
import Main
import Test exposing (..)


httpRequestBuilder : Test
httpRequestBuilder =
    describe "Building http requests"
        [ test "GET record for a request" <|
            \_ ->
                Expect.equal simpleGetRecord (Main.httpGetRecordBuilder testUrl)
        , test "GET request directly" <|
            \_ ->
                Expect.equal simpleGetRequest (Main.httpGetRequestBuilder testUrl)
        ]



---- CONSTANTS ----


simpleGetRecord : { url : String, expect : Http.Expect Main.Msg }
simpleGetRecord =
    { url = "https://elm-lang.org/assets/public-opinion.txt"
    , expect = Http.expectString Main.GotText
    }


simpleGetRequest : Cmd Main.Msg
simpleGetRequest =
    Http.get
        { url = "https://elm-lang.org/assets/public-opinion.txt"
        , expect = Http.expectString Main.GotText
        }


testUrl =
    "https://elm-lang.org/assets/public-opinion.txt"
