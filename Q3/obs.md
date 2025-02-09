# 🛠️ Guia de Compilação e Execução - Circuitos Lógicos em Mozart/Oz

Este projeto implementa portas lógicas básicas e circuitos digitais no modelo **declarativo concorrente** utilizando **Mozart/Oz**.

---

## 📌 **1. Pré-requisitos**
Antes de iniciar, certifique-se de que você tem o **Mozart/Oz** instalado no Ubuntu.
Se ainda não tiver, instale com:

```bash
sudo apt update
sudo apt install mozart
```

Verifique se a instalação foi concluída corretamente:
```bash
ozc --version
```

---

## 📌 **2. Configuração e Modificações Necessárias**
Antes de compilar, **verifique e modifique** os seguintes pontos caso necessário:

1️⃣ **Caminho do Functor na Main**
   - No arquivo **Main.oz**, confirme que o caminho do functor está correto:
   ```ozn
   functor
   import
      LogicGatesAndCircuits at '/caminho/para/seu/diretorio/LogicGatesAndCircuits.ozf'
      Browser
   define
   ```
   - Se necessário, modifique **`/caminho/para/seu/diretorio/LogicGatesAndCircuits.ozf`** para o caminho correto no seu sistema.

2️⃣ **Verifique os valores de entrada**
   - Os valores das streams para o **Full Adder** e o **Parity Checker** podem ser modificados na **Main.oz**:
   ```oz
   A = 1 | 0 | 1 | 0 | nil
   B = 0 | 1 | 0 | 1 | nil
   Cin = 0 | 0 | 1 | 1 | nil
   ```
   - Alterando esses valores, você pode testar diferentes operações lógicas.

Após fazer essas modificações, siga para a compilação.

---

## 📌 **3. Compilação**
Para compilar os arquivos, siga esta ordem no terminal:

```bash
cd /caminho/para/seu/diretorio  # Navegue até a pasta do projeto

ozc -c LogicGatesAndCircuits.oz  # Compila o functor

ozc -c Main.oz                   # Compila o programa principal
```

Isso gerará os arquivos **LogicGatesAndCircuits.ozf** e **Main.ozf**, que serão usados na execução.

---

## 📌 **4. Execução do Código**
Após compilar e verificar as configurações, execute o programa principal com:

```bash
ozengine Main.ozf
```

Se tudo estiver correto, os resultados aparecerão na **janela do Browser do Mozart/Oz**.

---

## 📌 **5. Verificando os Resultados**
Os valores das operações lógicas serão exibidos no **Browser** do Mozart/Oz.
Exemplo de saída esperada:

```
[1 1 0 0]  # Soma do Full Adder
[0 0 1 1]  # Carry Out do Full Adder
[1 1 0 0]  # Resultado do Parity Checker
```

Se precisar modificar os circuitos ou adicionar novos testes, edite os arquivos e repita o processo de **compilação e execução**. 🚀🔥

---

## 📌 **6. Erros Comuns e Soluções**
🛑 **Erro de Caminho:**
Se aparecer **"cannot find module"**, verifique se o caminho do `LogicGatesAndCircuits.ozf` está correto na `Main.oz`.

🛑 **Erro de Sintaxe:**
Verifique se todas as funções `case Xs of` contêm `else nil` para evitar falhas ao processar `nil`.

---

## 📌 **7. Conclusão**
Agora você tem um guia completo para compilar e executar os circuitos digitais no **Mozart/Oz**. Se precisar de mais ajuda, entre em contato! 🚀🔥

