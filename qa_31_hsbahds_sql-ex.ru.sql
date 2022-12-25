-- https://www.sql-ex.ru/

-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd FROM PC
WHERE price < 500

-- Задание: 2 (Serge I: 2002-09-21)
-- Найдите производителей принтеров. Вывести: maker
SELECT Maker FROM Product
WHERE type='printer'
GROUP BY maker

-- Задание: 3 (Serge I: 2002-09-30)
-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from laptop
where price>1000

-- Задание: 4 (Serge I: 2002-09-21)
-- Найдите все записи таблицы Printer для цветных принтеров.
select * from printer 
where color='y'

-- Задание: 5 (Serge I: 2002-09-30)
-- Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
select model, speed, hd from pc
where (cd='12x' or cd='24x') and price<600

-- Задание: 6 (Serge I: 2002-10-28)
-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти
-- скорости таких ПК-блокнотов. Вывод: производитель, скорость.
select distinct product.maker, laptop.speed
from laptop
join product on product.model=laptop.model
where hd>=10

-- Задание: 7 (Serge I: 2002-11-02)
-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select distinct product.model, pc.price from product
join pc on product.model=pc.model 
where maker='B'
union
select distinct product.model, laptop.price from product
join laptop on product.model=laptop.model
where maker='B'
union
select distinct product.model, printer.price from product
join printer on product.model=printer.model
where maker='B'

--Задание: 8 (Serge I: 2003-02-03)
--Найдите производителя, выпускающего ПК, но не ПК-блокноты.
select distinct maker from product
where type='pc'
except
select distinct maker from product
where type='laptop'

--Задание: 9 (Serge I: 2002-11-02)
--Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select distinct product.maker
from pc
join product on pc.model=product.model
where pc.speed>=450

--Задание: 10 (Serge I: 2002-09-23)
--Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
select model, price from printer
where price=(select max(price) from printer)

--Задание: 11 (Serge I: 2002-11-02)
--Найдите среднюю скорость ПК.
select avg(speed)
from pc

--Задание: 12 (Serge I: 2002-11-02)
--Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg(speed) from laptop 
where price>1000

--Задание: 13 (Serge I: 2002-11-02)
--Найдите среднюю скорость ПК, выпущенных производителем A.
select avg(speed) from pc
join product on product.model=pc.model
where maker='A'

--Задание: 14 (Serge I: 2002-11-05)
--Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
select ships.class, ships.name, Classes.country from ships
join classes on ships.class=Classes.class
where classes.numGuns>=10

--Задание: 15 (Serge I: 2003-02-03)
--Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
select hd from pc 
group by(hd) HAVING COUNT(model)>= 2

--Задание: 16 (Serge I: 2003-02-03)
--Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
--В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
--Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
select distinct p1.model, p2.model, p1.speed, p1.ram
from pc p1, pc p2
where p1.speed=p2.speed and p1.ram=p2.ram and p1.model>p2.model

--Задание: 17 (Serge I: 2003-02-03)
--Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
--Вывести: type, model, speed
select distinct p.type, p.model, l.speed
from laptop l
join product p on p.model=l.model
where l.speed<(select min(speed) from pc)

--Задание: 18 (Serge I: 2003-02-03)
--Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
select DISTINCT product.maker, printer.price
from product, printer
where product.model=printer.model
and printer.color='y'
and printer.price=(select min(price) from printer where color='y')

--Задание: 19 (Serge I: 2003-02-13)
--Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
--Вывести: maker, средний размер экрана.
select p.maker, avg(screen)
from laptop l
left join product p on p.model=l.model
group by p.maker

--Задание: 19 (Serge I: 2003-02-13)
--Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
--Вывести: maker, средний размер экрана.
select p.maker, avg(screen)
from laptop l
left join product p on p.model=l.model
group by p.maker

--Задание: 20 (Serge I: 2003-02-13)
--Найдите производителей, выпускающих по меньшей мере три различных модели ПК. 
--Вывести: Maker, число моделей ПК.
select maker, count(model)
from product p
join pc on p.model=pc.model
where type='pc'
group by p.maker
having count(distinct model)>=3

--Задание: 21 (Serge I: 2003-02-13)
--Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
--Вывести: maker, максимальная цена.
select product.maker, max(pc.price)
from product, pc
where product.model = pc.model
group by product.maker



