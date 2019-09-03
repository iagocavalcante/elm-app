module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg
    = Switch
    | NewName String


type alias Model =
    { name : String }


main =
    Browser.sandbox { init = { name = "Rémy" }, view = view, update = update }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Switch ->
            if model.name == "Rémy" then
                { model | name = "Séverine" }
            else
                { model | name = "Rémy" }

        NewName newName ->
            { model | name = newName }


view : Model -> Html Msg
view model =
    div []
        [ text "Hello "
        , a [ href "#", onClick Switch ] [ text model.name ]
        , br [] []
        , input
            [ onInput NewName
            , value model.name
            ]
            []
        ]