import {defineConfig} from 'vite';
import manifestSRI from 'vite-plugin-manifest-sri';
import path from 'path';
import viteCompression from 'vite-plugin-compression';
import ViteRestart from 'vite-plugin-restart';
import critical from 'rollup-plugin-critical';

// https://vitejs.dev/config/
export default defineConfig(({command}) => ({
    base: command === 'serve' ? '' : '/dist/',
    build: {
        commonjsOptions: {
            transformMixedEsModules: true,
        },
        manifest: true,
        outDir: 'web/dist/',
        rollupOptions: {
            input: {
                app: 'src/js/App.js',
            },
            output: {
                sourcemap: true
            },
        },
    },
    plugins: [
        critical({
            criticalUrl: 'http://localhost',
            criticalBase: './web/dist/criticalcss/',
            criticalPages: [
                { 
                    uri: '/', 
                    template: '_index' 
                },
            ],
            criticalConfig: {},
        }),
        manifestSRI(),
        viteCompression({
            filter: /\.(js|mjs|json|css|map)$/i
        }),
        ViteRestart({
            reload: [
                'templates/**/*',
            ],
        }),
    ],
    publicDir: path.resolve(__dirname, 'src/public'),
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'src'),
            '@css': path.resolve(__dirname, 'src/css'),
            '@js': path.resolve(__dirname, 'src/js'),
        },
    },
    server: {
        host: '0.0.0.0',
        port: 3000,
        strictPort: true,
    },
}));