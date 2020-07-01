-- Make a GET request to load a book called "Public Opinion"
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/http.html
--


module Main exposing (Model(..), Msg(..), httpGetRecordBuilder, httpGetRequestBuilder, httpGetRequestFromRecord, init, main, subscriptions, update, view)

import Browser
import Html exposing (Html, pre, text)
import Http



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , httpGetRequestFromRecord publicOpinionUrl
    )



-- UPDATE


type Msg
    = GotText (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( Success fullText, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            text "I was unable to load your book."

        Loading ->
            text "Loading..."

        Success fullText ->
            pre [] [ text fullText ]



---- HTTP ----


publicOpinionUrl : String
publicOpinionUrl =
    "https://elm-lang.org/assets/public-opinion.txt"


httpGetRecordBuilder : String -> { url : String, expect : Http.Expect Msg }
httpGetRecordBuilder url =
    { url = url
    , expect = Http.expectString GotText
    }


httpGetRequestFromRecord : String -> Cmd Msg
httpGetRequestFromRecord url =
    Http.get (httpGetRecordBuilder url)


httpGetRequestBuilder : String -> Cmd Msg
httpGetRequestBuilder url =
    Http.get
        { url = url
        , expect = Http.expectString GotText
        }
