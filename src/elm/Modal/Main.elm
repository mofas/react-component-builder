module Modal.Main exposing (..)


type alias AppModel =
    { componetType : TypeOptionList
    , lifeCycle : TypeOptionList
    , pure : TypeOptionList
    , importLib : TypeOptionList
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


importLib : TypeOptionList
importLib =
    []
