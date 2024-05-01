# PDF de código fonte com Pandoc (opt2)

Pra gerar PDF, o pandoc usa as ferramentas de $\text{\LaTeX}$,
por isso tem que ter o `texlive-latex-base` e, provavelmente, o
`texlive-fontes-recommended` instalados (esses pacotes são
instaláveis facilmente via gerenciadores de pacotes na maioria
dos Linux e também com o `brew` no MacOs).

Além de $\text{\LaTeX}$, você precisa de um filtro pandoc para
adicionar o `include` que não é nativo do Markdown do pandoc. Pra
isso, eu uso um filtro bem, bem simples mesmo escrito em Lua que
é parte de um pacote maior de filtros
(https://github.com/pandoc/lua-filters).  Prefiro esse filtro,
porque é um único arquivo com menos de 100 linhas que pode ficar
junto com o `Makefile` (incluí ele aí, por sinal).

> Tem filtros mais sofisticados que você poderia usar, caso você
> perceba alguma necessidade mais específica. Mas aí é questão de
> pesquisar na web (ou fazer um filtro você mesmo).

Em resumo. Você precisa instalar:

- o `pandoc` propriamente dito;
- o `texlive-latex-base`;
- o `texlive-fonts-recommended`; e
- usar o script `include-code-files.lua`

O `Makefile` que incluí roda o pandoc pra gerar um PDF deste
arquivo, incluindo dois arquivos do código fonte do OpenJDK.
Abaixo você vê como é a sintaxe pra incluir os arquivos (vê
que o `include` suporta três parâmetros auto-explicativos).


## Collections

Aqui como incluir apenas um trecho do código fonte,
especificando linha de início e de fim.

```{include="Collections.java" startLine=264 endLine=283}
```

Desta vez, inclui o mesmo trecho, e adiciona a numeração de
linhas. 

```{include="Collections.java" startLine=264 endLine=283
.numberLines}
```

## LinkedList

Por fim, colocar o arquivo completo é o mais simples. Contudo,
é importante olhar como resolver o caso de linhas muito
longas.

```{include="Collections.java"}
```
