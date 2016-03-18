module Model where


type Model = Okay | Warning | Error


initialModel : Model
initialModel =
  Warning
