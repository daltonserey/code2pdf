# Como gerar PDF de código fonte com Pandoc?

> Veja abaixo uma alternativa em que o pandoc usa HTML como
> formato intermediário ao invés de $\LaTeX$, como a primeira
> ideia abaixo.

Pra gerar PDF, o pandoc usa as ferramentas de $\LaTeX$,
por isso tem que ter o `texlive-latex-base` e, provavelmente, o
`texlive-fonts-recommended` instalados (esses pacotes são
instaláveis facilmente via gerenciadores de pacotes na maioria
dos Linux e também com o `brew` no MacOs).

Além de $\LaTeX$, você precisa de um filtro pandoc para
adicionar o `include` que não é nativo do Markdown do pandoc. Pra
isso, eu usaria um filtro bem, bem simples mesmo escrito em Lua que
é parte de um pacote maior de filtros
(https://github.com/pandoc/lua-filters).  Preferiria esse filtro,
porque é um único arquivo com menos de 100 linhas que pode ficar
junto com o `Makefile` (incluí ele aí, por sinal).

> Tem filtros mais sofisticados que você poderia usar, caso você
> perceba alguma necessidade mais específica. Mas aí é questão de
> pesquisar na web (ou fazer um filtro você mesmo).

Em resumo. Você precisa instalar:

- o `pandoc` propriamente dito;
- o `texlive-latex-base`;
- o `texlive-fonts-recommended`; e
- usar o script `include-code-files.lua` (que tá neste repo)

O `Makefile` que incluí roda o pandoc pra gerar um PDF deste
arquivo, incluindo dois arquivos do código fonte do OpenJDK.
Abaixo você vê como é a sintaxe pra incluir os arquivos (vê
que o `include` suporta três parâmetros auto-explicativos).

## Alternativa pra Gerar o PDF (sem LaTeX)

Uma alternativa pra gerar o PDF que não o deixa com a _cara_ de
$\LaTeX$, é gerar um HTML com o pandoc e dele gerar o PDF a
partir de outras ferramentas. Pode ser do próprio browser ou de
alguma outra ferramenta de linha de comando como o
[wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)), por
exemplo.

Adicionei uma receita no `Makefile` para mostrar como fazer
isso como `wkhtmltopdf` que gera o `source2.pdf` dessa forma.

> Só depois de adicionar a receita acima, descobri que a
> ferramenta padrão que o pandoc usa para gerar html é exatamente
> o `wkhtmltopdf`. Logo, se ela estiver instalada no sistema, e
> se usar a opção `--to html` combinada com `--output <algo>.pdf`
> o pandoc irá fazer a conversão para html e gerar o arquivo de
> saída em pdf com o `wkhtmltopdf`. Claramente, esta é uma forma
> mais simples de produzir o PDF diretamente através do pandoc.
