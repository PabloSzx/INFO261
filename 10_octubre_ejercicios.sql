/* 1 */
select count(*) from contener inner join palabra on contener.valor_pal = palabra.valor where palabra="mapuche";




/* 2 */
select 
nombre_medio, count(*) as N from 
medio inner join 
noticia on 
medio.medio_nombre = noticia.medio_nombre inner join 
contener on 
contener.noticia_id = noticia.noticia_id where 
valor_pal = "Cambio Climatico" group by 
nombre_medio order by 
N DESC;


/* 3 */
select distinct 
	medio_nombre from 
		medio inner join noticia on 
			medio.medio_nombre = noticia.medio_nombre left join contener on 
				noticia.noticia_id = contener.noticia_id where 
					valor_pal="Sexismo" and contener.valor_pal=null;


/* 4 */

/* LISTAR NOTICIAS DE SEMANA PASADA */
/*  CONTAR Y AGRUPAR POR MEDIO */
/* AL MENOS 50 */
select 
count(*) as N, medio_nombre from 
noticia where 
fecha between 
"9-10-2018" and "10-10-2018" group by 
medio_nombre having
N > 50;


/* 5 */
select 
	avg(audiencia), categoria, medio_nombre from 
		canal inner join medio on 
			medio.medio_nombre = canal.medio_nombre inner join tener_audiencia on 
				canal.cuenta = tener_audiencia.cuenta where 
					tipo_red = "Twitter" 
                    and 
                    (categoria = "regional" or categoria = "nacional") 
						group by
							medio_nombre;

/* 6 */
select 
	medio_nombre, audiencia, fecha from 
		medio inner join  canal on 
			medio.medio_nombre = canal.medio_nombre 
				inner join tener_audiencia on 
					tener_audiencia.cuenta = canal.cuenta where
						medio_nombre = "El Mercurio" 
                        and
                        tipo_red = "Twitter"
							order by 
								audiencia 
							limit 
								1;
/* 7 */
select
	medio_nombre, caracterizar.valor as etiqueta from
		medio left join noticia on
			medio.medio_nombre = noticia.medio_nombre
				inner join caracterizar on
					caracterizar.valor = noticia.noticia_id where
						caracterizar.valor = "Ecología"
                        and
                        noticia.noticia_id = null;
/* 8 */
select
	contener.valor_pal as palabra, apariciones from
		caracterizar inner join noticia on
			caracterizar.noticia_id = noticia.noticia_id 
				inner join contener
					on noticia.noticia_id = contener.noticia_id
				where
					caracterizar.valor = "Sexismo" 
				group by
					apariciones
				order by
					apariciones DESC;
				
				
			
	
						
				






