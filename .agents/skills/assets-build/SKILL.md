---
name: assets-build
description: 'Compile LESS themes and minify JavaScript/CSS with npm scripts. Use when asked to compile less files, build theme css from Theme.less, minify js/css, regenerate .min.min.css/.min.js assets, or run gulp tasks in this repo.'
---

# Asset Build

Compile LESS → CSS or minify JS/CSS via npm scripts defined in `package.json` (gulp tasks in `gulpfile.js`).


## Compile a single less file

```bash
npm run compile:less -- --file <path-to-less>
```

- Requires a `.less` input path; missing `--file` throws a usage error.
- Writes `<file>.css`, `<file>.min.css` and source maps next to the source file.

Example:

```bash
npm run compile:less -- --file "src/Plugins/ZKEACMS.Shop/Content/shop.less"
```

## Compile a theme

```bash
npm run compile:theme                   # default theme: "Default"
npm run compile:theme -- --theme <Name>
```

- Compiles `wwwroot/themes/<Name>/css/Theme.less` → `Theme.css` + `Theme.min.css` in the same folder.

## Compile all themes

```bash
npm run compile:themes
```

- Compiles `Theme.less` for every theme under `wwwroot/themes/*/css/`.

## Minify ALL JS and CSS

Minifies all JS and CSS files under `src/` (except for excluded paths: `wwwroot/lib/**` vendored libraries, `**/bin/**`/`**/obj/**` build output, already-minified `*.min.*` files, and `_references.js`) and writes `.min.js` / `.min.css` next to each source file.

```bash
npm run minify            # parallel: JS + CSS (runs both minify:all:js and minify:all:css)
npm run minify:all:js     # JS only
npm run minify:all:css    # CSS only
```

Note: Do not use this command unless you want to regenerate all minified assets.

## Minify a single js/css file

Minifies one JS or CSS file and writes the `.min.*` output next to the source file.

```bash
npm run minify:file -- --file <path-to-js-or-css>
```

- Requires a `.js` or `.css` input path; other extensions throw a usage error.
- Picks the compressor automatically: `.js` → uglify, `.css` → cleanCSS.

Example:

```bash
npm run minify:file -- --file "src/Plugins/ZKEACMS.Message/Scripts/comments.js"
npm run minify:file -- --file "src/Plugins/ZKEACMS.Message/Content/comments.css"
```