module Modal.Main exposing (..)


type alias AppModel =
    { options : OptionModel
    , code : String
    }


appModel : AppModel
appModel =
    { options = optionModel
    , code = ""
    }


type alias OptionModel =
    { componetType : TypeOptionList
    , lifeCycle : TypeOptionList
    , pure : TypeOptionList
    , importCSS : TypeOptionList
    , importLibImmutableJS : TypeOptionList
    , importLibReactRouter : TypeOptionList
    , importLibRedux : TypeOptionList
    }


optionModel : OptionModel
optionModel =
    { componetType = componetType
    , pure = pure
    , lifeCycle = lifeCycle
    , importCSS = importCSS
    , importLibImmutableJS = importLibImmutableJS
    , importLibReactRouter = importLibReactRouter
    , importLibRedux = importLibRedux
    }


type alias TypeOptionList =
    List TypeOption


type alias TypeOptionId =
    String


type alias TypeOption =
    { id : String
    , label : String
    , enabled : Bool
    }


isKeyEnabledInOptionList : TypeOptionList -> String -> Bool
isKeyEnabledInOptionList typeOptionList id =
    typeOptionList
        |> List.filter (\x -> x.id == id)
        |> List.all (\x -> x.enabled == True)


componetType : TypeOptionList
componetType =
    [ { id = "object"
      , label = "Object"
      , enabled = True
      }
    , { id = "class"
      , label = "Class"
      , enabled = False
      }
    ]


pure : TypeOptionList
pure =
    [ { id = "Yes"
      , label = "Yes"
      , enabled = False
      }
    ]


lifeCycle : TypeOptionList
lifeCycle =
    [ { id = "defaultProps"
      , label = "defaultProps"
      , enabled = False
      }
    , { id = "componentWillMount"
      , label = "componentWillMount"
      , enabled = False
      }
    , { id = "componentDidMount"
      , label = "componentDidMount"
      , enabled = False
      }
    , { id = "componentWillReceiveProps"
      , label = "componentWillReceiveProps"
      , enabled = False
      }
    , { id = "shouldComponentUpdate"
      , label = "shouldComponentUpdate"
      , enabled = False
      }
    , { id = "componentWillUpdate"
      , label = "componentWillUpdate"
      , enabled = False
      }
    , { id = "componentDidUpdate"
      , label = "componentDidUpdate"
      , enabled = False
      }
    , { id = "componentWillUnmount"
      , label = "componentWillUnmount"
      , enabled = False
      }
    ]


importCSS : TypeOptionList
importCSS =
    [ { id = "importCss"
      , label = "Import CSS"
      , enabled = False
      }
    , { id = "classname"
      , label = "With classname lib"
      , enabled = False
      }
    , { id = "cssModule"
      , label = "CSS Module"
      , enabled = False
      }
    ]


importLibImmutableJS : TypeOptionList
importLibImmutableJS =
    [ { id = "fromJS"
      , label = "fromJS"
      , enabled = False
      }
    , { id = "Map"
      , label = "Map"
      , enabled = False
      }
    , { id = "List"
      , label = "List"
      , enabled = False
      }
    , { id = "Set"
      , label = "Set"
      , enabled = False
      }
    , { id = "Range"
      , label = "Range"
      , enabled = False
      }
    ]


importLibReactRouter : TypeOptionList
importLibReactRouter =
    [ { id = "Link"
      , label = "Link"
      , enabled = False
      }
    ]


importLibRedux : TypeOptionList
importLibRedux =
    [ { id = "connect"
      , label = "Connect"
      , enabled = False
      }
    ]
