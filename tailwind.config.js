module.exports = {
    mode: "jit",
    content: ["./templates/**/*.html", "./templates/**/*.twig"],
    safelist: [],
    theme: {
        fontFamily: {
            titillium: 'Titillium Web, sans-serif',
        },
        extend: {
            colors: {
                primary: '#1E3358',
                secondary: '#F15A29',
                tertiary: '#4D2E90',
                quaternary: '#EC297B'

            },
            fontSize: {},
        },
    },
    variants: {
        extend: {},
    },
};
