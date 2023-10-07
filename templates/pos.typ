#import "../_config.typ": metadados, estilo, h1, h2, h3, h4, base, hdisplay, hficha, pagina_branca

// {% comment %} - Elementos pós-textuais
//   -- Referências (obrigatório)
//   -- Glossário (opcional)
//   -- Apêndice (opcional)
//   -- Anexo (opcional)
//   -- Índice (opcional)
//  {% endcomment %}

#pagebreak(to: "odd")

// Referências (obrigatório)=============================
// ABNT NBR 14724:2011 §4.2.3.1 - Referências
// Elemento obrigatório. Elaboradas conforme a ABNT NBR 6023
#bibliography(title:"Referências", "../referencias.bib")
#pagina_branca()

// Glossário (opcional)==================================

// Apêndices (opcional)==================================


// Índice Remissivo (opcional)===========================
// ABNT NBR 14724:2011 §4.2.3.5 - Índice Remissivo
// 4.2.3.5 Índice
// Elemento opcional. Elaborado conforme a ABNT NBR 6034.

// Colofão (opcional)==================================
//  ABNT nem menciona Colofão
