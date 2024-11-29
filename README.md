# Geração de Formulários

## Equipe
- Bruno Roberto
- Lucas Andreoni
- Nathália Bacalhau
- Silas Nunes

## Motivação
A criação de formulários personalizados é uma tarefa comum, mas frequentemente tediosa, no ambiente de trabalho e acadêmico. Este projeto tem como objetivo facilitar essa tarefa por meio de uma linguagem de domínio específico (DSL) que permite a definição e geração de formulários de maneira prática e eficiente. A DSL fornece uma interface simplificada para criar títulos, descrições, itens de entrada de texto, múltipla escolha e cabeçalhos de seção, além de possibilitar a visualização e exportação do formulário em formato JSON.

## Descrição Informal da Linguagem
A linguagem foi projetada para permitir a criação de formulários de maneira declarativa, utilizando comandos claros e intuitivos. Cada comando corresponde a uma ação específica no formulário:

- **`TITLE`**: Define o título do formulário.
- **`DESCRIPTION`**: Adiciona uma descrição ao formulário.
- **`ITEM TEXT`**: Adiciona um item de entrada de texto ao formulário.
- **`ITEM MULTIPLE_CHOICE`**: Adiciona um item de múltipla escolha com opções específicas.
- **`ITEM SECTION_HEADER`**: Adiciona um cabeçalho de seção ao formulário.
- **`SHOW`**: Exibe o formulário gerado no console.
- **`EXPORT`**: Exporta o formulário gerado para um arquivo JSON.
  
### Exemplo de Código na DSL
```txt
TITLE 'Cadastro pessoal';
DESCRIPTION 'Formulário para cadastro de informações pessoais';
ITEM TEXT (title, isRequired) VALUES ('Insira seu nome', 'true');
ITEM MULTIPLE_CHOICE (title, isRequired, choices) VALUES ('Escolha uma opção', 'false', 'Opção 1', 'Opção 2', 'Opção 3');
ITEM SECTION_HEADER (title, text) VALUES ('Informações adicionais', 'Por favor, leia as instruções');
SHOW;
EXPORT;
```

## Guia de Execução

### Pré-requisitos
- Python 3.8 ou superior
- Biblioteca ANTLR4 para Python

#### Dependências
- Adicione a biblioteca ANTLR ao ambiente:
  ```bash
  wget https://www.antlr.org/download/antlr-4.13.2-complete.jar
  mv antlr-4.13.2-complete.jar antlr.jar
  ```
- Instale o runtime do ANTLR e outras bibliotecas necessárias via pip:
  ```bash
  pip install antlr4-python3-runtime
  ```

### Execução
1. Crie um arquivo de entrada com os comandos na linguagem DSL, por exemplo, `input.txt`.
2. Execute o programa principal passando o arquivo como entrada:
   ```bash
   python main.py < input.txt
   ```
3. O formulário gerado será exibido no console e exportado para `output.json`.

### Estrutura do JSON Exportado
O formulário gerado será exportado no seguinte formato:
```json
{
    "info": {
        "title": "Cadastro pessoal",
        "description": "Formulário para cadastro de informações pessoais"
    },
    "items": [
        {
            "type": "TEXT",
            "title": "Insira seu nome",
            "isRequired": "true",
            "index": 0
        },
        {
            "type": "MULTIPLE_CHOICE",
            "title": "Escolha uma opção",
            "isRequired": "false",
            "choices": ["Opção 1", "Opção 2", "Opção 3"],
            "index": 1
        }
    ]
}
```

## Ferramentas Utilizadas
- **ANTLR4**: Para análise léxica e sintática.
- **Python**: Para implementação do compilador/interpreter e execução das ações semânticas.

## Contato
Para dúvidas ou contribuições, entre em contato com qualquer membro da equipe.
