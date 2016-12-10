# React Component Builder

Building React component scaffolding in a second.

## Why this project?

Creating new React components cost us lots of time, especially when you use lots of libraries or patterns to construct complex web application. Even with helper code snippets, we still need to do some grinded configurations because each component has different functionalities.

For example, I use Immutable.js, Redux, and CSS Module in my projects. We usually need to include those libraries in our React components. However, putting all code of importing libraries into a single code snippet is problematic too. We don't use all those libraries in every components. Therefore, we want to able to configure the code snippets. After several thoughts, I believe building a UI to configure those setting to generate a new React component template is the best solution to solve this problem. I hope this tool can help you if you encounter the same problem. 

Feel free to fork to create your React component scaffolding generator! 


**[Demo](https://mofas.github.io/react-component-builder/dist/)**

## Setup

### Dependencies

This project is built by Elm, which is cool and fun.


If you are not familiar with Elm. You can get more information [here](http://elm-lang.org/).


If you haven't done so yet, install Elm globally:
```
yarn global add elm
```

Install JS dependencies:
```
yarn
```

Install Elm's dependencies:
```
elm package install
```


## Development

```
npm start
```


## License

MIT Licensed.
