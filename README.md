# Nivelamento_R

> Repositório para nivelamento (fundamentos e boas práticas) em R antes de iniciar projetos analíticos mais avançados.

## 1. Objetivo

Estabelecer uma base consistente em:
- Instalação e configuração de ambiente R.
- Manipulação de dados (importação, limpeza, transformação).
- Exploração, visualização e comunicação de resultados.
- Organização de projetos reprodutíveis.
- Boas práticas (estilo, versionamento, documentação, testes).

## 2. Público-Alvo

Iniciantes em R vindos de outras linguagens ou pessoas sem experiência prévia em programação que precisam acelerar curva de aprendizado para uso em análise de dados, ciência de dados ou estatística aplicada.

## 3. Principais Resultados Esperados

Ao concluir:
- Entender a estrutura de um script e de um projeto R.
- Ler e escrever dados em formatos comuns (CSV, Excel, JSON).
- Usar tidyverse para tarefas frequentes.
- Criar visualizações claras com ggplot2.
- Escrever funções reutilizáveis e testes simples.
- Documentar e versionar código de modo consistente.
- Montar pipelines simples (sequência lógica de transformação).

## 4. Estrutura do Repositório (Proposta)

```
Nivelamento_R/
├─ README.md
├─ /00_setup/          # Instalação, configuração, RStudio, renv
├─ /01_basico/         # Sintaxe, objetos, tipos, vetores, listas, fatores
├─ /02_importacao/     # readr, readxl, jsonlite, APIs simples
├─ /03_limpeza/        # tidyr, dplyr (select, filter, mutate, join)
├─ /04_exploracao/     # Estatísticas descritivas, sumarização
├─ /05_visualizacao/   # ggplot2, temas, exportação
├─ /06_funcoes/        # Funções, escopo, purrr
├─ /07_reprodutibilidade/ # Projetos, scripts, RMarkdown, Quarto
├─ /08_testes/         # Introdução a testthat
├─ /09_boas_praticas/  # Estilo (lintr), nomes, organização
├─ /data/              # Dados de exemplo (pequenos, abertos)
├─ /scripts/           # Exemplos únicos, prontos para rodar
├─ /exercicios/        # Listas de prática + gabaritos
└─ /assets/            # Imagens, diagrams, referências
```

## 5. Pré-Requisitos

- R (≥ 4.x)
- RStudio ou editor alternativo
- Git instalado
- Navegador moderno
- (Opcional) VS Code + extensão R

## 6. Configuração Rápida

1. Clonar ou baixar o repositório.
2. Abrir projeto (.Rproj) se existir.
3. Instalar pacotes principais:
    ```r
    packages <- c("tidyverse","readxl","jsonlite","testthat","ggplot2","janitor","lubridate","here","renv")
    install.packages(setdiff(packages, installed.packages()[,1]))
    ```
4. (Opcional) Inicializar renv:
    ```r
    renv::init()
    ```

## 7. Uso

- Seguir ordem numérica das pastas.
- Executar scripts de exemplo.
- Resolver exercícios antes de ver soluções.
- Registrar dúvidas em issues.

## 8. Estilo e Convenções

- snake_case para objetos/funções.
- Comentários curtos e objetivos.
- Funções: primeira linha descreve propósito.
- Evitar números mágicos (criar constantes).
- Manter scripts abaixo de ~300 linhas (modularizar).

## 9. Dados

A pasta /data conterá somente:
- Conjuntos pequenos (≤ alguns MB).
- Licenças abertas (CC0, etc.).
- Arquivos brutos + processados se necessário.

## 10. Testes

Exemplo básico:
```r
library(testthat)

test_that("soma funciona", {
  expect_equal(1 + 1, 2)
})
```

Executar todos:
```r
testthat::test_dir("tests")
```

## 11. Documentação

- README para visão geral.
- Comentários inline.
- RMarkdown / Quarto para relatórios.
- Referências externas em /assets.

## 12. Boas Práticas Reprodutibilidade

- Fixar versão de pacotes (renv.lock).
- Usar here::here() para caminhos.
- Evitar setwd() em scripts compartilhados.
- Exportar resultados (figuras/tabelas) de modo programático.

## 13. Sugestão de Linha de Aprendizado

1. Sintaxe e objetos.
2. Importar e inspecionar dados.
3. Limpar e transformar.
4. Explorar e sumarizar.
5. Visualizar.
6. Escrever funções.
7. Reprodutibilidade.
8. Testes.
9. Otimização simples.

## 14. Contribuição

Passos:
1. Abrir issue descrevendo proposta.
2. Criar branch feature/nome_curto.
3. Adicionar mudanças com descrição objetiva.
4. Pull request com checklist preenchida.

Checklist rápido:
- [ ] Scripts rodam sem erro
- [ ] Sem credenciais ou dados sensíveis
- [ ] Comentários claros
- [ ] Testes (se aplicável)

## 15. Roadmap Inicial

- Versão 0.1: Estrutura básica + primeiros módulos.
- Versão 0.2: Exercícios + testes simples.
- Versão 0.3: Integração Quarto + relatório exemplo.
- Versão 1.0: Conteúdo completo validado.

## 16. FAQ (Exemplos)

Q: Preciso de matemática avançada?
A: Apenas conceitos básicos.

Q: Posso usar outro editor?
A: Sim, desde que R esteja configurado.

Q: Há foco em machine learning?
A: Não, somente fundamentos prévios.

## 17. Licença

Adicionar licença aberta (ex: MIT ou CC BY). Indicar claramente no repositório.

## 18. Próximos Passos para Usuário Novo

1. Ler README.
2. Rodar script de verificação de ambiente (a criar).
3. Concluir módulo 01.
4. Registrar dúvidas.
5. Avançar sequencialmente.

## 19. Contato / Suporte

Usar issues para:
- Erros
- Sugestões
- Correções de conteúdo

## 20. Nota

Este README é modelo inicial. Ajustar conforme evolução real do repositório.

---

Resumo rápido:
Fundamentos essenciais de R organizados em módulos sequenciais com foco em reprodutibilidade, clareza e prática orientada.

Boa exploração.