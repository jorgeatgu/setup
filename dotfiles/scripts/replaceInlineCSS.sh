function replaceCSSInline() {

    # Busco el número de línea donde estan los <style> y lo guardo en una variable
    estilosInit=$(sed -n '/<style/=' *.html)
    estilosEnd=$(sed -n '/<\/style/=' *.html)

    # Borro las líneas donde están los estilos en línea
    sed -i '' "/"$estilosInit"/{N;d;}" *.html &&
    sed -i '' "/"$estilosEnd"/{N;d;}" *.html &&

    # Incluyo la etiqueta link con el atributo inline
    sed -i '' '11a\
        <link rel="stylesheet" type="text/css" href="css/styles.css" inline>
    ' *.html

}
