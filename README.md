# tufte-typst

A Tufte inspired template for Typst

## Usage

there is an example in the `./example` directory. Run from root directory with:

```sh

typst watch example/main.typ --root .
```

## Example

![example/main.pdf](./example/main.pdf)

= Estrutura

Parte externa

- Capa (obrigatório)
- Lombada (opcional)
  Parte interna
- Elementos pré-textuais
  -- Folha de rosto (obrigatório)
  -- Errata (opcional)
  -- Folha de aprovação (obrigatório)
  -- Dedicatória (opcional)
  -- Agradecimentos (opcional)
  -- Epígrafe (opcional)
  -- Resumo na língua vernácula (obrigatório)
  -- Resumo em língua estrangeira (obrigatório)
  -- Lista de ilustrações (opcional)
  -- Lista de tabelas (opcional)
  -- Lista de abreviaturas e siglas (opcional)
  -- Lista de símbolos (opcional)
  -- Sumário (obrigatório)
- Elementos textuais [^1]
  -- Introdução
  -- Desenvolvimento
  -- Conclusão
- Elementos pós-textuais
  -- Referências (obrigatório)
  -- Glossário (opcional)
  -- Apêndice (opcional)
  -- Anexo (opcional)
  -- Índice (opcional)

[^1]: A nomenclatura dos títulos dos elementos textuais fica a critério do autor.

- [NBR 10520:2002](http://www2.uesb.br/biblioteca/wp-content/uploads/2016/05/NBR-10520-CITA%C3%87%C3%95ES.pdf)
- [NBR 14724:2011](http://site.ufvjm.edu.br/revistamultidisciplinar/files/2011/09/NBR_14724_atualizada_abr_2011.pdf)
- [NBR 6027:2003](https://arquivos.info.ufrn.br/arquivos/201217724681f092705070edeef8a06d/NBR_6027_Sumario_apresentacao.pdf)
