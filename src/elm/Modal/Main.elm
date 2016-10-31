module Modal.Main exposing (..)


type alias AppModel =
    { componetType : TypeOptionList
    , lifeCycle : TypeOptionList
    , pure : TypeOptionList
    , importCSS : TypeOptionList
    , importLibImmutableJS : TypeOptionList
    , importLibReactRouter : TypeOptionList
    , importLibRedux : TypeOptionList
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


componetType : TypeOptionList
componetType =
    [ { id = "Object"
      , label = "Object"
      , enabled = True
      }
    , { id = "Class"
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
    [ { id = "Normal CSS"
      , label = "Normal CSS"
      , enabled = False
      }
    , { id = "Classname"
      , label = "Classname"
      , enabled = False
      }
    , { id = "CSS Module"
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
    [ { id = "Connect"
      , label = "Connect"
      , enabled = False
      }
    ]
