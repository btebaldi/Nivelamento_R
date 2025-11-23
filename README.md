# Nivelamento em R

> Repositório para o curso de nivelamento de R (fundamentos e boas práticas).

## 1. Objetivo

Estabelecer uma base consistente em:
- Instalação e configuração de ambiente R.
- Manipulação de dados (importação, limpeza, transformação).
- Exploração, visualização e comunicação de resultados.
- Organização de projetos reprodutíveis.
- Boas práticas (estilo, versionamento, documentação, testes).

## 2. Público-Alvo

Iniciantes em R vindos de outras linguagens ou pessoas sem experiência prévia em programação que precisam acelerar curva de aprendizado para uso em análise de dados, ciência de dados ou estatística aplicada.

### Bibliografia recomendada
- Wickham, H., & Grolemund, G. (2017). *R for Data Science: Import, Tidy, Transform, Visualize, and Model Data*. O'Reilly Media.
- Wickham, H. (2019). *Advanced R* (2nd ed.). CRC Press.
- Wickham, H. (2016). *ggplot2: Elegant Graphics for Data Analysis* (2nd ed.). Springer.

## 3. Principais Resultados Esperados

Ao concluir:
- Entender a estrutura de um script e de um projeto R.
- Ler e escrever dados em formatos comuns (CSV, Excel).
- Usar tidyverse para tarefas frequentes.
- Criar visualizações claras com ggplot2.
- Escrever funções reutilizáveis e testes simples.
- Documentar e versionar código de modo consistente.
- Montar pipelines simples (sequência lógica de transformação).

## 4. Estrutura do Repositório (Proposta)

```
Nivelamento_R/
├─ README.md
├─ LICENSE
├─ /databases/         # banco de dados utilizados
├─ /dev/               # diretorio de arquivos em desenvolvimento
├─ /doc/               # Documentaçao e Guias rápidos de referência dos pacotes
├─ /Graficos/          # Pasta de saida de gráficos
├─ /Images/            # Imagens utilizadas nas apresentações
├─ /Integral_Numerica/ # Solucao Shiny para Integral Numerica
├─ /scripts/           # Scripts utilizados
├─ /Solucoes/          # Solucoes de exercícios
```

## 5. Pré-Requisitos

- R (≥ 4.x)
- RStudio ou editor alternativo
- Git instalado (para controle de versão)
- (Opcional) VS Code + extensão R

## 6. Estilo e Convenções

- snake_case para objetos/funções.
- Comentários curtos e objetivos.
- Funções: primeira linha descreve propósito.
- Evitar números mágicos (criar constantes).
- Manter scripts abaixo de ~300 linhas (modularizar).


## 7. Citatção
Para citar este repositório, arquivos ou materiais associados, utilize o formato apresentado abaixo, adaptando conforme necessário para o contexto do seu trabalho.

Barbosa, B. T. (2025). Repositório GitHub: Curso de Nivelamento em R (fundamentos e boas práticas). Disponível em https://github.com/btebaldi/Nivelamento_R.


@misc{barbosa2025Nivelamento_r,
author = {Barbosa, Bruno Tebaldi},
title = {Repositório GitHub: {Curso de Nivelamento em R (fundamentos e boas práticas)},
year = {2025},
howpublished = {\url{https://github.com/btebaldi/Nivelamento_R}}
}