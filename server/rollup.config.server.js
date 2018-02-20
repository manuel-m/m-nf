// import cjs from 'rollup-plugin-commonjs';
import { minify } from 'uglify-es';
import resolve from 'rollup-plugin-node-resolve';
import uglify from 'rollup-plugin-uglify';

var _outputDir = './dist';

export default {
    input: 'server/nf-server.index.js',
    output: {
        file: _outputDir + '/nf-server.js',
        format: 'cjs',
        name: 'nf-server'
    },
    plugins: [
        // eslint(),
        resolve({ extensions: ['.js'] }),
        uglify(
            {
                compress: {
                    sequences: true,
                    properties: true,
                    dead_code: true,
                    drop_debugger: false,
                    unsafe: false,
                    conditionals: true,
                    comparisons: true,
                    evaluate: true, // [!] disable asm.js if true
                    booleans: true,
                    loops: true,
                    unused: true,
                    hoist_funs: true,
                    hoist_vars: true,
                    if_return: true,
                    join_vars: true,
                    side_effects: false,
                    warnings: true
                },
                mangle: false,
                output: {
                    beautify: true
                }
            },
            minify // [!] uglify-es
        )
    ]
};