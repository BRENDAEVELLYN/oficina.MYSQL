# Projeto Oficina de Carros

Este projeto é um sistema de gerenciamento de oficina de carros, implementado com **MySQL**. O banco de dados armazena informações sobre clientes, veículos, marcas, modelos, cores e combustíveis.

## Estrutura do Banco de Dados

### Tabelas

1. **endereco**
   - `idendereco`: ID do endereço
   - `logradouro`: Endereço
   - `uf`: Unidade Federativa
   - `cidade`: Cidade

2. **cliente**
   - `idcliente`: ID do cliente
   - `nomecliente`: Nome do cliente
   - `cpf`: CPF
   - `sexo`: Sexo
   - `id_endereco`: ID do endereço (chave estrangeira)

3. **telefone**
   - `idtelefone`: ID do telefone
   - `ddd`: Código de área
   - `numero`: Número de telefone
   - `tipotelefone`: Tipo de telefone (Celular, Fixo, etc.)
   - `id_cliente`: ID do cliente (chave estrangeira)

4. **marca**
   - `idmarca`: ID da marca
   - `nome_marca`: Nome da marca

5. **modelo**
   - `idmodelo`: ID do modelo
   - `nome_modelo`: Nome do modelo
   - `id_marca`: ID da marca (chave estrangeira)

6. **carro**
   - `idcarro`: ID do carro
   - `placa`: Placa do carro
   - `numero_chassi`: Número do chassi
   - `id_cliente`: ID do cliente (chave estrangeira)
   - `id_modelo`: ID do modelo (chave estrangeira)

7. **cor**
   - `idcor`: ID da cor
   - `cor_1`: Cor primária
   - `cor_2`: Cor secundária
   - `tipodetinta`: Tipo de tinta

8. **carro_cor**
   - `id_carro`: ID do carro (chave estrangeira)
   - `id_cor`: ID da cor (chave estrangeira)

9. **combustivel**
   - `idcombustivel`: ID do combustível
   - `tipo_combustivel`: Tipo de combustível

10. **modelo_comb**
    - `id_combustivel`: ID do combustível (chave estrangeira)
    - `id_modelo`: ID do modelo (chave estrangeira)

