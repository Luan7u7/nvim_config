-- Arquivo corrigido para resolver problemas de carregamento
-- Este arquivo importa os módulos customizados para o Neovim

-- Importa as opções de configuração
require 'custom.core.options'

-- Importa os mapeamentos de teclas personalizados
require 'custom.core.keymaps'

-- Importa os comandos personalizados
require 'custom.core.commands'

-- Importa configurações de completação (cmp)
-- Nota: Este módulo já existe e está configurado corretamente
require 'custom.core.cmp'

-- Importa configurações de LSP
-- Nota: Este módulo já existe e está configurado corretamente
require 'custom.core.lsp'
