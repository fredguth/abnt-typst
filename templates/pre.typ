#import "../_config.typ": metadados, estilo

//  Definições úteis =================================================
#let base = (lang: "pt", fill: luma(10), tracking: 0pt, stretch: 100%, style: "normal")
#let regular =(..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.regular)
#let small = (..base, font: estilo.fonte.serif, weight: "regular", size: estilo.fonte.tamanho.small, style: "italic")

#let sans =(..regular, font: estilo.fonte.sans)
#let mono =(..base, font: estilo.fonte.mono, weight: "regular", size: estilo.fonte.tamanho.tiny)

#let t1 = (..base, font: estilo.fonte.sans, weight: "black",  size: estilo.fonte.tamanho.huge)
#let t2 = (..t1, weight: "regular", size: estilo.fonte.tamanho.larger)
#let t3 = (..t1, weight: "light", size: estilo.fonte.tamanho.large)
#let t4 = (..t2, size: estilo.fonte.tamanho.regular)
#let display = (..base, font: estilo.fonte.sans, weight: "medium", size: estilo.fonte.tamanho.small, tracking: estilo.fonte.tamanho.small/6 )

#let pagina_branca = () => [
    #pagebreak()
    #align(center+bottom, text(..small, [Página intencionalmente deixada em branco.]))
    #pagebreak(to: "odd")
]
//  CAPA (obrigatório) ================================================

// ABNT NBR 14724:2011 §4.1.1 - Capa
// Elemento obrigatório. As informações são apresentadas na seguinte ordem:
//  a) nome da instituição (opcional);
//  b) nome do autor;
//  c) título: deve ser claro e preciso, identificando o seu conteúdo e possibilitando a indexação e recuperação da informação;
//  d) subtítulo: se houver, deve ser precedido de dois pontos, evidenciando a sua subordinação ao
// título;
//  e) número do volume: se houver mais de um, deve constar em cada capa a especifi cação do
// respectivo volume;
//  f) local (cidade) da instituição onde deve ser apresentado;
// NOTA No caso de cidades homônimas recomenda-se o acréscimo da sigla da unidade da federação.
//  g) ano de depósito (da entrega).

#v(.5cm)
#set text(..display)
#upper[#metadados.tipo_trabalho]
#v(4cm)
#let bloco_titulo = [
    #set text(..t3)
    #metadados.autor.nome
    #v(.5cm)
    #set text(..t1)
    #metadados.titulo
    #if (metadados.subtitulo != none){[:]}
    #set text(..t2)
    #v(-.1cm)
    #metadados.subtitulo
]
#bloco_titulo
#v(13.2cm)
#let bloco_rodape = [
    #set text(..t2, weight: "black")
    #grid(gutter:0pt, columns: (1fr, 1fr), align(left + bottom, [#metadados.publicacao.data  #text(..t2, [#metadados.publicacao.local])]), align(right+bottom, if (metadados.publicacao.logo_instituicao !=none){image(metadados.publicacao.logo_instituicao)}))
]
#place(bottom + center, bloco_rodape)


// Verso Capa ============+++===========================

#pagina_branca()

// Folha de Rosto (Obrigatório) ==============================

// ABNT NBR 14724:2011 §4.2.1.1 - Folha de Rosto
// Elemento obrigatório. Apresentada conforme 4.2.1.1.1 e 4.2.1.1.2.
// 4.2.1.1.1 Anverso
// Os elementos devem ser apresentados na seguinte ordem:
//  a) nome do autor;
//  b) título;
//  c) subtítulo, se houver;
//  d) número do volume, se houver mais de um, deve constar em cada folha de rosto a especifi cação
// do respectivo volume;
//  e) natureza: tipo do trabalho (tese, dissertação, trabalho de conclusão de curso e outros) e objetivo
// (aprovação em disciplina, grau pretendido e outros); nome da instituição a que é submetido; área
// de concentração;
//  f) nome do orientador e, se houver, do coorientador;
//  g) local (cidade) da instituição onde deve ser apresentado;
//  h) ano de depósito (da entrega).


#v(4.5cm)
#bloco_titulo
#v(3.5cm)
#set text(..display)
#pad(left:5.7cm, upper[#metadados.titulacao_objetivo])
#v(.5cm)
#set text(..t4)
#pad(left:5.7cm)[#metadados.publicacao.preambulo]
#v(4.5cm)
#set text(..t3, size: estilo.fonte.tamanho.regular)
#upper[#metadados.programa_pos]
#v(-.1cm)
#upper[#metadados.departamento]

#place(bottom + center, bloco_rodape)
#pagebreak()


// Verso Folha de Rosto =============================

// ABNT NBR 14724:2011 §4.2.1.1 - Folha de Rosto
//  4.2.1.1.2 Verso
// Deve conter os dados de catalogação-na-publicação, conforme o Código de Catalogação Anglo-Americano vigente.

#set text(..mono)

#let licenca = block(inset: 0pt, width: 12cm,
    [
        #metadados.titulo #sym.copyright #metadados.autor.nome licenciada sob os termos da Licença Creative Commons

        *Atribuição-NãoComercial-SemDerivações 4.0 Internacional*

        *CC BY-NC-ND 4.0 DEED*

    #v(.4cm)

    #grid(columns:(1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr), [],[],image("../arquivos/cc.svg", width: 1cm), image("../arquivos/Cc-by_new.svg", width:1cm),image("../arquivos/Cc-nc.svg", width: 1cm), image("../arquivos/Cc-nd.svg", width:1cm),[],[])
    ])

// !  Ficha não está funcionando para mais de um orientador e orientador/coorientador
#let desc_trabalho = if ("Mestrado" in metadados.tipo_trabalho or "Mestrado" in metadados.titulacao_objetivo) [Dissertação (Mestrado - #metadados.titulacao_objetivo)] else if ("Tese" in metadados.tipo_trabalho or "Tese" in metadados.titulacao_objetivo) [Tese (Doutorado - #metadados.titulacao_objetivo)] else [#metadados.titulacao_objetivo]
#let ficha = rect(width: 12cm, height: 7.5cm, inset: 0.5cm, [
    #align(top + left, [
        #grid(columns:(2cm, 1fr), [#linebreak() #metadados.codigo_cutter]
            ,[
                #set par(first-line-indent: 2em)
                #metadados.autor.sobrenome_nome

                #metadados.titulo #if (metadados.subtitulo != none){[: #metadados.subtitulo]} / #metadados.autor.nome ; orient. #metadados.supervisao.orientadores.at(0).nome -- #metadados.publicacao.local, #metadados.publicacao.data.

                #let total_pages = locate(loc => counter(page).final(loc).at(0))
                #total_pages p.

                #desc_trabalho -- #metadados.publicacao.instituicao, #metadados.publicacao.data.

                #metadados.publicacao.palavras-chave
                #v(2cm)
                #align(right+bottom, [#metadados.codigo_cdu])
            ])
        ])
    ])
// Licença de Uso  (opcional) -------------------------------
#align(center + bottom, [
    #licenca
    #v(2cm)

// Ficha Catalográfica (obrigatório) -----------------------------
    // Em geral, a biblioteca da universidade provê uma ficha catalográfica em pdf que deve ser
    // inserida no documento.  O template aqui atende a maioria das exigências.
    #ficha
])
#pagebreak(to: "odd")

// Folha de Aprovação (obrigatório) =============================

// ABNT NBR 14724:2011 §4.2.1.3 - Folha de aprovação
// Elemento obrigatório. Deve ser inserida após a folha de rosto, constituída pelo nome do autor do
// trabalho, título do trabalho e subtítulo (se houver), natureza (tipo do trabalho, objetivo, nome da
// instituição a que é submetido, área de concentração) data de aprovação, nome, titulação e assinatura
// dos componentes da banca examinadora e instituições a que pertencem. A data de aprovação e
// as assinaturas dos membros componentes da banca examinadora devem ser colocadas após a
// aprovação do trabalho.

// Departamentos costumam prover seu próprio modelo de folha de aprovação. Cheque se precisa mudar
// o template ou se é melhor inserir um arquivo pdf.


#set text(..t2, weight:"black")
Folha de Aprovação

#pagina_branca()

// Dedicatória (opcional) =============================

// ABNT NBR 14724:2011 §4.2.1.4 - Dedicatória
// Elemento opcional. Deve ser inserida após a folha de aprovação.

#set text(font: estilo.fonte.serif, weight: "regular", style: "oblique", size: estilo.fonte.tamanho.regular)
#align(right+bottom, pad(left: 7cm, [
    Dedico este trabalho aos meus pais, Juju e Ismael; aos meus irmãos, Ismael, Márcia e Marta; aos meus filhos, Júlia, Adriano e Felipe; ao meu marido, José Romero; e à minha neta Luísa.
]))
#pagina_branca()

// Agradecimentos (opcional) =============================

// ABNT NBR 14724:2011 §4.2.1.5 - Agradecimentos
// Elemento opcional. Devem ser inseridos após a dedicatória.
#set par(
    leading: estilo.espacamento.entrelinhas * estilo.fonte.tamanho.regular,
    justify: true,
    first-line-indent: 0em,)
//  set par(
//     leading: 1em,
//     justify: true,
//     first-line-indent: 2em,)

#show par: set block(spacing: estilo.espacamento.entreparagrafos * estilo.fonte.tamanho.regular)

#set text(..t2, weight:"black")
Agradecimentos
#v(1.5cm)
#set text(..regular)

Agradeço à Universidade de Brasília, onde tive a honra de fazer meu primeiro curso de graduação e desde então tornou-se uma referência de grande importância na minha vida. E à Faculdade de Comunicação -- professores, direção, coordenação e servidores da pós-graduação --, por me receber e oferecer todas as condições para concluir o mestrado com tranquilidade e segurança.

Agradeço ao meu orientador, Professor Doutor Sérgio Araújo de Sá, pela disposição em me conduzir ao longo de dois anos de estudo e pesquisa, sempre disponível para o diálogo, para a discussão, para a indicação de autores e textos que tornaram possível a compreensão do meu objeto de estudo.

Agradeço a esta banca, que colaborou de forma decisiva para a conclusão deste trabalho, com críticas e sugestões inestimáveis.

Agradeço aos meus colegas, que dividiram comigo todos os momentos e sentimentos que um curso de mestrado proporciona. E homenageio, em especial, Maria Vanessa Veiga Esteves, de quem não pude me despedir, mas que deixou saudade, respeito e a certeza de que a vida, às vezes, nos traz desafios só vencidos com muita coragem.

Agradeço aos meus amigos, cuja companhia eu sacrifiquei ao longo desses dois anos, mas que, mesmo assim, não desistiram de mim.

E agradeço, de todo o meu coração, aos meus familiares, que me incentivaram sempre, colaboraram emocional e materialmente para que eu pudesse fazer o mestrado e se interessaram sinceramente pela minha trajetória acadêmica.

Ao meu marido, agradeço de maneira especial, pela paciência infinita e pelo apoio, sem o qual eu não poderia ter realizado o objetivo de dar sequência à vida acadêmica.

A todos e a cada um de vocês, meu muito obrigada!

// ![][2]

> *Na sociedade dos meios de comunicação de massa, o pensamento vê-se atrelado à imagem. Quantas vezes não relacionamos o que nossos olhos veem com imagens já vistas?*

Sérgio de Sá

#pagina_branca()

// Epígrafe (opcional) ==================================
// ABNT NBR 14724:2011 §4.2.1.6 - Epígrafe
// Elemento opcional. Elaborada conforme a ABNT NBR 10520. Deve ser inserida após os agradecimentos.
// Podem também constar epígrafes nas folhas ou páginas de abertura das seções primárias.
#set text(..t2, weight:"black")
Epígrafe
#pagina_branca()
#v(1.5cm)

// Resumo (obrigtório)===============================

// ABNT NBR 14724:2011 §4.2.1.7 - Resumo em língua vernácula
// Elemento obrigatório. Elaborado conforme a ABNT NBR 6028.
#set text(..t2, weight:"black")
Resumo
#set text(..regular)
#v(1.5cm)
A fotografia de Aylan Kurdi, menino sírio de 3 anos de idade morto numa praia da Turquia em 2 de setembro de 2015, chocou o mundo e tornou-se símbolo da atual crise migratória que tem gerado milhões de refugiados. Essa fotografia inspirou um movimento artístico nas redes sociais digitais que reproduziu, em forma de ilustrações, a imagem de Aylan morto na praia e transformou o tema "refugiados" em um dos assuntos mais discutidos na internet em 2015. Trouxe também mais uma vez a discussão sobre o poder transformador da imagem, sobretudo da fotografia icônica. Propõe-se discutir o suposto estatuto transformador da imagem e identificar os elementos presentes na fotografia de Aylan Kurdi responsáveis por inquietar o mundo em favor e contra os refugiados, bem como as características de uma sociedade em que as tecnologias digitais criam condições para que os indivíduos atuem ativamente na propagação de conteúdos, alterando irreversivelmente a forma como nos comunicamos. Por meio de leitura de imagem, do estudo do imaginário e da sociedade em rede, e com uso de metodologia qualitativa, procedeu-se à análise das reproduções artísticas da fotografia de Aylan, sustentada em teóricos dos campos estudados. A pesquisa recuperou a trajetória da imagem e do imaginário no Ocidente e localizou no tempo e no espaço o drama dos refugiados, com destaque para a guerra civil na Síria, bem como associou tais aspectos à emergência da sociedade em rede e das tecnologias digitais que põe em xeque as formas tradicionais de exercício do poder, uma vez que esse exercício depende do controle da comunicação. Constatou que a imagem em estudo inquietou indivíduos e grupos, gerou iniciativas empáticas transitórias em defesa dos refugiados, mas divide a opinião de estudiosos do tema sobre seu poder transformador. Concluiu que a sociedade digital nos obriga a rever o conhecimento construído ao longo dos últimos séculos, considerando que vivemos em contexto radicalmente diferente, o que exige mais que a histórica iconoclastia e a desconfiança quanto ao poder da imagem.

*Palavras-chave*: Imagem e imaginário; Fotografia icônica; Aylan Kurdi; Redes sociais; comunicação mediada.
// Abstract ==================================
#pagebreak()
#set text(..t2, weight:"black")
Abstract
#v(1.5cm)
#set text(..regular)
The photo of Aylan Kurdi, a 3-year-old Syrian boy killed on a beach in Turkey on September 2, 2015, shocked the world and became a symbol of the current migratory crisis that has generated millions of refugees. This photograph inspired an artistic movement in digital social media that reproduced, in the form of illustrations, the image of Aylan dead on the beach and turned the theme \"refugees\" into one of the most discussed subjects on the internet in 2015. It also brought once more discussion about the transforming power of the image, especially iconic photography. This study proposes to discuss the supposed transforming status of the image and identify the elements in the photograph of Aylan Kurdi responsible for disturbing the world in favor of and against refugees, as well as the characteristics of a society in which digital technologies create the conditions for individuals to actively engage in the propagation of content, irreversibly altering the way in which we communicate. Through reading of image, the study of the imaginary and of network society, and using a qualitative methodology, we proceeded to the analysis of reproductions of Aylan\'s photography, supported by the work of academics of the fields mentioned above. The research recovered the trajectory of the image and the imaginary in the West and localized in time and space the drama of refugees, with emphasis on civil war in Syria. It also associated these aspects to the emergence of the network society and digital technologies that challenge traditional forms of power, since this exercise depends on the control of communication. We found that the studied image disturbed individuals and groups, generated transitional empathetic initiatives in defense of refugees, but divides the view of scholars of the theme about its transforming power. It concluded that the digital society compels us to review the knowledge built over the last centuries, considering that we live in a radically different context, which requires more than the historical iconoclasm and distrust of the power of the image.

*Keywords*: Image and imaginary; Iconic photography; Aylan Kurdi; Social media; mediated communication.

#pagebreak()
// Listas ====================================

// Sumário (obrigatório) ======================

// ABNT NBR 14724:2011 §4.2.1.13 - Sumário
// Elemento obrigatório. Elaborado conforme a ABNT NBR 6027.

// 5 Regras gerais de apresentação
// O sumário deve ser apresentado conforme 5.1 a 5.6.
// 5.1 A palavra sumário deve ser centralizada e com a mesma
// tipologia da fonte utilizada para as seções primárias.
#set text(..t2, weight:"black")

#align(center, [Sumário])

#v(1.5cm)


// 5.2 A subordinação dos itens do sumário deve ser destacada pela apresentação tipográfica utilizada no texto.
// 5.3 Os elementos pré-textuais não devem constar no sumário.
// 5.4 A ordem dos elementos do sumário deve ser conforme 5.4.1 a 5.4.4.
// 5.4.1 Os indicativos das seções que compõem o sumário, se houver, devem ser alinhados à esquerda, conforme a NBR 6024.
// 5.4.2 Os títulos, e os subtítulos, se houver, sucedem os indicativos das seções. Recomenda-se que sejam alinhados pela margem do título do indicativo mais extenso.
// 5.4.3 O(s) nome(s) do(s) autor(es), se houver, sucede(m) os títulos e os subtítulos.
// 5.4.4 A paginação deve ser apresentada sob uma das formas abaixo:
// a) número da primeira página (exemplo: 27);
// b) números das páginas inicial e final, separadas por hífen (exemplo: 91-143);
// c) números das páginas em que se distribui o texto (exemplo: 27, 35, 64 ou 27-30, 35-38, 64-70).
// 5.5 Se houver um único sumário, podem ser colocadas traduções dos títulos após os títulos originais, separados por barra oblíqua ou travessão.
// 5.6 Se o documento for apresentado em mais de um idioma, para o mesmo texto, recomenda-se um sumário separado para cada idioma, inclusive a palavra sumário, em páginas distintas.
#set text(..t4, font: estilo.fonte.serif, size: 14pt)
#outline(depth: 2, title: none)
// #outline(depth: 2)
// #pagina_branca()





// # Abstract {.unnumbered}


//  
