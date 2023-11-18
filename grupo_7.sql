-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18-Nov-2023 às 20:02
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grupo_7`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_empresa_cl` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `id_empresa`, `nome`, `telefone`, `documento`, `email`, `data_cadastro`) VALUES
(1, 1, 'loja1', '01 000000000', '001 000 000', 'loja1@gmail.com', '2023-11-18 11:07:01'),
(2, 1, 'loja2', '02 000000000', '002 000 000', 'loja2@gmail.com', '2023-11-18 11:07:22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`id`, `nome`, `cnpj`, `email`, `data_cadastro`) VALUES
(1, 'Delmorro', '0000000000', 'delmorro@gmail.com', '2023-11-18 11:05:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapas`
--

DROP TABLE IF EXISTS `etapas`;
CREATE TABLE IF NOT EXISTS `etapas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordem` int NOT NULL DEFAULT '0',
  `id_processo` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_processos_et` (`id_processo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `etapas`
--

INSERT INTO `etapas` (`id`, `nome`, `ordem`, `id_processo`, `data_cadastro`) VALUES
(1, 'espremer as laranja', 0, 1, '2023-11-18 11:24:49'),
(2, 'botar o suco na garrafa', 0, 2, '2023-11-18 11:28:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `id_empresa`, `nome`, `email`, `senha`, `nivel`, `data_cadastro`) VALUES
(1, 1, 'Jorge O.', 'JorgeOdiado@gmail.com', 'senha', 3, '2023-11-18 11:07:55'),
(2, 1, 'Carlos S.', 'CarlosSoares321@gmail.com', 'senha', 3, '2023-11-18 11:08:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `insumos`
--

DROP TABLE IF EXISTS `insumos`;
CREATE TABLE IF NOT EXISTS `insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quatidade` decimal(5,3) NOT NULL,
  `unidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_produtos_in` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `insumos`
--

INSERT INTO `insumos` (`id`, `id_produto`, `nome`, `quatidade`, `unidade`, `data_cadastro`) VALUES
(1, 1, 'laranja', '10.000', 'kg', '2023-11-18 11:16:50'),
(2, 2, 'plastico', '10.000', 'kg', '2023-11-18 11:17:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha_producao`
--

DROP TABLE IF EXISTS `linha_producao`;
CREATE TABLE IF NOT EXISTS `linha_producao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa` int NOT NULL,
  `id_setor` int NOT NULL,
  `id_responsavel` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_empresa_lp` (`id_empresa`),
  KEY `fk_setor_lp` (`id_setor`),
  KEY `fk_if_funcionario_lp` (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `linha_producao`
--

INSERT INTO `linha_producao` (`id`, `nome`, `id_empresa`, `id_setor`, `id_responsavel`, `data_cadastro`) VALUES
(1, 'Suco', 1, 1, 1, '2023-11-18 11:15:38'),
(2, 'Embalagem', 1, 2, 2, '2023-11-18 11:16:09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_producao`
--

DROP TABLE IF EXISTS `ordem_producao`;
CREATE TABLE IF NOT EXISTS `ordem_producao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL,
  `id_setor` int NOT NULL,
  `id_cliente` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_empresa_op` (`id_empresa`),
  KEY `pk_setor_op` (`id_setor`),
  KEY `pk_cliente_op` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ordem_producao`
--

INSERT INTO `ordem_producao` (`id`, `id_empresa`, `id_setor`, `id_cliente`, `data_cadastro`) VALUES
(1, 1, 1, 1, '2023-11-18 11:28:49'),
(2, 1, 2, 2, '2023-11-18 11:28:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_producao_tempo_produtos`
--

DROP TABLE IF EXISTS `ordem_producao_tempo_produtos`;
CREATE TABLE IF NOT EXISTS `ordem_producao_tempo_produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ordem` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_ordem_opp` (`id_ordem`),
  KEY `pk_produto_opp` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `ordem_producao_tempo_produtos`
--

INSERT INTO `ordem_producao_tempo_produtos` (`id`, `id_ordem`, `id_produto`, `quantidade`, `data_cadastro`) VALUES
(1, 1, 1, 10, '2023-11-18 11:29:41'),
(2, 2, 2, 10, '2023-11-18 11:29:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `processos`
--

DROP TABLE IF EXISTS `processos`;
CREATE TABLE IF NOT EXISTS `processos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_setor` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_setor_pr` (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `processos`
--

INSERT INTO `processos` (`id`, `nome`, `id_setor`, `data_cadastro`) VALUES
(1, 'Fazer suco', 1, '2023-11-18 11:11:57'),
(2, 'Embalar', 2, '2023-11-18 11:12:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pk_empresas_pr` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `id_empresa`, `data_cadastro`) VALUES
(1, 'Suco de laranja', 1, '2023-11-18 11:10:26'),
(2, 'embalagem', 1, '2023-11-18 11:10:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `setores`
--

DROP TABLE IF EXISTS `setores`;
CREATE TABLE IF NOT EXISTS `setores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa` int NOT NULL,
  `id_responsavel` int NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_empresa_st` (`id_empresa`),
  KEY `fk_funcionarios_st` (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `setores`
--

INSERT INTO `setores` (`id`, `nome`, `id_empresa`, `id_responsavel`, `data_cadastro`) VALUES
(1, 'Fabricação do suco', 1, 1, '2023-11-18 11:08:57'),
(2, 'Embalagem', 1, 2, '2023-11-18 11:09:38');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `pk_empresa_cl` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `etapas`
--
ALTER TABLE `etapas`
  ADD CONSTRAINT `pk_processos_et` FOREIGN KEY (`id_processo`) REFERENCES `processos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `pk_produtos_in` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `linha_producao`
--
ALTER TABLE `linha_producao`
  ADD CONSTRAINT `fk_empresa_lp` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_if_funcionario_lp` FOREIGN KEY (`id_responsavel`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_setor_lp` FOREIGN KEY (`id_setor`) REFERENCES `setores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `ordem_producao`
--
ALTER TABLE `ordem_producao`
  ADD CONSTRAINT `pk_cliente_op` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_empresa_op` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_setor_op` FOREIGN KEY (`id_setor`) REFERENCES `setores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `ordem_producao_tempo_produtos`
--
ALTER TABLE `ordem_producao_tempo_produtos`
  ADD CONSTRAINT `pk_ordem_opp` FOREIGN KEY (`id_ordem`) REFERENCES `ordem_producao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pk_produto_opp` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `processos`
--
ALTER TABLE `processos`
  ADD CONSTRAINT `pk_setor_pr` FOREIGN KEY (`id_setor`) REFERENCES `setores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `pk_empresas_pr` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `setores`
--
ALTER TABLE `setores`
  ADD CONSTRAINT `fk_empresa_st` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_funcionarios_st` FOREIGN KEY (`id_responsavel`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
