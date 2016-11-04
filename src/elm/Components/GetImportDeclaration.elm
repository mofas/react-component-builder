module Components.GetImportDeclaration exposing (..)

import Modal.Main exposing (TypeOptionList, isKeyEnabledInOptionList)


importReactDeclaration : String
importReactDeclaration =
    "import React from 'react';\n"


importPureRenderMixinDeclaration : String
importPureRenderMixinDeclaration =
    "import PureRenderMixin from 'react-addons-pure-render-mixin';\n"


type alias ImportCssMap =
    { importCss : Bool
    , classname : Bool
    , cssModule : Bool
    }


getImportCssMapMap : TypeOptionList -> ImportCssMap
getImportCssMapMap typeOptionList =
    let
        isKeyEnabled =
            isKeyEnabledInOptionList typeOptionList
    in
        { importCss = (isKeyEnabled "importCss")
        , classname = (isKeyEnabled "classname")
        , cssModule = (isKeyEnabled "cssModule")
        }


importCSSCodeGenerator : ImportCssMap -> String
importCSSCodeGenerator importCssMap =
    let
        importClassname =
            if importCssMap.classname then
                "import classnames from 'classnames';\n"
            else
                ""

        importCssCode =
            if importCssMap.importCss then
                "\nimport './Index.css';\n"
            else
                ""
    in
        if importCssMap.cssModule then
            """
import classnames from 'classnames/bind'
import style from './Index.css';

const cx = classnames.bind(style);
        """
        else
            importClassname ++ importCssCode


getImportDeclaration : Bool -> Bool -> TypeOptionList -> TypeOptionList -> TypeOptionList -> TypeOptionList -> String
getImportDeclaration isPure isObjectClass importCSSTypeOptionList importLibImmutableJSTypeOptionList importLibReactRouterTypeOptionList importLibReduxTypeOptionList =
    let
        importCSSMap =
            getImportCssMapMap importCSSTypeOptionList

        code =
            if isPure && isObjectClass then
                importReactDeclaration ++ importPureRenderMixinDeclaration
            else
                importReactDeclaration

        importLibImmutableJSCode =
            ""

        importCSSCode =
            importCSSCodeGenerator importCSSMap

        importLibReactRouterCode =
            ""

        importLibReduxTypeCode =
            ""
    in
        code
            ++ importLibImmutableJSCode
            ++ importLibReactRouterCode
            ++ importLibReduxTypeCode
            ++ importCSSCode
