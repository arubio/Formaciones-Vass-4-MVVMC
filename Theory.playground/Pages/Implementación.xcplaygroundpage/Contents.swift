/*:

 # Implementación
 
 MVVM puede verse como una versión de MVC más elaborada. A parte de las nuevas entidades view model y coordinator, la mayor diferencia nos viene con el con el patrón de programación adherido a MVVM, ya que la comunicación entre el modelo y la view se reestructura como un data pipeline (conducto de datos).
 
 La programación reactiva construye este conducto de datos usando una serie de etapas de transformación. Esto puede parecer muy diferente a como acostumbramos a estructurar nuestra lógica usando los estamentos básicos de control de flujo de Swift (loops, condiciones, llamadas a métodos, etc.).
 
 
 ### Introducción rápida a la programación reactiva
 
 La programación reactiva es un patrón usado para describir flujos de datos entre productores y consumidores como una serie de transformaciónes. Los datos a través de nuestor flujo son tratados como una secuencia y transformados usando funciones.
 
 FRP nos pide que empecemos en el destino (donde nos suscribimos a nuestros datos) y andemos hacia atrás, a través de nuestras transformaciones, hacia nuestra fuente original de datos: los *observables*. Haciendo esto mantiene las tres partes del flujo de datos, los observables, las transformaciones y la suscripción, separados.
 
 Para nuestro ejemplo usaremos RxSwift, pero realmente cualquier librería de bindings nos serviría. Dicho esto, es importante que mencionemos algunos de los tipos de RxSwift:
 
 * El Observable es una secuencia de valores que podemos transformar, suscribirnos o *bindear* (atar su valor a otro valor) a un elemento de UI.
 * El PublishSubject es un Observable, pero al que podemos enviar valores, que serán emitidos a sus observadores.
 * El ReplaySubject es como un PublishSubject al que podemos empezar a enviar valores antes de que tenga ningún suscriptor, ya que cualquier nuevo suscriptor recibirá los valores emitidos previamente en la suscripción.
 * Un Variable es un *wrapper* alrededor de un valor *seteable* que ofrece una propiedad observable para que podamos observar el seteo de esta propiedad.
* El Disposable o el DisposableBag se usan para controlar el timepo de vida de nuestras suscripciones. Cuando un disposable se dealloca, o se le llama explicitamente a su método ```disposed```, la suscripción termina y todos los observables que fueran parte de ella se liberan de memoria.
 
 ## Construcción
 
 A diferencia de MVC, durante la construcción:
 
 * tenemos que construir el view model,
 * tendremos que establecer bindings entre la view y el view model,
 * el view model y no el controlador será propietario del modelo.
 * el coordinator pasa los valores iniciales de los modelos a el view model
 * el view model combina este valor inicial con otros valores y observaciones
 * el view models transforma estos datos al formato preciso requerido para la view
 * el view controller usa bindings para conectar estos valores preparados con sus views.
 
 ## Flujo: cambiando el modelo
 
 El flujo que se produce cuando queremos cambiar el modelo es el siguiente (ejemplo):
 
 * 1 un table view envía una acción de borrado de celda.
 * 2 el view controller cambia el view model.
 * 3 el view model cambia el modelo
 * 4 el view model observa cambios en el modelo
 * 5 el view controller observa cambios en el view model
 * 6 el view controller cambia y actualiza las views.
 
 ## Flujo: cambiando el estado de la view.
 
 (Igual pero el flujo da la vuelta sin llegar al modelo. El coordinator no participará nunca, a menos que se cambie la jerarquía de view controllers).
 
 
 
 */
