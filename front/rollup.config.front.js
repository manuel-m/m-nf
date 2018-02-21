import buble from 'rollup-plugin-buble';
import cjs from 'rollup-plugin-commonjs';
// import eslint from 'rollup-plugin-eslint'; [!] provoke error
import globals from 'rollup-plugin-node-globals';
import { minify } from 'uglify-es';
import replace from 'rollup-plugin-replace';
import resolve from 'rollup-plugin-node-resolve';
import uglify from 'rollup-plugin-uglify';

var _outputDir = '../dist';

export default {
    input: 'front/nf-front.index.js',
    output: {
        file: 'dist/nf-front.app.js',
        format: 'iife'
    },
    plugins: [
        buble(),
        cjs({
            exclude: 'node_modules/process-es6/**',
            include: [
                'node_modules/create-react-class/**',
                'node_modules/fbjs/**',
                'node_modules/object-assign/**',
                'node_modules/react/**',
                'node_modules/react-dom/**',
                'node_modules/prop-types/**'
            ]
        }),
        globals(),
        replace({ 'process.env.NODE_ENV': JSON.stringify('development') }),
        resolve({
            browser: true,
            main: true
        })
    ]
};
