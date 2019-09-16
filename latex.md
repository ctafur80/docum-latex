
---
toc: true
lang: es-ES
otherlangs: en-US
numbersections: false
title: 'Documentación de LaTeX'
author: "Carlos E. Tafur Egido"
author-meta: "Carlos E. Tafur Egido"
date: 22/05/2019
date-meta: 22/05/2019
description: "Documentación de LaTeX."
keywords:
  - diseño
  - informática
  - tipografía
  - matemáticas
  - física
# subject:
toc-depth: 3
reference-section-title: true
link-citations: true
csl: ./revista-de-filologia-espanola.csl
css:
  - ./styles/color-vars-light.css
  - ./styles/main.css


references:

- type: book
  id: latex-kopka
  author:
  - family: Kopka
    given: Helmut
  - family: Daly
    given: Patrick W.
  issued:
    date-parts:
    - - 2003
      - 12
  title: 'Guide to LaTeX'
  language: en-GB
---





# Introducción

La mejor forma de crear documentación técnica es mediante TeX o alguno de sus
derivados, como [LaTeX] o [ConTeXt]. El problema es que esto tiene también un
inconveniente nada despreciable: que es un poco incordio y le llevará más
tiempo que por otros medios como puede ser con algún LML como Markdown, por
ejemplo.

Por tanto, TeX y sus derivados, como LaTeX y ConTeXt (que son en realidad
conjuntos de macros de TeX) se emplean principalmente para hacer libros de
ciencia y tecnología. También, para los artículos académicos (*papers*) en las
principales publicaciones académicas en ciencia y tecnología.

En cuanto a su uso por los académicos en el ámbito científico, hay que
especificar que son solo una parte quienes usan TeX y sus derivados. Por
ejemplo, quienes se dedican a la medicina, no suelen usarlo, sino que lo que
suelen emplear son procesadores de texto; principalmente, Microsoft Word.



Como es posible que sepa, la versión actual de LaTeX (la versión 2e, que
comúnmente llaman LaTeX2e) es bastante antigua. Debido a esto, muchas de las
cosas se hacen mediante paquetes[^paquetes], que podrá encontrar en el
Comprehensive TeX Archive Network ([CTAN]). El problema es que terminará
haciéndose su lenguaje *ad-hoc*, lo cual personalmente no me gusta. Piense que,
además de tener que estar al tanto de los últimos paquetes, también tiene el
inconveniente de que su editor de textos puede que no entienda la sintaxis de
algunos paquetes. Debido a esto, estoy tratando de volver un poco al
minimalismo en LaTeX. Si se fija, hay paquetes que son simples y muy útiles,
como, por ejemplo, los de la AMS. Están bien pensados, como pasa con Vim, en el
que estoy tratando de hacerme también algo minimalista.

[^paquetes]: Creo que lo que llaman *paquetes* en el mundo de TeX son lo que
llamamos *librerías* en la mayoría de los lenguajes de programación.

Independientemente de esto, el grupo de expertos que mantienen el [proyecto
LaTeX] (sin contar con los paquetes) está tratando de sacar adelante la
siguiente versión de TeX, llamada [LaTeX3].

Para aprender LaTeX, lo mejor es comenzar por aprender la versión 2e (LaTeX2e).
Para esto, el manual que se suele recomendar es [LaTeX Wikibook] y, como
referencia, por ejemplo, [LaTeXref].

Se ha realizado la instalación mediante la distribución TeX Live, puede
encontrar en su máquina la documentación de los paquetes que tenga instalados.
Se encuentran bajo el directorio */usr/local/texlive/2019/texmf-dist/doc*. O,
si lo prefiere, los puede buscar en la web del Comprehensive TeX Archive
Network (CTAN).

[Al parecer][dolar-vs-paren], el marcado `\( ... \)` es preferible a usar los
signos de dólar (`$ ... $`), pues el primero es la notación en LaTeX, mientras
que el segundo es la de TeX. Por tanto, esto hará que los errores de
compilación, si usa el marcado de LaTeX, sean más entendibles.


[LaTeX]: https://www.latex-project.org
[ConTeXt]: https://wiki.contextgarden.net/Main_Page
[CTAN]: https://ctan.org
[proyecto LaTeX]: https://www.latex-project.org
[LaTeX3]: https://www.latex-project.org/latex3/
[LaTeX Wikibook]: https://en.wikibooks.org/wiki/LaTeX
[LaTeXref]: https://latexref.xyz/
[dolar-vs-paren]: https://tex.stackexchange.com/a/513/102056




# Libros y manuales

Actualmente, un manual gratuito que me parece bastante bueno es [*The No Short
Introduction to LaTeX2e*][lshort-repo], de Tobias Oetiker. Para conocer TeX
y LaTeX a un nivel algo más bajo, puede leer @latex-kopka, aunque quizás puede
valerle con el primero y uno de TeX TKTKTKTKTK.

Un documento muy interesante es el que puede encontrar en CTAN donde explican
la [codificación de fuentes tipográficas en
LaTeX](https://ctan.org/pkg/encguide).


[lshort-repo]: https://github.com/oetiker/lshort


# Paquetes


## Paquetes casi imprescindibles


### `array` {-}

El paquete [`array`](paq-array) es una ampliación de los entornos `array`
y `tabular`. Es una evolución de estos comandos de LaTeX2e. Uno de quienes
mantienen este paquete es Frank Mittelbach, así que el paquete tiene un muy
buen mantenimiento y está actualizando muy bien estos entornos tradicionales de
LaTeX.


[paq-array]: https://www.ctan.org/pkg/array


### `varioref` {-}

El paquete [`varioref`][ctan-varioref]  permite hacer referencias no solo
a números de sección, sino también incluir el título de las secciones, etc.
O quizás también necesite `nameref`. O quizás `varioref`ya haga esto, pues
actualmente lo mantiene Frank Mittelbach.


[ctan-varioref]: http://osl.ugr.es/CTAN/macros/latex/required/tools/varioref.pdf


### `lmodern` {-}

El paquete [`lmodern`][ctan-lmodern] le permite usar la fuente tipográfica
Latin Modern (LM), que es básicamente como la Computer Modern (CM), que es la
básica de TeX, es decir, la que creó Donald E. Knuth al crear TeX, pero de tipo
outline, es decir, perfilada, con tecnologías como TrueType u OpenType,
mientras que CM es rasterizada.

A veces, deseo usar otras fuentes que me gustan más o que me parecen más
modernas, como las Libertine, por ejemplo, pero para la notación matemática
viene muy bien la fuente LM. Por ejemplo, me permite escribir la omega
mayúscula como una variable, es decir, en itálicas ($\mathit{\Omega}$); se
debería usar así, por ejemplo, para designar a los espacios muestrales:
$\mathit{\Omega} = \{s_1, s_2, \ldots , s_n\}$, pues me gusta seguir la regla
de poner en itálicas las variables, aun cuando se trate de letras griegas
mayúsculas (hay quien no sigue esta regla). También le permite usarlo en
redonda, cuando sea necesario. Por ejemplo, el paquete [`siunitx`], que
actualmente me parece imprescindible, lo pone en redonda ($\mathrm{\Omega}$)
para referirme a la unidad de impedancia eléctrica ohmio: $R = 5\,
\mathrm{\Omega}$.

Para que se pueda usar una fuente de tipo OpenType o TrueType, necesita el
paquete `fontspec` y además compilar el documento mediante los motores
(*engines*) XeTeX o LuaTeX.

Últimamente, la fuente que me está gustando más es Libertine, que se puede usar
con un paquete: `libertine`, que tiene basatnte variedad de utilidades: fuentes
para matemáticas, etc. Para que la simbología matemática sea también de fuente
Libertine, deberá usar las fuentes Libertinus también.

El principal problema que le veo a la tipografía de Computer Modern ---así como
a Latin Modern, pues son iguales---, es que son fuentes muy finas, del estilo
antiguo, y, por tanto, para lectura en pantalla son bastante malas.


[ctan-lmodern]: https://ctan.org/pkg/lm?lang=en


### `amsmath` {-}

El paquete [`amsmath`][ctan-amsmath] es un paquete imprescindible si se
preocupa por la microtipografía de la notación matemática. Es desarrollado por
la American Mathematical Society (AMS) y el LaTeX3 Project.


[ctan-amsmath]: http://osl.ugr.es/CTAN/macros/latex/required/amsmath


### `xcolor` {-}

El paquete [`xcolor`][ctan-xcolor] permite definir colores (asignándoles
identificativos). Los colores que vienen en TeX y sus derivados sin paquetes
son muy pocos y no se tiene la funcionalidad de definir nuevos. Últimamente, me
estoy volviendo más minimalista y cosas como esta, por ejemplo, no las valoro
tanto. Es decir, podría crear un libro perfectamente sin colores, pues, de
hecho, los colores rompen el gris del texto ---cosa que no tiene importancia en
un libro lleno de ecuaciones y otra simbología de ese tipo--- y, por tanto,
distraen. Puede que baste con la escala de grises.

Aun así, este paquete está muy bien, pues le permite tener una gestión muy
completa de los colores. Por ejemplo, le permite expresarlos en código
hexadecimal, como suele ser el caso en el mundo del diseño web.


[ctan-xcolor]: http://osl.ugr.es/CTAN/macros/latex/contrib/xcolor



### `babel` {-}

El paquete [`babel`][ctan-babel] es imprescindible para que tenga la
funcionalidad de crear documentos en idiomas (o dialectos) distintos al inglés
de EEUU, o que contengan partes de lenguas distintas al inglés de EEUU.
Actualmente, lo mantiene [Javier Bezos], uno de los mayores expertos de TeX
y sus derivados en todo el mundo (es miembro del grupo de trabajo de LaTeX3),
y es una pasada lo bien mantenido que está este paquete; puede comprobarlo
simplemente abriendo el PDF de la documentación.

Leyendo la documentación del paquete Babel, llegué a la conclusión de que la
forma que debo usar en mis documentos es la siguiente. Por ejemplo, en español,
empleando alguna que otra vez expresiones en inglés y en latín:

    \documentclass[spanish]{book}
    \usepackage[latin,english,main=spanish]{babel}

Así, los demás paquetes tomarán como idioma de referencia el español (por
ejemplo, el paquete `varioref`) y tendré especificados otros idiomas como
secundarios. También, suelo poner el francés y el alemán, si tengo que poner
nombre de personas de los países correspondientes.

Tengo que ponerme algún día a ver qué eso de los *shorthands* de los que habla
la documentación de Babel.

Por supuesto, también deberá ver las particularidades de [Babel para el español
de España].

Surgió otro paquete, hace poco, llamado [`polyglossia`], que pretende hacer lo
mismo que `babel` pero siendo solo compatible con XeLaTeX y LuaLaTeX,
liberándose así de gran parte de la complejidad de `babel`. La cosa es que
`babel` es muy bueno y tiene un mantenimiento muy activo, por lo que creo que
seguiré con este, de momento.


[Javier Bezos]: http://www.texnia.com/
[Babel para el español de España]: https://ctan.org/pkg/babel-spanish?lang=en
[ctan-babel]: https://ctan.org/pkg/babel
[`polyglossia`]: https://ctan.org/pkg/polyglossia?lang=en



### `minted` {-}

El paquete [`minted`][ctan-minted] es un paquete para insertar listados de
código. Está bastante bien hecho, pero en realidad es una herramienta externa
a TeX; es de Python. Debido a esto, debe usar la opción `-shell-escape` para el
comando de latex (`pdflatex`, `lualatex`, etc.). Además, como siempre que
incluya alguna herramienta externa a TeX, para poder ejecutarla debe tener el
paquete `imakeidx` en su preámbulo. Que sea una herramienta externa implica
también que modificar ciertas cosas sea más complicado que en otros que sí son
internos, como, por ejemplo, `listings` y `fancyvrb`.

Puede instalar las librerías `pygments` con el gestor de paquetes `pip`:

    $ pip install pygments

Además, parece que ahora está bastante desatendido.


[ctan-minted]: https://ctan.org/pkg/minted?lang=en


### `listings` {-}

El paquete [`listings`][ctan-listings] es seguramente el mejor paquete para
listados de código, aunque tiene cosas que no me gustan. Estoy tratando de
compararlo con `fancyvrb`, a ver cuál sigue un desarrollo más activo. Tiene
algunas cosas que llevan mucho tiempo sin solucionar, como, por ejemplo, que
para escapar dentro de un `lstinline` tienes que usar la opción `mathescape`,
sin embargo, en modo display (`lstlisting`), se escapa a modo texto con la
opción `escapeinside`. Esto digamos que es un *hack*; no una solución elegante.

Otra forma sería considerando como una palabra clave (*keyword*) la que quiero
poner en texto normal. Así, puedo modificarla individualmente.


[ctan-listings]: https://www.ctan.org/pkg/listings


### `fancyvrb` {-}

El paquete [`fancyvrb`][ctan-fancyvrb] es un paquete que está muy bien para
listado de código. Tiene una carencia: el resaltado de sintaxis, pero está
previsto que en un futuro colaboren con los creadores del paquete `listings`
para aprovechar las facilidades de este en ese aspecto. Creo que aún le faltan
cosas para igualar a [`listings`] en funcionalidades.


[ctan-fancyvrb]: https://ctan.org/pkg/fancyvrb?lang=en


### `siunitx` {-}

El paquete [`siunitx`][ctan-siunitx] me parece actualmente un paquete
imprescindible, que, además, sigue siendo actualizado. Es para especificar las
unidades de modo más semántico.


[ctan-siunitx]: https://ctan.org/pkg/siunitx?lang=en



### `titlesec` {-}

El paquete [`titlesec`][ctan-titlesec] es de [Javier Bezos]. Es un paquete para
modificar los títulos (*headings*; no lo confunda con *header*) de las
secciones.


[ctan-titlesec]: https://ctan.org/pkg/titlesec?lang=en


### `titling` {-}

El paquete [`titling`][ctan-titling] no lo confunda con [`titlesec`]. Este es
para especificar el layout de la página de título. Quizás sería mejor [crearla
yo mismo con LaTeX2e a secas].


[ctan-titling]: https://ctan.org/pkg/titling?lang=en
[crearla yo mismo con LaTeX2e a secas]: https://en.wikibooks.org/wiki/LaTeX/Title_Creation


### `enumitem` {-}

El paquete [`enumitem`][ctan-enumitem] también de [Javier Bezos], para
customizar las listas.


[ctan-enumitem]: https://ctan.org/pkg/enumitem?lang=en



### `tcolorbox` {-}

El paquete [`tcolorbox`][ctan-tcolorbox] es un paquete muy bueno y muy
trabajado para hacer el layout de figuras, tablas, entornos de teoremas, de
ejemplos, etc. Se puede usar para muchas cosas. Si no estoy equivocado, está
basado en `pgf`. El paquete `tcolorbox` es muy bueno, pero supone desviarme
mucho de LaTeX. No estoy seguro de si es buena idea que lo use para crear
entornos de teoremas, figuras, etc. Últimamente, estoy tratando de no usar más
paquetes de los necesarios, y esto mismo se puede hacer sin paquetes, por lo
que preferiré no usarlo.


[ctan-tcolorbox]: https://ctan.org/pkg/tcolorbox?lang=en


### `biblatex` {-}

El paquete [`biblatex`][ctan-biblatex] es el paquete para gestión de
bibliografías que es más activo; mucho más que los demás.


[ctan-biblatex]: https://ctan.org/pkg/biblatex?lang=en









LaTeX2e tiene dos entornos (*environment*) que son muy importantes: `array`
y `tabular`. El primero es para disponer texto matemático en formas de tabla
o parecidas, le otorga versatilidad en la disposición. El segundo, para texto
normal también en tablas o, en general, con disposiciones especiales. De hecho,
estos entonrnos son tan especiales que Frank Mittelbach y David Carlisle
[crearon una nueva implementación](paq-array).

El paquete `amsmath`, que es especial y prácticamente lo usa todo el mundo que
usa LaTeX, tiene también varios entornos especiales, como son `align`,
`matrix`, etc. Estos se basan en `array` y además tienen la versión con
asterisco (`*`), que, como suele ser habitual, es igual pero sin numeración.

Para mí, la forma más adecuada de crear una disposición de ecuaciones (o, en
general, de expresiones matemáticas) en la que solo algunas tengan etiquetas
(es decir, estén numeradas) es con el entorno `align` (de `amsmath`) y usar el
comando `\nonumber` en las filas que no quiero que estén numeradas y `\label`
en las que sí.

Tiene que tener cuidado en que `array` debe ir en un entorno de *displayed
math*, mientras que `align` no.

Hay cosas que no sé hacer con `align`, como la disposición en 3 columnas. Lo
hago con `array`.



## Paquetes importantes

En cuanto a la notación en matemáticas, encontré el paquete `systeme`, que
facilita muchísimo la escritura de sistemas de ecuaciones lineales. Hace por sí
mismo la alineación. En realidad, no me gusta mucho, pues,

1. da un error en la compilación,
2. la forma de hacerlo con `array` se puede automarizar.

También, está el paquete `gauss`, que tiene una forma rápida de notación para
las transformaciones de los sistemas de ecuaciones lineales y de las matrices
por el método de Gauss (creo que hay quien lo llama forma escalonada reducida.
Creo que [aquí](https://math.stackexchange.com/a/879969) explican la
diferencia.



## Paquetes que me gusta tener


### `ifthen` {-}

El paquete [`ifthen`][ctan-ifthen] alguna vez he necesitado usar una estructura
condicional en el compilado de un documento. Viene muy bien, pues le permite
mucha versatilidad a la hora de compilar el documento.


[ctan-ifthen]: http://osl.ugr.es/CTAN/macros/latex/base/ifthen.pdf


### `caption` {-}

El paquete [`caption`][ctan-caption] necesario si quiere cambiar la fuente de
las captions de las figuras y las tablas. A mí, por ejemplo, me gusta que estén
en letra sans-serif y, además, algo más pequeñas que el texto del cuerpo. Lo
pongo en el preámbulo:

    \usepackage[font=sf, labelfont={sf}]{caption}


[ctan-caption]: http://osl.ugr.es/CTAN/macros/latex/contrib/caption/caption-eng.pdf



### `rotating` {-}

El paquete [`rotating`][ctan-rotating] puede que necesite este paquete, si
desea rotar una tabla en un documento. Alguna vez lo he necesitado, para algo
puntual. Creo que sería bastante complicado de implementar en LaTeX2e sin un
paquete específico.


[ctan-rotating]: https://ctan.org/pkg/rotating?lang=en


### PGF/TikZ {-}

El paquete [PGF/TikZ][ctan-pgf-tikz] el paquete PGF sería más bien un
metapaquete. Según dicen en su web en CTAN, es un paquete de macros para crear
gráficos. Viene con una capa de sintaxis, por encima, más sencilla llamada
TikZ, de ahí que mucha gente lo llame "PGF/TikZ". Este paquete está
supertrabajado. Solo hay que ver el manual y la de gráficos que puedes hacer
con él. Tiene otros paquetes derivados, como, por ejemplo, [`circuitikz`], para
crear esquemas de circuitos eléctricos y electrónicos. Existen [otros muchos
paquetes basados en PGF/TikZ].

Hace poco, descubrí que tienen [un tutorial en formato web][pgf-web-tuto], que
está transformado de LaTeX, imagino que con el paquete [`lwarp`].


[ctan-pgf-tikz]: https://ctan.org/pkg/pgf?lang=en
[pgf-web-tuto]: https://pgf-tikz.github.io/
[otros muchos paquetes basados en PGF/TikZ]: http://www.texample.net/tikz/examples/


### `pgfplots` {-}

El paquete [`pgfplots`][ctan-pgfplots] es, en mi opinión, el mejor paquete para
hacer gráficas. Mucha gente usa algún paquete que le permita insertar gráficas
hechas en alguna librería de Python, como, por ejemplo, Matplotlib, pero a mí
no me ha gustado mucho. Es normal que mucha gente lo haga así, puesto que
Python es un lenguaje muy usado para en análisis de datos en ciencia. El
paquete `pgfplots` está basado en [PGF]. Yo lo prefiero porque es una
herramienta de TeX; no una externa que tengo que integrar. Además, al estar
basado en PGF, la calidad tipográfica que otorga a sus gráficos es excelente.

Al parecer, según explican en el manual de PFG/TikZ, se pueden hacer gráficas
directamente en PGF o TikZ, pero aconsejan que, si no desea complicarse mucho,
use algún paquete como `pgfplots`.


[ctan-pgfplots]: https://ctan.org/pkg/pgfplots?lang=en


### `circuitikz` {-}

El paquete [`circuitikz`][ctan-circuitikz] para dibujar esquemas de circuitos
eléctricos. Está basado en PFG/TikZ. Lo considero la mejor opción para hacer
esquemas de electrónica. Hay libros publicados sobre la materia (electrónica,
etc.) y la calidad que tienen en sus gráficos de los esquemas eléctricos es muy
mediocre si se la compara con lo que se puede conseguir con este paquete.


[ctan-circuitikz]: https://ctan.org/pkg/circuitikz





### `chemfig` {-}

El paquete [`chemfig`][ctan-chemfig] otro paquete increíblemente bueno para
gráficos de temas de ciencia y tecnología: en este caso, de símbolos de
moléculas químicas. Solo hay que echar un vistazo al manual para ver que es de
una grandísima calidad.


[ctan-chemfig]: https://ctan.org/pkg/chemfig


### `flowchart` {-}

El paquete [`flowchart`][ctan-flowchart] paquete basado en PGF/TikZ para el
dibujo de diagramas de flujo (*flowcharts*). Realmente, no me parece tan buena
idea el uso de este paquete, pues, [con TikZ se puede hacer también un
flowchart] con mayor calidad.


[ctan-flowchart]: https://ctan.org/pkg/flowchart
[con TikZ se puede hacer también un flowchart]: http://www.texample.net/tikz/examples/simple-flow-chart/




### `tkz-graph` {-}

El paquete [`tkz-graph`][ctan-tkz-graph] para dibujar grafos de la teoría de
grafos en matemáticas. También, puede hacerse sin necesidad de usar un paquete
específico, sino que [podría hacerse directamente con
PFG/TikZ][tikz-teor-graph].


[ctan-tkz-graph]: https://ctan.org/pkg/tkz-graph
[tikz-teor-graph]: https://tex.stackexchange.com/questions/270543/draw-a-graph-in-latex-with-tikz


### `nicematrix` {-}

El paquete [`nicematrix`][ctan-nicematrix] para tener matrices incompletas más
bonitas. En realidad, no es muy necesario. Eso sí, el paquete está muy
trabajado y tiene un mantenimiento bastante activo.


[ctan-nicematrix]: https://ctan.org/pkg/nicematrix


### `lwarp` {-}

El paquete [`lwarp`][ctan-lwarp] creo que es ahora mismo el mejor conversor
a HTML desde LaTeX, pues es el más moderno y el autor ha puesto muchísimo
empeño. Es una pasada. El manual tiene más de 1000 páginas. El problema es que
es muy difícil de usar. Los dos únicos documentos que he visto que se han
podido transformar bien, con calidad, de LaTeX a HTML, son la [documentación
oficial de `lwarp`] y [el tutorial de PGF y TikZ en versión web][pgf-web-tuto].


[ctan-lwarp]: https://ctan.org/pkg/lwarp
[documentación oficial de `lwarp`]: http://bdtechconcepts.com/


### `mathastext` {-}

El paquete [`mathastext`][ctan-mathastext] es para usar símbolos matemáticos
basados en alguna fuente distinta a la típica Computer Modern, que es muy
fina... Está muy bien este paquete, además de que está muy bien mantenido. Es
algo difícil de usar. Actualmente, lo que hago es usar la fuente Libertine, que
también se puede usar sus fuentes de simbología matemática.


[ctan-mathastext]:https://ctan.org/pkg/mathastext?lang=en





































