// Note: You must restart bin/webpack-watcher for changes to take effect

const webpack = require('webpack')
const path = require('path')
const process = require('process')
const glob = require('glob')
const extname = require('path-complete-extname')

let distDir = process.env.WEBPACK_DIST_DIR

if (distDir === undefined) {
    distDir = 'packs'
}

const config = {
    entry: glob.sync(path.join('app', 'javascript', 'packs', '*.js*')).reduce(
                   (map, entry) => {
                       const basename = path.basename(entry, extname(entry))
                           const localMap = map
                           localMap[basename] = path.resolve(entry)
                           return localMap
                   }, {}
                   ),

    output: {
        filename: '[name].js',
        path: path.resolve('public', distDir)
    },

    module: {
        rules: [
        { test: /\.coffee(\.erb)?$/, loader: 'coffee-loader' },
        {
            test:/\.(js|jsx)$/,
            exclude: /node_modules/,
            loader: 'babel-loader',
            options: {
                presets: [
                    'react',
                    ['env', { es2015: { modules: false } }]
                ]
            }
        },
        {
            test: /\.erb$/,
            enforce: 'pre',
            exclude: /node_modules/,
            loader: 'rails-erb-loader',
            options: {
                runner: 'DISABLE_SPRING=1 bin/rails runner'
            }
        },
        {
            test: /\.(sass|scss)$/,
            loader: ['style-loader', 'css-loader', 'sass-loader'],
        },
         {
            test: /\.(png|jpg)$/,
            loader: ['url-loader']
        },
            {
                test: /\.(eot|svg|ttf|woff|woff2)$/,
                loader: 'file?name=app/assets/fonts/[name].[ext]'
            }
            ]
    },

    plugins: [
        new webpack.EnvironmentPlugin(Object.keys(process.env))
    ],

    resolve: {
        extensions: ['.js', '.jsx', '.coffee'],
        modules: [
            path.resolve('app/javascript'),
            path.resolve('node_modules')
        ]
    },

    resolveLoader: {
        modules: [path.resolve('node_modules')]
    }
}

module.exports = {
    distDir,
    config
}
