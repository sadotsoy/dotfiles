module.exports = {
  root: true,
  extends: ['eslint:recommended'],
  globals: {
    IS_DEVELOPLMENT: 'readonly',
  },
  parserOptions: {
    ecmasVersion: 2021,
    sourceType: 'module',
    ecmaFeatures: {
      modules: true,
    },
  },
  parser: 'babel-eslint',
  env: {
    es6: true,
    node: true,
    browser: true,
    commonjs: true,
  },
  rules: {
    'no-console': 'error',
    semi: ['error', 'always'],
    'prefer-const': [
      'error',
      {
        destructuring: 'any',
        ignoreReadBeforeAssign: false,
      },
    ],
    quotes: [2, 'single', { avoidEscape: true }],
  },
};
