# Exercícios do Minicurso UPDATE 2024

## Dia 1

### Exercício 0

1. Crie o diretório `/tmp/update`, para realizar os exercícios desse curso.

### Exercício 1

Use os comandos `head` e `tail` para redirecionar **apenas** a linha `I'll send an S.O.S to the world`, desse trecho:

```
Walked out this morning, I don't believe what I saw
Hundred billion bottles washed up on the shore
Seems I'm not alone at being alone
Hundred billion castaways, looking for a home
I'll send an S.O.S to the world
I'll send an S.O.S to the world
I hope that someone gets my
I hope that someone gets my
I hope that someone gets my message in a bottle, yeah
```

### Exercício 2

Investigue o `ls` com `man ls`, e crie uma variação do comando (alias) `ls` com suas opções que lista os arquivos
da seguinte maneira:

- Lista dotfiles
- Os tamanhos são listados de forma humanamente legível.
- Os arquivos são ordenados por ordem de modificação.
- A saída é colorida.

Um exemplo de saída seria:

```terminal
 -rw-r--r--   1 user group 1.1M Jan 14 09:53 baz
 drwxr-xr-x   5 user group  160 Jan 14 09:53 .
 -rw-r--r--   1 user group  514 Jan 14 06:42 bar
 -rw-r--r--   1 user group 106M Jan 13 12:12 foo
 drwx------+ 47 user group 1.5K Jan 12 18:08 ..
```

### Exercício 3

1. No diretório `/tmp/update`, crie um arquivo chamado `sys_info.sh`.
2. Adicione o seguinte conteúdo ao arquivo `sys_info.sh`, uma linha de cada vez:

```bash
#!/bin/bash
echo "Informações do Sistema:"
uname -a
df -h
free -m
```

3. Use o `chmod` para tornar o arquivo `sys_info.sh` executável.
4. Execute o comando novamente digitando `./sys_info.sh` e pressione Enter.
5. Pesquise sobre os comandos `uname`, `df` e `free` utilizando o programa `man`.
6. Execute o script novamente para verificar se tudo está funcionando conforme esperado.
7. Crie um link simbólico do arquivo `sys_info.sh` para algum diretório do `PATH` e tente executá-lo de outro lugar apenas com `sys_info.sh`.

### Exercício 4

Em programas em C que envolvem muitos arquivos, é comum querermos configurar nosso projeto de modo que facilite o gerenciamento de multiplos arquivos. Entretanto, como você gosta de iniciar muitos projetos, você não quer precisar criar, repetidas vezes, arquivos que sempre vão estar no seu projeto. Por isso, vamos criar um programa que automatize isso.

Imagine que você sempre organiza seu projeto baseado nessa estrutura.

```
.
├── build
├── test
├── lib
│   └── text_color.h
├── src
│   ├── include
│   │   └── header.h
│   └── main.c
├── CMakeLists.txt
├── LICENSE
└── README.md
```

1. No diretório `/tmp/update`, crie o arquivo `c_project_cfg.sh`.
2. Dentro desse arquivo, adicione a seguinte linha.

   ```bash
   #!/bin/bash
   ```

3. Após essa linha, anexe os comandos necessários para criar a estrutura do projeto acima.
   Seu arquivo no final deve ficar assim:

   ```bash
   #!/bin/bash
   # Comando 1
   # Comando 2
   # Comando 3
   ```
