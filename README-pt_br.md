- [Fundamentos Plus Mobile](#fundamentos-plus-mobile)
  - [Demonstração](#demonstração)
  - [Funcionalidades](#funcionalidades)
  - [Execução local](#execução-local)
    - [Requisitos](#requisitos)
    - [Passos para execução](#passos-para-execução)
  - [Deploy](#deploy)
  - [Tecnologias utilizadas](#tecnologias-utilizadas)
  - [Testes](#testes)
    - [Compatibilidade com Android](#compatibilidade-com-android)
  - [Contribuição](#contribuição)
  - [Autores](#autores)
  - [Licença](#licença)

[English](./README.md)

# Fundamentos Plus Mobile

O **Fundamentos Plus Mobile** é a versão mobile do projeto [Fundamentos Plus](https://github.com/JoaoEmanuell/fundamentos-plus-web).

Desenvolvido com Flutter, o aplicativo funciona totalmente offline, permitindo que o usuário acesse as lições desde a primeira execução.

## Demonstração

![Demo gif](./docs/video.gif)

## Funcionalidades

- Operação 100% offline.
- Atualização automática das lições.
- Modo claro e escuro.
- Download de PDFs.
- Salvamento do progresso das lições.

## Execução local

### Requisitos

```bash
Flutter >= 3.30.0-1.0.pre.220
Dart >= 3.8.0
Android SDK >= 34.0.0
```

### Passos para execução

Clone o repositório:

```bash
git clone https://github.com/JoaoEmanuell/fundamentos-plus-mobile
```

Acesse o diretório do projeto:

```bash
cd fundamentos-plus-mobile
```

Execute o aplicativo:

```bash
flutter run
```

## Deploy

Para realizar o deploy deste projeto, siga as instruções para a geração da chave de assinatura disponíveis [neste link](https://docs.flutter.dev/deployment/android#create-an-upload-keystore).

Após configurar a chave, gere o APK com o seguinte comando:

```bash
flutter build apk
```

## Tecnologias utilizadas

- Flutter
- Dart
- Material Design

## Testes

Para rodar os testes automatizados, utilize o comando:

```bash
flutter test --coverage
```

Para mais detalhes sobre os testes, consulte a documentação disponível [aqui](./docs/TESTS_DETAILS.md).

### Compatibilidade com Android

Version | Status            | Tipo         
:--:    | :--:              | :--:         
**15**  | ❌ *Não testado*  |
**14**  | ✅ **Concluído**  | **Físico**
**13**  | ✅ **Concluído**  | **Emulador**
**12**  | ✅ **Concluído**  | **Emulador**
**11**  | ✅ **Concluído**  | **Físico**
**10**  | ✅ **Concluído**  | **Emulador**
**9.0** | ✅ **Concluído**  | **Emulador**
**8.0** | ✅ **Concluído**  | **Emulador**
**7.0** | ✅ **Concluído**  | **Emulador**
**6.0** | ✅ **Concluído**  | **Emulador**
**5.1** | ✅ **Concluído**  | **Emulador**
**5.0** | ✅ **Concluído**  | **Emulador**

## Contribuição

Contribuições são sempre bem-vindas! 

Você pode contribuir sugerindo novas funcionalidades, reportando bugs ou abrindo *pull requests* com melhorias.

## Autores

- [@JoaoEmanuell](https://www.github.com/JoaoEmanuell)

## Licença

Este projeto está licenciado sob a licença [MIT](https://github.com/JoaoEmanuell/dmyrn/blob/master/LICENSE).
