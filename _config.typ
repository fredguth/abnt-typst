#let metadados = (
    titulo: "Naufrágio e ressureição da imagem",
    subtitulo: "A fotografia de Aylan Kurdi inquieta o imaginário
contemporâneo",
    título-curto: none,
    codigo_cutter: "RR696n", //ex. S659n
    codigo_cdu: none,//ex. 911.375:028
    tipo_trabalho: "Dissertação de Mestrado", //ex. "Tese de Doutorado", "Dissertação de Mestrado", "Trabalho de Conclusão de Curso"
    titulacao_objetivo: "Mestrado em Comunicação",
    programa_pos: "Programa de Pós Graduação em Comunicação", //ex. Ciência da Computação
    departamento: "Faculdade de Comunicação",
    autor: (nome: "Anna Cristina de Araújo Rodrigues", sobrenome_nome: "Rodrigues, Anna Cristina de Araújo"),
    publicacao: (
      preambulo:"Dissertação apresentada como requisito para obtenção do título de mestre. Linha de Pesquisa: Imagem, Som e Escrita." ,
      local: "Brasília",
      instituicao: "UnB",
      logo_instituicao: "../arquivos/logo_unb.svg",
      data: 2018,
      palavras-chave: "\1. Fotografia .  2. Aylan Kurdi . 3. Imagem e imaginário . 4. Redes sociais . 5. Sociedade em rede. I. Araújo de Sá, Sérgio, orient. II. Título" //ficha catalográfica
    ),
    //instituicoes de pessoas relacionadas ao trabalho academico
    supervisao: (
      orientadores:(
        ( chamar: "Orientador:"
        ,   nome: "Sérgio Araújo de Sá"
        , sobrenome_nome: "Sá, Sérgio Araújo de"
        , titulo: "Prof. Dr."
        ),
      ),
      coorientadores: none,
      coordenador: none,
      banca: none
    )

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
        // serif:"STIX Two Text",
        serif:"Libre Caslon Text",
        // sans:"TeX Gyre Heros",
        // sans:"Helvetica",
        sans:"Lato",
        mono:"SF Mono",
        // mono:"IBM 3270",
        tamanho:(normal: (size:1em)
            , large: 18pt
            , larger: 20pt
            , huge: 25pt
            , small: 10pt
            , tiny: 7pt
            , corpo: 14pt
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
        entrelinhas: 1.2,
        entreparagrafos: 1.5,
        titulos: 3,
        ),
    numeracao: (titulos: "1.1.1.1.1", enumeracoes: "1.1.1.1.1.",),
    tema: red.darken(50%), // cor do tema (afeta links e outros pequenos detalhes)

  )




#let config = (
  metadados: metadados,
  estilo: estilo,
  estrutura: (),
)