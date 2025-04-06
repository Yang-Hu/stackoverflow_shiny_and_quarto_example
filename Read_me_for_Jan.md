Hi Jan, thank you for taking the time to look into this issue. I’ve rebuilt the Shiny app in a non-golem format while
maintaining key features such as modules and the general layout to replicate the real app structure.

The app is now self-contained in a single app.R file. Two additional files are still sourced, as they are essential
for the app’s logic—removing them would result in an environment that differs from the one in which the issue occurs.

For modules that are essential to the app but irrelevant to the issue, I’ve added a note ‘(please fold)’ at the end of
the section header—feel free to fold those sections to reduce visual clutter. For key modules, I’ve included a specific
note at the end of their section headers as well.

I hope this is useful, and thank you again for your help, it is much appriciated. The updated project structure is
shown below:
.
├── app.R
├── control_quarto_theme_from_Shiny.Rproj
├── fct_select_area.R
├── mod_body_overview.R
└── www
    ├── _site
    │   ├── about.html
    │   ├── index.html
    │   ├── search.json
    │   ├── site_libs
    │   │   ├── bootstrap
    │   │   │   ├── bootstrap-dark.min.css
    │   │   │   ├── bootstrap-icons.css
    │   │   │   ├── bootstrap-icons.woff
    │   │   │   ├── bootstrap.min.css
    │   │   │   └── bootstrap.min.js
    │   │   ├── clipboard
    │   │   │   └── clipboard.min.js
    │   │   ├── quarto-html
    │   │   │   ├── anchor.min.js
    │   │   │   ├── popper.min.js
    │   │   │   ├── quarto-syntax-highlighting-dark.css
    │   │   │   ├── quarto-syntax-highlighting.css
    │   │   │   ├── quarto.js
    │   │   │   ├── tippy.css
    │   │   │   └── tippy.umd.min.js
    │   │   ├── quarto-nav
    │   │   │   ├── headroom.min.js
    │   │   │   └── quarto-nav.js
    │   │   └── quarto-search
    │   │       ├── autocomplete.umd.js
    │   │       ├── fuse.min.js
    │   │       └── quarto-search.js
    │   └── styles.css
    └── img
        └── sweeping_fractal_lines.svg
