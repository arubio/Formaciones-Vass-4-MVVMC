/*:
 
 # Conclusiones
 
 A primera vista MVVM-C parece un patrón más complejo que MVC. A nivel de implementación sin embargo, el código puede llegar a ser más simple si nos ceñimos al patrón de forma consistente. Aún así, simple no quiere decir necesariamente más fácil. Hasta que no nos familiaricemos con las transformaciones más comunes, el código reactivo puede parecer dificil de escribir y frustrante de debugear.
 
 Así pues la programación reactiva es en sí misma uno de los obstáculos más grandes a la hora de entender y escribir código en MVVM. Los frameworks de programación reactiva traen una curva de aprendizaje bastante inclinada, y se suele tardar un tiempo hasta que nos acostumbramos a ella. Además, estos frameworks se apoyan en transformaciones abstractas y un gran número de tipos que cuando no usamos bien hacen nuestro código ininteligible.
 
 ## Lecciones a aprender
 
 ### Introducción de nuevas capas de indirección
 
 MVVM nos da una lección sobre como podemos construir flujos que transforman datos abstractos (modelo) en datos concretos (para nuestra view). El view model es solo uno de los conductos entre el modelo y el view controller. Podemos aplicar este patrón a otras partes de nuestra aplicación como servicios de sistema, casos de uso, etc.
 
 Aún con esta posibilidad, es importante que no introduzcamos capas adicionales de forma prematura. No hay razón para añadir nuevas abstracciones si estas abstracciones no nos facilitan la habilidad de escribir nuevo código.
 
 ### Coordinators
 
 Los coordinators son un patrón independiente de la arquitectura MVVM. Cuando usamos coordinators los view controllers no presentan otros view controllers. En vez de esto, llama al coordinator (en nuetro caso a través del view model) para delegar la navegación.
 
 ### Transformaciones de datos
 
 Otra lección que podemos aprender de MVVM es el beneficio de sacar la lógica de las transformaciones de datos del view controller. Por lo general estas transformaciones suelen ser de strings, números o fechas a nuestra representación visual de las mismas. Los beneficios quedan aún mas patentes cuando nuestras transformaciones incurren en lógica más compleja que simples operaciones de formateo.
 
 */
