module Components.CodeGenerator exposing (..)

-- import Debug exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Modal.Main exposing (AppModel, TypeOptionList)


importReactDeclaration : String
importReactDeclaration =
    """import React from 'react';"""


importPureRenderMixinDeclaration : String
importPureRenderMixinDeclaration =
    """
import PureRenderMixin from 'react-addons-pure-render-mixin';"""


objectComponentHeader : String
objectComponentHeader =
    """

const ComponentName = React.createClass({"""


objeComponentPureMixin : String
objeComponentPureMixin =
    """

mixins: [PureRenderMixin],"""


objeComponentctBody : String
objeComponentctBody =
    """

"""


objectComponentFooter : String
objectComponentFooter =
    """
    render(){
      const {props} = this;

      return (
        <div></div>
      );
    }
});"""


classComponentHeader : String
classComponentHeader =
    """

class ComponentName extends React.Component {"""


pureClassComponentHeader : String
pureClassComponentHeader =
    """

class ComponentName extends React.PureComponent {"""


classComponentBody : String
classComponentBody =
    """

    constructor(props) {
      super(props);
    }

"""


classComponentFooter : String
classComponentFooter =
    """
    render(){
      const {props} = this;

      return (
        <div></div>
      );
    }
}"""


exportDeclaration : String
exportDeclaration =
    """

export default ComponentName;"""



-- Update


type Msg
    = Noop



-- View


getImportDeclaration : Bool -> Bool -> String
getImportDeclaration isPure isObjectClass =
    if isPure && isObjectClass then
        importReactDeclaration ++ importPureRenderMixinDeclaration
    else
        importReactDeclaration


getComponentHeader : Bool -> Bool -> String
getComponentHeader isPure isObjectClass =
    if isObjectClass then
        if isPure then
            objectComponentHeader ++ objeComponentPureMixin
        else
            objectComponentHeader
    else if isPure then
        pureClassComponentHeader
    else
        classComponentHeader


type alias LifeCycleMap =
    { defaultProps : Bool
    , componentWillMount : Bool
    , componentDidMount : Bool
    , componentWillReceiveProps : Bool
    , shouldComponentUpdate : Bool
    , componentWillUpdate : Bool
    , componentDidUpdate : Bool
    , componentWillUnmount : Bool
    }


isKeyEnabledInOptionList : TypeOptionList -> String -> Bool
isKeyEnabledInOptionList typeOptionList id =
    typeOptionList
        |> List.filter (\x -> x.id == id)
        |> List.all (\x -> x.enabled == True)


getLifeCycleMap : TypeOptionList -> LifeCycleMap
getLifeCycleMap lifecycleList =
    let
        isKeyEnabled =
            isKeyEnabledInOptionList lifecycleList
    in
        { defaultProps = (isKeyEnabled "defaultProps")
        , componentWillMount = (isKeyEnabled "componentWillMount")
        , componentDidMount = (isKeyEnabled "componentDidMount")
        , componentWillReceiveProps = (isKeyEnabled "componentWillReceiveProps")
        , shouldComponentUpdate = (isKeyEnabled "shouldComponentUpdate")
        , componentWillUpdate = (isKeyEnabled "componentWillUpdate")
        , componentDidUpdate = (isKeyEnabled "componentDidUpdate")
        , componentWillUnmount = (isKeyEnabled "componentWillUnmount")
        }


getDefaultPropCode : Bool -> String
getDefaultPropCode isObjectClass =
    if isObjectClass then
        """
    defaultProps(){
      return {

      }
    },
"""
    else
        """
    static defaultProps = {

    }
"""


getComponentBody : Bool -> TypeOptionList -> String
getComponentBody isObjectClass lifeCycleTypeOptionList =
    let
        lifeCycleMap =
            getLifeCycleMap lifeCycleTypeOptionList

        code =
            if isObjectClass then
                objeComponentctBody
            else
                classComponentBody

        defaultPropsCode =
            if lifeCycleMap.defaultProps then
                getDefaultPropCode isObjectClass
            else
                ""

        componentWillMountCode =
            if lifeCycleMap.componentWillMount then
                ""
            else
                ""

        componentDidMountCode =
            if lifeCycleMap.componentDidMount then
                ""
            else
                ""

        componentWillReceivePropsCode =
            if lifeCycleMap.componentWillReceiveProps then
                ""
            else
                ""

        shouldComponentUpdateCode =
            if lifeCycleMap.shouldComponentUpdate then
                ""
            else
                ""

        componentWillUpdateCode =
            if lifeCycleMap.componentWillUpdate then
                ""
            else
                ""

        componentDidUpdateCode =
            if lifeCycleMap.componentDidUpdate then
                ""
            else
                ""

        componentWillUnmountCode =
            if lifeCycleMap.componentWillUnmount then
                ""
            else
                ""
    in
        code
            ++ defaultPropsCode
            ++ componentWillMountCode
            ++ componentDidMountCode
            ++ componentWillReceivePropsCode
            ++ shouldComponentUpdateCode
            ++ componentWillUpdateCode
            ++ componentDidUpdateCode
            ++ componentWillUnmountCode


codeGenerator : AppModel -> Html Msg
codeGenerator model =
    let
        isObjectClass =
            model.componetType
                |> List.filter (\x -> x.id == "object")
                |> List.all (\x -> x.enabled == True)

        isPure =
            model.pure
                |> List.all (\x -> x.enabled == True)

        importDeclaration =
            getImportDeclaration isPure isObjectClass

        componentHeader =
            getComponentHeader isPure isObjectClass

        componentBody =
            getComponentBody isObjectClass model.lifeCycle

        snippetCode =
            if isObjectClass then
                importDeclaration
                    ++ componentHeader
                    ++ componentBody
                    ++ objectComponentFooter
                    ++ exportDeclaration
            else
                importDeclaration
                    ++ componentHeader
                    ++ componentBody
                    ++ classComponentFooter
                    ++ exportDeclaration
    in
        div
            [ class "code-generator-section" ]
            [ textarea
                [ class "code-snippet" ]
                [ text snippetCode ]
            ]
