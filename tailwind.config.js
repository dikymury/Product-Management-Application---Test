/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./resources/views/frontend/**/*.{html,js,php}'],
  theme: {
    fontFamily: {
      body: ['inter', 'sans-serif'],
    },
    colors: {
      white: {
        DEFAULT: '#FFFFFF',
        1: '#FAFAFA',
      },
      black: {
        dark: "#000000",
        DEFAULT: '#171717',
        light: '#00000099',
        1: '#343434',
        2: '#262626',
      },
      gray: {
        DEFAULT: '#DFDFDF',
        1: '#626262',
        2: '#dedede',
        3: '#F5F5F5',
        4: "#C3C3C3",
        5: "#EAEAEA",
        6: "#D9D9D9"
      },
      primary: {
        light: "#168DE3",
        DEFAULT: '#01528D',
        dark: '#1E293B',
      },
      secondary: {
        light: '#9bc0d1',
        DEFAULT: '#EC4137',
        dark: '#7b99a7',
      },
      success: {
        light: '#87DABE',
        DEFAULT: '#4ACEA1',
        dark: '#4A7868',
      },
      warning: {
        light: '#EE3E2E',
        DEFAULT: '#EFC987',
        dark: '#EA9B15',
      },
      error: {
        light: '#FFC562',
        DEFAULT: '#FF2047',
        dark: '#9D342A',
      },
    },
    screens: {
      xs: '450px',
      // => @media (min-width: 640px) { ... }

      sm: '640px',
      // => @media (min-width: 640px) { ... }

      md: '768px',
      // => @media (min-width: 768px) { ... }

      lg: '1024px',
      // => @media (min-width: 1024px) { ... }

      xl: '1280px',
      // => @media (min-width: 1280px) { ... }

      '2xl': '1440px',
      // => @media (min-width: 1440px) { ... }
    },
    extend: {},
  },
  plugins: [],
}
