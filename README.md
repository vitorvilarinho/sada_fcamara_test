# SADA Checklist

## Índice

1. [Introdução](#1-introdução)
2. [Arquitetura do Projeto](#2-arquitetura-do-projeto)
3. [Como Rodar](#3-como-rodar)
4. [Estrutura de Pastas](#4-estrutura-de-pastas)

## 1. Introdução
Este é um projeto desenvolvido por [Vitor Vilarinho](https://github.com/vitorvilarinho) para o processo seletivo da seguradora Sada Logística 

## 2. Arquitetura do Projeto
O projeto utiliza uma arquitetura modular baseada em pacotes, seguindo boas práticas de separação de responsabilidades e escalabilidade. As principais características são:

## 2. Arquitetura do Projeto
O projeto utiliza uma arquitetura modular baseada em pacotes, seguindo boas práticas de separação de responsabilidades e escalabilidade. As principais características são:

- **Flutter Modular/Multi-Package**: Cada domínio é um pacote Dart/Flutter independente, facilitando a manutenção e o reuso.
- **Clean Architecture**: Separação clara entre camadas de domínio, apresentação e infraestrutura, promovendo baixo acoplamento e alta coesão.
- **Design System**: Componentização visual centralizada para garantir consistência de UI/UX.
- **Gerenciamento de Estado**: MobX

Essa abordagem permite que novas features e serviços sejam adicionados ou modificados de forma isolada, sem impactar o restante do sistema, além de facilitar a colaboração em equipe e a escalabilidade do projeto.

## 3. Como Rodar
### Executando no VS Code

1. Abra o projeto no VS Code.
2. Certifique-se de que o plugin Flutter está instalado.
3. Selecione o dispositivo desejado (emulador Android/iOS ou Chrome/Web) na barra inferior.
4. Pressione `F5` ou clique em "Run and Debug" para iniciar o app.

### Executando pelo terminal

#### Mobile (Android/iOS)
```
cd apps/tokio_marine_app
flutter pub get
flutter run
```
> Para iOS, utilize um Mac com Xcode instalado e um simulador configurado.

## 4. Estrutura de Pastas
O projeto segue uma estrutura modularizada, separando responsabilidades em diferentes pacotes e domínios. Abaixo, um resumo das principais pastas:

- **apps/**: Contém os aplicativos principais do projeto. Exemplo: `sada_checkpoint` (aplicativo Flutter).
  - `android/` e `ios/`: Códigos nativos para Android e iOS.
  - `lib/`: Código Dart principal do app.
  - `test/`: Testes do app.

- **design_system/**: Componentes visuais reutilizáveis, temas, ícones e assets gráficos.
  - `assets/`: Imagens e SVGs.
  - `lib/`: Widgets e temas.
  - `test/`: Testes dos componentes visuais.

Essa organização facilita a escalabilidade, manutenção e reutilização de código entre diferentes partes do projeto.