module.exports = ({ env }) => ({
    plugins: [
        require("postcss-import"),
        require('tailwindcss'),
        require('autoprefixer'),
        require('cssnano')
    ]
})