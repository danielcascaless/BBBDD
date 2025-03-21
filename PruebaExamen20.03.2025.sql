
/*
Asignatura: (1903) Bases de Datos
Curso: 2024/25
Convocatoria: junio

Practica: P2. Consultas en SQL

Equipo de practicas: ****
 Integrante 1: Pablo Belchi Corredor             
 Integrante 2: Daniel Cascales Marcos
*/

-- EJERCICIOS:


--Q1

SELECT T.A_ESTRENO,S.TITULO AS titulo_serie,COALESCE(C.TITULO,'****') AS titulo_capitulo
FROM SERIE S 
JOIN TEMPORADA T ON T.SERIE = S.SERIE_ID AND T.TEMPORADA=1
JOIN CAPITULO C ON C.SERIE = S.SERIE_ID AND C.CAPITULO=1 AND C.TEMPORADA=1
WHERE NACIONALIDAD IN ('Espana','Reino Unido')
ORDER BY T.A_ESTRENO;



--Otra forma

select T.a_estreno, S.titulo AS titulo_serie, COALESCE(C.titulo, '****') AS titulo_capitulo
from Serie S
JOIN temporada T ON S.serie_id = T.serie
LEFT JOIN capitulo C ON T.serie = C.serie AND T.temporada = C.temporada
where T.temporada = 1 and C.capitulo = 1 and (S.nacionalidad = 'Espana' or S.nacionalidad = 'Reino Unido')
order by T.a_estreno asc;





--Q2

SELECT interprete_id
FROM INTERPRETE
WHERE nacionalidad <> 'Reino Unido' AND a_nacimiento > 1982

MINUS

SELECT r.interprete
FROM REPARTO r
JOIN SERIE s ON r.serie = s.serie_id
WHERE s.genero = 'Drama';




--Q3

SELECT U.nombre AS nombre_usuario, 
       COALESCE(S.titulo, '----') AS titulo_serie
FROM USUARIO U
LEFT JOIN INTERES I ON U.usuario_id = I.usuario
LEFT JOIN SERIE S ON I.serie = S.serie_id
WHERE U.cuota < 50 AND U.f_registro < SYSDATE-3*365
ORDER BY U.nombre, S.titulo;
