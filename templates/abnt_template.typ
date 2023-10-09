#import("../_config.typ"): config, metadados, estilo
#import "@preview/chic-hdr:0.3.0": *
// #import "@preview/anti-matter:0.0.2": anti-matter, anti-front-end, anti-inner-end, anti-thesis
// #show: anti-matter.with(spec: (front: "i", inner: "1", back: "i"))

//  Definições úteis =================================================
#let base = (lang: "pt", fill: luma(10), tracking: 0pt, stretch: 100%, style: "normal")
#let regular =(..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.regular)
#let small = (..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.small, style: "italic")

#let sans =(..regular, font: estilo.fonte.sans)
#let mono =(..base, font: estilo.fonte.mono, weight: "regular", size: estilo.fonte.tamanho.tiny)

#let h1 = (..base, font: estilo.fonte.sans, weight: "black",  size: estilo.fonte.tamanho.huge)
#let h2 = (..h1, weight: "regular", size: estilo.fonte.tamanho.larger)
#let h3 = (..h1, weight: "light", size: estilo.fonte.tamanho.large)
#let h4 = (..h2, size: estilo.fonte.tamanho.regular)

#let pagina_branca = () => [
    #pagebreak()
    #align(center+bottom, text(..small, [Página intencionalmente deixada em branco.]))
    #pagebreak(to: "odd")
]


//  A ordem em que os elementos são definidos importa
#let template = (body, config: config) => {

  let (metadados, estilo, estrutura,) = config

  // `document` define metadados inseridos em arquivo PDF
  set document(title: metadados.titulo, author: metadados.autor.nome)

  // links e citações
  show link: it => text(fill: estilo.tema, it)
  show ref: it => text(fill: estilo.tema, it)
  // set cite(style: "alphanumerical")
  show cite: it => text(fill: estilo.tema, it)
  set cite(style: "alphanumerical")

  include("./pre.typ")
  // anti-front-end()

//  ==================MIOLO==================
// formato da página
set page(
    paper: estilo.folha,
    margin: (inside: estilo.margens.interna, top: estilo.margens.superior, outside: estilo.margens.externa, bottom: estilo.margens.inferior),
    header-ascent: 0cm,
    footer-descent: 0cm,
  )

// headers

show: chic.with(
  even:(chic-header(
    left-side: text(size: 12pt, font: estilo.fonte.sans, style: "normal", fill:luma(100), [#chic-page-number()#h(1em)#upper(chic-heading-name())]),
    // right-side: text(font: estilo.fonte.sans, style: "normal", fill:luma(100), upper(chic-heading-name())),
    ),),
  odd:(chic-header(right-side: text(size: 12pt, font: estilo.fonte.sans, style: "normal", fill:luma(100), chic-page-number())),),
  chic-height(on: "header", estilo.margens.superior)
)

// parágrafo
 set par(
    leading: estilo.espacamento.entrelinhas * estilo.fonte.tamanho.regular,
    justify: true,
    first-line-indent: 2em,)
//  set par(
//     leading: 1em,
//     justify: true,
//     first-line-indent: 2em,)

show par: set block(spacing: estilo.espacamento.entreparagrafos * estilo.fonte.tamanho.regular)
// listas
set enum(indent: 1.5em
          , body-indent: 0.4em
          , full: true, numbering: estilo.numeracao.enumeracoes)
set list(indent:1.5em
          , body-indent: 0.4em
          , marker: ([•], [--], [◦]))
// equações
set math.equation(numbering: "(1)")
show math.equation: set block(spacing: 1em)


  //Títulos - Headings

  // Suplemento é o nome usado quando se referencia um título, aqui
  // estamos definindo que um h1 é capítulo e os demais são seções,
  // poderíamos aqui definir subseção:
  // ([Capítulo], [Seção], [Subseção]).at(it.level -1, default: [Seção]) )

set heading(numbering: estilo.numeracao.titulos, supplement: it => ([capítulo], [seção]).at(it.level -1, default: [seção]) )

// Definindo cada nível de heading (título)
show heading: it => if (it.level==1){[
    #set text(..h3)
    #v(5cm)
    #block[
      #if it.numbering !=none {[Capítulo #counter(heading).display()]}
      // #set text(fill:luma(50), weight: "black", size: 1.2em, tracking: 1.2em/6)
      #set text(..h2, weight:"black", tracking: 1em/6)
      #par(first-line-indent: 0pt)[#v(-.2cm) #upper(it.body)]

    ]
    #v(1.5cm, weak: true)
  ]} else {[

    #set text(fill: luma(50), font: estilo.fonte.sans, weight: "semibold", size: 1.2em * (1- 0.05 * it.level))
    #move(dx:-2cm, dy:.3cm, block(width:100%+2cm)[
      #grid(columns: (2cm, 1fr), rows: 1, gutter: 0pt,
        align(right + bottom, pad(x:.25cm, text(weight: "medium", counter(heading).display()))),it.body)
    ])
    #v(1cm, weak: true)
  ]}

set text(..regular)
body
// anti-inner-end()
//  ==================MIOLO==================
include("./pos.typ")



}
