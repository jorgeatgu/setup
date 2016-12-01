# initCSS

Esta es la base de CSS para iniciar cualquier proyecto con postCSS.

Plugins:

* postcss-custom-properties
* postcss-custom-selectors
* postcss-import
* postcss-nested
* postcss-pxtorem
* postcss-reporter
* postcss-sorting
* stylelint

### Estructura

```
/
├─ src/              # Master
│  ├─ css/
│  │  ├─ icons/      # Favicon and home screen icons
│  │  ├─ images/     # Raster images (used in component examples)
│  │  ├─ scripts/    # JavaScript files
│  │  ├─ styles/     # CSS files
│  │  └─ vectors/    # SVG images, icons and logos
│  ├─ img/           # Imágenes
│  └─ js/            # JavaScript
│
├─ css/              # CSS minificado y purificado para producción
├─ js/               # JavaScript para producción
├─ img/              # Imágenes optimizadas para producción
├─ .gitignore        # Lista de archivos excluídos en Git
├─ .stylelintrc      # Linteando en modo espartano
├─ gulpfile.js       # Gulp!
└─ package.json      # Dependencias
```

[Un artículo sobre función de bash que inicia toda la magia](http://jorgeatgu.com/blog/iniciando-proyectos-desde-cero/)




