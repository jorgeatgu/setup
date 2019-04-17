function inlineCSS () {

    #Si tu CSS ocupa menos de 50kb deberías de incluirlo en una etiqueta <style>, recomendación de Google en AMP.
    sizeM="50000"

    #Obtenemos el tamaño en bytes de nuestro archivo CSS
    size=`stat -x css/styles.css | grep Size: | awk '{ print $2 }'`

    # Si el CSS ocupa menos de 50kb lanzamos el script para insertar los estilos en línea, después removemos el
    # CSS que no usamos :)
    if [ "$size" -le "$sizeM" ];
        then
        npm run inline:css &&
        npm run remove:uncss &&
        open -a terminal-notifier --args -message "CSS style inline!!" -title "🤓" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
    else
        open -a terminal-notifier --args -message "Tu CSS ocupa más de 50Kb, algo estás haciendo mal" -title "🙄" -appIcon "/Users/jorgeatgu/Downloads/logo.png" -sound "Glass"
    fi
}
