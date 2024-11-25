# Shell/Linux TL;DR

As vezes ler o `man` pode dar muito preguiça, então aqui vai um **_too long didn't read_** de tudo que a gente viu na aula

<!--toc:start-->

- [Comandos básicos](#comandos-básicos)
- [Comandos de manipulação de arquivos e diretórios](#comandos-de-manipulação-de-arquivos-e-diretórios)
- [Comandos de manipulação de texto](#comandos-de-manipulação-de-texto)
- [Comandos de busca](#comandos-de-busca)
- [Redirecionamento e pipes](#redirecionamento-e-pipes)
- [Variáveis de Ambiente](#variáveis-de-ambiente)
- [Instalação de programas](#instalação-de-programas)
- [Gerenciadores de pacote](#gerenciadores-de-pacote)
  - [Instalação de programas](#instalação-de-programas)
  - [Remoção de programas](#remoção-de-programas)
  - [Atualização de programas](#atualização-de-programas)
  <!--toc:end-->

# Comandos básicos

Suponha que `$` é o prompt do seu terminal sem permissões de
superusuário e `#` é o prompt do seu terminal com permissões de
superusuário.

- `date`: Imprime ou muda a data do sistema:

  ```
  $ date
  Mon Aug  5 03:38:19 PM -03 2024
  ```

- `cal`: Imprime o calendário:

      $ cal
           August 2024
      Su Mo Tu We Th Fr Sa
                   1  2  3
       4  5  6  7  8  9 10
      11 12 13 14 15 16 17
      18 19 20 21 22 23 24
      25 26 27 28 29 30 31

- `echo`: Exibe uma linha de texto:

      $ echo "Hello, World!"
      Hello, World!

- `man`: Exibe o manual de um comando:

      $ man date
      DATE(1)                     User Commands                    DATE(1)

      NAME
             date - print or set the system date and time

      SYNOPSIS
             date [OPTION]... [+FORMAT]
             date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

      DESCRIPTION
             Display date and time in the given FORMAT.  With -s, or with [MMDDhhmm[[CC]YY][.ss]], set the date and time.
      ...

# Comandos de manipulação de arquivos e diretórios

- `pwd`: Imprime o caminho absoluto do diretório de trabalho:

      $ pwd
      /home/user

- `ls`: Lista arquivos e diretórios:

      $ ls
      Documents  Pictures  Downloads  Videos

- `cd`: Muda o diretório de trabalho:

      $ cd /home
      $ ls
      user user2 user3

- `touch` e `rm`: Cria e remove arquivos, respectivamente:

      $ touch file
      $ ls
      Documents  Pictures  Downloads  Videos  file
      $ rm file
      $ ls
      Documents  Pictures  Downloads  Videos

- `mkdir` e `rmdir`: Cria e remove diretórios vazios, respectivamente:

      $ mkdir dir
      $ ls
      Documents  Pictures  Downloads  Videos  dir
      $ rmdir dir
      $ ls
      Documents  Pictures  Downloads  Videos

- `cp` e `mv`: Copia e move arquivos, respectivamente:

      $ ls
      Documents  Pictures  Downloads  Videos
      $ cp Downloads Downloads2
      $ ls
      Documents  Pictures  Downloads  Downloads2  Videos
      $ mv Downloads2 Downloads3
      $ ls

      Documents  Pictures  Downloads  Downloads3  Videos

- `ln`: Cria links entre arquivos:

      ln -s /caminho/para/arquivo /caminho/para/link

# Comandos de manipulação de texto

- `cat`: Concatena arquivos e imprime na saída padrão:

      $ cat poema
      Rosas são vermelhas
      Violetas são azuis
      Meu deus, deixa eu correr
      Está queimando meu cuscuiz

- `more` ou `less`: Paginadores de texto.

- `head`: Imprime as primeiras linhas de um arquivo:

      $ head -n 2 poema
      Rosas são vermelhas
      Violetas são azuis

- `tail`: Imprime as últimas linhas de um arquivo:

      $ tail -n 1 poema
      Está queimando meu cuscuiz

# Comandos de busca

- `grep`: Imprime linhas que contêm padrões:

      $ grep "vermelhas" poema
      Rosas são vermelhas

- `find`: Procura arquivos e diretórios:

      $ find Downloads -name "*.pdf"
      Downloads/Howard Anton, Chris Rorres - Elementary linear algebra with applications-Wiley (2005).pdf
      Downloads/George S. Boolos, John P. Burgess, Richard C. Jeffrey - Computability and logic-Cambridge University Press (2002).pdf
      Downloads/B. A. Davey, H. A. Priestley - Introduction to Lattices and Order, Second Edition-Cambridge University Press (2002).pdf
      Downloads/Adam Drozdek - Data Structures and Algorithms in C++-Cengage Learning (2012).pdf
      Downloads/Brannan, D. A._Esplen, Matthew F._Gray, Jeremy J - Geometry-Cambridge University Press (2012).pdf

# Redirecionamento e pipes

- Redirecionadores `>` e `>>`: Redireciona a saída padrão para um
  arquivo, sobrescrevendo ou anexando, respectivamente:

      $ echo "Oi" > hello.txt
      $ cat hello.txt
      Oi
      $ echo "mãe!" >> hello.txt
      $ cat hello.txt
      Oi
      mãe!
      $ echo "hello world" > hello.txt
      cat hello.txt
      hello world

- Pipes `|`: Conecta a saída de um comando à entrada de outro:

      $ ls -la | grep "Downloads"
      drwxr-xr-x   8 user  user    4096 Aug  5 14:36 Downloads

# Variáveis de Ambiente

Nada mais é do que uma variável que pode ser acessada por qualquer
processo em execução no sistema. Alguns exemplos de variáveis de
ambiente são o `PATH`, `HOME`, `USER`. Podemos expandir o valor de uma
variável de ambiente usando o `$`:

    $ echo $PATH
    /home/user/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    $ echo $HOME
    /home/user
    $ echo $USER
    user

# Instalação de programas

Quando o sistema tenta executar um comando, ele procura seu executável
com o mesmo nome na pasta `PATH`. Dessa forma, quando queremos instalar
um programa de forma que ele seja reconhecido pelo sistema, colocamos
seu executável numa das pastas do `PATH`.

Por simplicidade, colocamos apenas um link simbólico em uma pasta
desejada do `PATH`, geralmente `/usr/local/bin`:

    # ln -s /caminho/para/executavel /usr/local/bin/nome_do_programa

# Gerenciadores de pacote

## Instalação de programas

A maneira mais comum/recomendada/sempre a melhor de instalar programas é
usando um gerenciador de pacotes, que toda distro tem. Alguns exemplos
são:

- **Arch Linux**: `pacman`

      # pacman -S nome_do_programa

- **Debian/Ubuntu**: `apt`

      # apt install nome_do_programa

- **Fedora**: `dnf`

      # dnf install nome_do_programa

## Remoção de programas

Podemos remover programas da mesma forma que os instalamos:

- **Arch Linux**:

      # pacman -Rs nome_do_programa

- **Debian/Ubuntu**:

      # apt remove nome_do_programa

- **Fedora**:

      # dnf remove nome_do_programa

## Atualização de programas

Para atualizar os pacotes, também se torna muito mais simples:

- **Arch Linux**:

      # pacman -Syu

- **Debian/Ubuntu**:

      # apt update ; apt upgrade

- **Fedora**:

      # dnf check-update ; dnf upgrade
