import path from 'path';
import webpack from 'webpack';
import ExtractTextPlugin from 'extract-text-webpack-plugin';
import HtmlWebpackPlugin from 'html-webpack-plugin';
import CopyWebpackPlugin from 'copy-webpack-plugin';

const config = {

  entry: {
    app: path.join( __dirname, '../src/static/index.js' ),
  },

  output: {
    path: './dist/',
    filename: '[name].[hash].js',
  },

  cache: true,
  devtool: 'cheap-source-map',

  stats: {
    colors: true,
    reasons: false,
  },

  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      mangle: {
        screw_ie8: true
      },
      output: {
        comments: false,
        screw_ie8: true
      },
      compress: {
        warnings: false
      },
    }),
    new webpack.optimize.DedupePlugin(),
    new ExtractTextPlugin('[name].[hash].css'),
    new HtmlWebpackPlugin({
      environment: 'production',
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
    new CopyWebpackPlugin([
      {
        from: 'src/static/img/',
        to:   'static/img/'
      },
      {
        from: 'src/favicon.ico'
      },
    ]),
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
        loader:  'elm-webpack'
      },
      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract({ notExtractLoader: 'style', loader: 'css!postcss' })
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
