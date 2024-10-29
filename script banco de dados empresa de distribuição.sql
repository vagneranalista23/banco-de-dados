create database empresa_de_distribuição;
use empresa_de_distribuição;

create table cidade(
id_cidade int auto_increment primary key,
nome_cidade varchar(50),
sigla_estado varchar(3)
);

create table cliente_pf(
id_cpf int auto_increment primary key,
nome_cliente varchar(50),
telefone int
);

create table cliente_PJ(
id_cnpj int auto_increment primary key,
razao_social varchar(50),
telefone int
);

create table endereço(
id_Codigo_endereço int auto_increment primary key,
cep int,
logradouro varchar(22),
nome varchar(55),
numero int
);

create table filial(
id_filial int auto_increment primary key,
gerente varchar(50),
fk_id_cidade int,
foreign key (fk_id_cidade) references cidade (id_cidade)
);

create table funcionarios(
id_cpf_funcionario int auto_increment primary key,
nome varchar(50),
cargo varchar(22),
data_efetivação date,
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial) 
);

create table estoque(
id_codigo_produto int auto_increment primary key,
nome varchar(50),
descriçao varchar(256),
quantidade int,
preço_venda double,
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table veiculos(
Id_placa int auto_increment primary key,
modelo varchar(22),
capacidade_carga int,
ano_fabricaçao int,
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table pedido_vendas(
id_numero_pedido int auto_increment primary key,
quantidade int,
valor_final double,
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table entrega(
id_entrega int auto_increment primary key,
data_entrega date,
motorista varchar(50),
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table cadastrado(
fk_id_cnpj int,
foreign key (fk_id_cnpj) references cliente_PJ (id_cnpj),
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table cadastra(
fk_id_cpf int,
foreign key (fk_id_cpf) references cliente_pf (id_cpf),
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);

create table possui_endereço_cliente_pf_cliente_PJ_filial(
fk_id_Codigo_endereço int,
foreign key (fk_id_Codigo_endereço) references endereço (id_Codigo_endereço),
fk_id_cpf int,
foreign key (fk_id_cpf) references cliente_pf (id_cpf),
fk_id_cnpj int,
foreign key (fk_id_cnpj) references cliente_PJ (id_cnpj),
fk_id_filial int,
foreign key (fk_id_filial) references filial (id_filial)
);
