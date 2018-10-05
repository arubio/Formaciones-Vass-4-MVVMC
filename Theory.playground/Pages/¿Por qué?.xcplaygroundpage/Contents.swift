/*:
 
 # ¿Por qué MVVM?
 
 MVVM es un patrón arquitectural que trata de construir sobre MVC moviendo todas las tareas relacionadas con el modelo (actualizarlo, observar sus cambios, transformar sus datos para presentarlos, etc.) fuera del la capa del *controller*, creando en el proceso una nueva capa llamada *view model*.
 
 Los view models viven entre el modelo y el controller:
 
 ![MVVM](mvvm.png)

 Esto no se trata únicamente de mover código de un sitio a otro, el propósito es:
 
 * Incentivar a structurar las relaciones entre el modelo y la view como una serie de transformaciones.
 * Proporcionar una interfaz que sea independiente del framework de la aplicación, que represente de la forma más fidedigna posible el estado de la capa de *views*.
 
 Para mantener las views sincronizadas con el view model, MVVM requiere el uso de alguna forma de *binding* (cualquier mecanismo diseñado con el propósito de mantener las propiedades de un objeto sincronizadas con otro objeto). En nuestro caso, el view controller construirá estos bindings entre las propiedades que exponga el viewModel y las propiedades que tengan las views de la escena a la que pertenezca el view model.
 
 Adicionalmente nuestro ejemplo tambien incluye otra entidad llamada **Coordinator**. Esta entidad no es necesaria para implementar el patrón, pero nos facilita mucho la vida a la hora de mediar entre una escena y otra (presentar un nuevo VC, pasar datos de una escena a otra, etc.). El coordinator se encargará de controlar la jerarquia de view controllers y así los view models solo tendrán que concentrarse en su propia escena.
 
 ![MVVM](mvvmc.png)

 El coordinator es el delegado del view model (en nuestro caso), así que el viewModel reenviará eventos de navegación directamente al coordinator. Este arreglo de entidades nos permite una mejor testeabilidad.
 */
