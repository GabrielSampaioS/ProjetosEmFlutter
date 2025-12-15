# Runner's Circle - App de Corridas

Um aplicativo Flutter para gerenciar e registrar suas corridas, com sistema de autenticação e preferências de tema.

## Funcionalidades

### 🔐 Sistema de Autenticação

- **Tela de Login**: Interface intuitiva para autenticação do usuário
- **Login Mockado**: Sistema de autenticação simulado para desenvolvimento
- **Persistência de Sessão**: Sistema preparado para implementação futura
- **Logout**: Funcionalidade para sair da conta

### 🎨 Sistema de Temas

- **Tema Claro**: Interface com cores claras e legíveis
- **Tema Escuro**: Interface com cores escuras para uso noturno
- **Persistência de Preferência**: Sistema preparado para implementação futura
- **Alternância Dinâmica**: Troca de tema em tempo real

### 🏃‍♂️ Gerenciamento de Corridas

- **Lista de Corridas**: Visualização de todas as corridas registradas
- **Adicionar Corrida**: Formulário para registrar nova corrida
- **Editar Corrida**: Modificar informações de corridas existentes
- **Excluir Corrida**: Remover corridas da lista

### ⚙️ Preferências do Usuário

- **Tela de Configurações**: Interface para gerenciar preferências
- **Seletor de Tema**: Opções para alternar entre tema claro e escuro
- **Informações da Conta**: Dados do usuário logado
- **Acesso Rápido**: Menu lateral com opções principais

## Estrutura do Projeto

```
lib/
├── config/
│   ├── dependencies.dart      # Configuração de dependências
│   └── theme_manager.dart     # Gerenciador de temas (configuração direta)
├── data/
│   ├── repositories/
│   │   ├── auth_repository.dart    # Repository de autenticação
│   │   └── run_repository.dart     # Repository de corridas
├── domain/
│   ├── models/
│   │   └── run/                    # Modelos de dados
│   └── use_cases/
│       ├── auth/                   # Casos de uso de autenticação
│       └── run/                    # Casos de uso de corridas
├── ui/
│   ├── auth/
│   │   ├── login_screen.dart       # Tela de login
│   │   └── view_models/            # ViewModels de autenticação
│   ├── home/
│   │   └── widgets/                # Widgets da tela principal
│   └── preferences/
│       └── preferences_screen.dart # Tela de preferências
└── main.dart                       # Ponto de entrada da aplicação
```

## Como Usar

### 1. Login

- Abra o aplicativo
- Digite qualquer email válido (ex: `usuario@teste.com`)
- Digite qualquer senha com pelo menos 3 caracteres
- Clique em "Entrar"

### 2. Alterar Tema

- Na tela principal, abra o menu lateral (ícone de hambúrguer)
- Clique em "Preferências"
- Escolha entre "Claro" ou "Escuro"
- O tema será aplicado imediatamente

### 3. Gerenciar Corridas

- Use o botão flutuante (+) para adicionar nova corrida
- Toque em uma corrida existente para editá-la
- Use o menu de opções para excluir corridas

### 4. Sair da Conta

- Abra o menu lateral
- Clique em "Logout" ou vá em "Preferências" e use "Sair da Conta"

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento
- **Provider**: Gerenciamento de estado
- **SharedPreferences**: Persistência de dados locais
- **Material Design**: Interface de usuário

## Instalação

1. Clone o repositório
2. Execute `flutter pub get` para instalar dependências
3. Execute `flutter run` para iniciar o aplicativo

## Desenvolvimento

### Dependências Principais

- `provider: ^6.1.2` - Gerenciamento de estado
- `google_fonts: ^6.2.1` - Fontes personalizadas
- **Persistência**: Sistema preparado para implementação futura

### Arquitetura

O projeto segue o padrão MVVM (Model-View-ViewModel) com:

- **Models**: Entidades de dados (Run)
- **Views**: Interfaces de usuário
- **ViewModels**: Lógica de negócio e estado
- **Use Cases**: Casos de uso da aplicação
- **Repositories**: Acesso a dados

## Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature
3. Commit suas mudanças
4. Push para a branch
5. Abra um Pull Request

## 🔮 Implementação Futura

### Sistema de Persistência

O projeto está preparado para receber sua implementação de persistência:

- **ThemeManager**: Método `toggleTheme()` com TODO para salvar preferência (configuração direta)
- **AuthRepository**: Métodos com TODOs para persistir estado de autenticação
- **Estrutura**: Arquitetura limpa com Repository, Use Cases e ViewModels

### Como Implementar

1. **Para Autenticação**: Implemente os métodos no `AuthRepository` e seus use cases
2. **Para Temas**: Implemente no `ThemeManager` se necessário (atualmente configuração direta)
3. **Mantenha**: As chamadas para `notifyListeners()` para atualizar a UI
4. **Resultado**: O sistema funcionará automaticamente com sua implementação

## Licença

Este projeto está sob a licença MIT.
