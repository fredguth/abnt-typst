#let metadados = (
    titulo: "Naufrágio e ressureição da imagem",
    subtitulo: "A fotografia de Aylan Kurdi inquieta o imaginário
contemporâneo",
    título-curto: none,
    codigo_cutter: "RR696n", //ex. S659n
    codigo_cdu: none,//ex. 911.375:028
    tipo_trabalho: "Dissertação de Mestrado",
    titulacao_objetivo: "Mestrado em Comunicação", //ex. "Tese de Doutorado", "Dissertação de Mestrado"
    programa_pos: "Programa de Pós Graduação em Comunicação", //ex. Ciência da Computação
    Departamento: "Faculdade de Comunicação",
    autor: (nome: "Anna Cristina de Araújo Rodrigues", sobrenome_nome: "Rodrigues, Anna Cristina de Araújo"),
    publicacao: (
      preambulo:"Dissertação apresentada como requisito para obtenção
do título de mestre. Linha de Pesquisa: Imagem, Som e Escrita.

Orientador: Prof. Dr. Sérgio Araújo de Sá" ,
      local: "Brasília",
      instituicao: "UnB",
      logo_instituicao: "../arquivos/logo_unb.svg",
      data: 2018,
      palavras-chave: "\1. Fotografia .  2. Aylan Kurdi . 3. Imagem e imaginário . 4. Redes sociais . 5. Sociedade em rede. I. Araújo de Sá, Sérgio, orient. II. Título"
    ),
    //instituicoes de pessoas relacionadas ao trabalho academico
    supervisao: ((
      tipo: "Orientador",
      nome: "Prof. Dr. Sérgio Araújo de Sá",
      afiliacao: "",),(
      tipo: "Coorientador",
      nome: "Nome da pessoa",
      afiliacao: "2",),(
      tipo: "Banca",
      nome: "Nome da pessoa",
      afiliacao: "1",)),

  )

#let estilo = (
    folha: "a4",
    // ABNT NBR 14724:2011 §5.1 - FORMATO
    // (...) utilizar papel branco ou reciclado, no formato A4 (21 cm × 29,7 cm).

    margens: (interna: 3cm, externa: 2cm, superior: 3cm, inferior: 2cm),
    // ABNT NBR 14724:2011 §5.1 - FORMATO
    // As margens devem ser: para o anverso, esquerda e superior de 3 cm e
    // direita e inferior de 2 cm; para o verso, direita e superior de 3 cm
    // e esquerda e inferior de 2 cm.

    fonte:(
        // serif:"Times New Roman",
        serif:"STIX Two Text",
        // sans:"TeX Gyre Heros",
        // sans:"Helvetica",
        sans:"Lato",
        mono:"SF Mono",
        tamanho:(normal: (size:1em)
            , large: 18pt
            , larger: 20pt
            , huge: 25pt
            , small: 10pt
            , tiny: 7pt
            , corpo: 12pt
            , regular:12pt
            ,
        ),
    ),

    // ABNT NBR 14724:2011 §5.1 - FORMATO
    // Recomenda-se, quando digitado, a fonte tamanho 12 para todo o trabalho (...)
    // Tamanhos de letra baseadas na regular. regular = 1em
    espacamento: (
        // ABNT NBR 14724:2011 §5.2 - ESPAÇAMENTO
        // Todo texto deve ser digitado ou datilografado com espaçamento 1,5 entre linhas
        // entrelinhas: 1.5,
        entrelinhas: 1,
        entreparagrafos: 1.5,
        titulos: 3,
        ),
    numeracao: (titulos: "1.1.1.1.1", enumeracoes: "1.1.1.1.1.",),
    tema: red.darken(50%), // cor do tema (afeta links e outros pequenos detalhes)

  )



 // definições de fonte
 #let base = (lang: "pt", fill: luma(10), tracking: 0pt, stretch: 100%, style: "normal")
 #let regular =(..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.regular)
 #let sans =(..regular, font: estilo.fonte.sans)
 #let mono =(..base, font: estilo.fonte.mono, weight: "regular", size: estilo.fonte.tamanho.tiny)

 //luma é grayscale de 0 a 255
 #let h1 = (..base, font: estilo.fonte.sans, weight: "black",  size: estilo.fonte.tamanho.huge)
 #let h2 = (..h1, weight: "regular", size: estilo.fonte.tamanho.larger)
 #let h3 = (..h1, weight: "light", size: estilo.fonte.tamanho.large)
 #let h4 = (..h2, size: estilo.fonte.tamanho.regular)
 #let hdisplay = (..base, font: estilo.fonte.sans, weight: "medium", size: estilo.fonte.tamanho.small, tracking: estilo.fonte.tamanho.small/6 )
 #let small = (..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.small, style: "italic")
 #let hficha = (..base, font: estilo.fonte.mono, weight: "regular", size: estilo.fonte.tamanho.tiny)




 #let t1 = (..base, font: estilo.fonte.sans, weight: "black",  size: estilo.fonte.tamanho.huge)
 #let t2 = (..t1, weight: "regular", size: estilo.fonte.tamanho.larger)
 #let t3 = (..t1, weight: "light", size: estilo.fonte.tamanho.large)
 #let t4 = (..t2, size: estilo.fonte.tamanho.regular)
 #let display = (..base, font: estilo.fonte.sans, weight: "medium", size: estilo.fonte.tamanho.small, tracking: estilo.fonte.tamanho.small/6 )





//  #let small = (..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.small, style: "italic")
//  #let hficha = (..base, font: estilo.fonte.mono, weight: "regular", size: estilo.fonte.tamanho.tiny)
#let pagina_branca = () => [
    #pagebreak()
    #align(center+bottom, text(..small, [Página intencionalmente deixada em branco.]))
    #pagebreak(to: "odd")
]

#let config = (
  metadados: metadados,
  estilo: estilo,
  estrutura: (),
)