import path from 'path';
import webpack from 'webpack';
import HtmlWebpackPlugin from 'html-webpack-plugin';

const PORT = process.env.PORT || 8888;
const HOST = process.env.HOST || 'localhost';

const config = {

  entry: {
    app: [
      `webpack-dev-server/client?http://${ HOST }:${ PORT }`,
      'webpack/hot/only-dev-server',
      './src/static/index.js',
    ],
  },

  output: {
    path: path.join(__dirname, 'build'),
    filename: '[name].js',
  },

  cache: true,
  devtool: 'eval',

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new HtmlWebpackPlugin({
      environment: 'dev',
      favicon: 'src/favicon.ico',
      filename: 'index.html',
      template: 'src/static/index.html',
      title: 'React Component Builder',
    }),
    new webpack.LoaderOptionsPlugin({
      options: {
        postcss: [
          require('autoprefixer'),
          require('postcss-nested'),
        ],
      }
    }),
  ],

  resolve: {
    modules: [
      'src',
      'node_modules'
    ],
    extensions: ['.js', '.elm'],
  },

  module: {
    noParse: /\.elm$/,
    loaders: [
      {
        test:    /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader:  'elm-hot!elm-webpack?verbose=true&warn=true'
      },
      {
        test: /\.css$/,
        loader: 'style!css!postcss',
      },
      {
        test: /\.(jpg|png|gif|eot|svg|ttf|woff|woff2)$/,
        loader: 'url',
        query: {
          limit: 10000,
        }
      },
    ],
  },
};

export default config;
