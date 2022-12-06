create database pizzaria;
use pizzaria;

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');


CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date ,
  `payment_status` varchar(20) NOT NULL DEFAULT 'aguardando'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `bordas` (
  `idbordas` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bordas` (`idbordas`, `tipo`) VALUES
(1, 'Cheddar'),
(2, 'Catupiry'),
(3, 'Chocolate');


CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `massas` (
  `idmassas` int(11) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `massas` (`idmassas`, `tipo`) VALUES
(1, 'Massa comum'),
(2, 'Massa integral'),
(3, 'Massa temperada');


CREATE TABLE `pedidos` (
  `idpedidos` int(11) NOT NULL,
  `pizzas_idpizzas` int(11) NOT NULL,
  `status_idstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `pizzas` (
  `idpizzas` int(11) NOT NULL,
  `bordas_idbordas` int(11) NOT NULL,
  `massas_idmassas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `pizza_sabor` (
  `idpizza_sabor` int(11) NOT NULL,
  `sabores_idsabores` int(11) NOT NULL,
  `pizzas_idpizzas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `sabores` (
  `idsabores` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sabores` (`idsabores`, `nome`) VALUES
(1, '4 queijos'),
(2, 'Frango com Catupiry'),
(3, 'Calabresa'),
(4, 'Lombinho'),
(5, 'Filé com cheddar'),
(6, 'Portuguesa'),
(7, 'Margherita');


CREATE TABLE `status` (
  `idstatus` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `status` (`idstatus`, `tipo`) VALUES
(1, 'Em produção'),
(2, 'Entrega'),
(3, 'Concluído');

ALTER TABLE `bordas`
  ADD PRIMARY KEY (`idbordas`);

ALTER TABLE `massas`
  ADD PRIMARY KEY (`idmassas`);

ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedidos`),
  ADD KEY `fk_pedidos_pizzas1_idx` (`pizzas_idpizzas`),
  ADD KEY `fk_pedidos_status1_idx` (`status_idstatus`);

ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`idpizzas`),
  ADD KEY `fk_pizzas_bordas1_idx` (`bordas_idbordas`),
  ADD KEY `fk_pizzas_massas1_idx` (`massas_idmassas`);

ALTER TABLE `pizza_sabor`
  ADD PRIMARY KEY (`idpizza_sabor`),
  ADD KEY `fk_pizza_sabor_sabores_idx` (`sabores_idsabores`),
  ADD KEY `fk_pizza_sabor_pizzas1_idx` (`pizzas_idpizzas`);

ALTER TABLE `sabores`
  ADD PRIMARY KEY (`idsabores`);

ALTER TABLE `status`
  ADD PRIMARY KEY (`idstatus`);

ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_pizzas1` FOREIGN KEY (`pizzas_idpizzas`) REFERENCES `pizzas` (`idpizzas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_status1` FOREIGN KEY (`status_idstatus`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `pizzas`
  ADD CONSTRAINT `fk_pizzas_bordas1` FOREIGN KEY (`bordas_idbordas`) REFERENCES `bordas` (`idbordas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pizzas_massas1` FOREIGN KEY (`massas_idmassas`) REFERENCES `massas` (`idmassas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `pizza_sabor`
  ADD CONSTRAINT `fk_pizza_sabor_pizzas1` FOREIGN KEY (`pizzas_idpizzas`) REFERENCES `pizzas` (`idpizzas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pizza_sabor_sabores` FOREIGN KEY (`sabores_idsabores`) REFERENCES `sabores` (`idsabores`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;


ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;
