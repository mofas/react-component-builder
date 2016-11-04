module Components.CodeGenerator exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Modal.Main exposing (AppModel, TypeOptionList)
import Components.GetComponentBodyCode exposing (getComponentBody)
import Components.GetImportDeclaration exposing (getImportDeclaration)


objectComponentHeader : String
objectComponentHeader =
    """

const ComponentName = React.createClass({"""


objeComponentPureMixin : String
objeComponentPureMixin =
    """

mixins: [PureRenderMixin],"""


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
            getImportDeclaration
                isPure
                isObjectClass
                model.importCSS
                model.importLibImmutableJS
                model.importLibReactRouter
                model.importLibRedux

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
