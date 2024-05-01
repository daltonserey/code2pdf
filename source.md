# Código fonte em PDF

## Collections

Aqui como incluir apenas um trecho do código fonte,
especificando linha de início e de fim.

```{include="java_source/Collections.java" startLine=264
endLine=283 .java}
```

Desta vez, inclui o mesmo trecho, e adiciona a numeração de
linhas. 

```{include="java_source/Collections.java" startLine=264 endLine=283
.numberLines .java}
```

## LinkedList

Por fim, colocar o arquivo completo é o mais simples. Contudo,
é importante olhar como resolver o caso de linhas muito
longas.

```{include="java_source/Collections.java" .java .numberLines}
```
