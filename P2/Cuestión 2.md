#### 2.1)

La instrucción que evalúa la condición y controla el flujo del programa es `beq`, pues en el caso en el que el valor almacenado en `$t1` sea igual 0, salta las dos instrucciones debajo de la etiqueta "entonces". De esta forma, estas dos sólo se ejecutan cuando **no** se cumple que `$t1` = 0, es decir, cuandop `$t1` != 0, tal como lo leemos en el if del pseudocódigo.

Dichas dos líneas precisamente se encargan de ejecutar lo que en el pseudocódigo vemos como la división entre `$t0` y `$t1`, primero realizándose la operación con la instrucción `div`, y luego almacenándose el resultado en `$t2` con la instrucción `mflo`.
Más allá de haberse ejecutado las instrucciones o no, según el resultado de evaluar la condición, las operaciones al final se realizan de cualquier forma. La diferencia está en que como deben de sumarse más de dos valores, en Assembly se requieren de dos instrucciones `add` que sumen primero `$t0` y `$t1`, y luego `$t2` a aquel resultado.

Finalmente debe de almacenarse el valor en memoria, por lo que aquello que en código sólo vemos como variables, requiere una instrucción final `sw` que guarde el valor en la posición de memoria "res".

#### 2.2)

La instrucción `beq` y el uso de etiquetas implementan la estructura condicional _if-then_. Esto lo podemos ver en cómo para `beq` en la etiqueta "Si", vimos ya que se evalúa la condición **inversa** a la cual se quiere ejecutar lo que le sigue a la etiqueta "entonces". Esto logra evitar estas instrucciones, saltando a la etiqueta "finsi" en el caso en que no se cumpla la condición.

Así, la instrucción `beq` (en la línea a la cual apunta la etiqueta "Si"), junto con las etiquetas "entonces" y "finsi", implementan la estructura _if-then_.

#### 2.3)

Tras ejecutar el programa, podemos comprobar que el valor almacenado en la variable "res" es **`0x47`**, o en decimal, **71**.

Esto lo podemos reafirmar observando el comportamiento del programa. Sabemos ya, que siempre se van a sumar al resultado a guardarse, los valores en `$t0` y `$t1`: "dato1" y "dato2". Por lo tanto, desde el vamos, el valor será al menos 40 + 30 = 70.

Luego, como 30 != 0, se almacena en `$t2` el resultado de la división floor(40 / 30) = 1.

Entonces, al sumar los 3 valores (los datos y el resultado de la división), 40 + 30 + 1 = 71, tal como lo vimos al ejecutar el programa.

#### 2.4)

En el caso en el que "dato2" = 0, la instrucción `beq` saltaría la división `$t0`/`$t1`, continuando por la etiqueta "finsi", y sólo se almacenaría la suma de "dato1" y "dato2" en la posición de memoria "res". Considerando que sabemos ya que "dato2" = 0, en la práctica el valor de "res" entonces sería directamente el mismo que el de "dato1".

A continuación, el diagrama de flujo correspondiente a la estructura de control implementada en el código:

<div align="center">
    <img src="diagrama2.png"></img>
</div>

#### 2.5)

Podemos ver que la única diferencia entre el pseudocódigo presentado en la [Cuestión 2.1)](#21) y la Cuestión actual, es la condición dentro del if. Por lo tanto, podemos modificar el programa en Assembly antes visto para poder acomodar a esta diferencia: reemplazamos la instrucción `beq` por `ble`, de forma que el salto que _evite_ la división, se haga **si** se cumple que `$t1` <= 0 ("dato2" <= 0).

Así, cuando la condición **no** se cumpla, será si `$t1` > 0, en este caso sí ejecutándose las instrucciones `div` y `mflo`, entonces cumpliendo con lo estipulado en el pseudocódigo.

Con esto en cuenta, el programa modificado resulta de la siguiente forma:

```assembly
            .data
dato1:      .word 40
dato2:      .word 30
res:        .space 4
            .text
main:       lw $t0, dato1($0)
            lw $t1, dato2($0)
            and $t2, $t2, $0
Si:         ble $t1, $0, finsi
entonces:   div $t0, $t1
            mflo $t2
finsi:      add $t3, $t0, $t1
            add $t2, $t3, $t2
            sw $t2, res($0)
```

#### 2.6)

<pre>
<b>VARIABLES</b>
    <b>ENTERO</b>: dato1=40; dato2=30; res;
<b>INICIO</b>
    <b>Si</b> (dato2 != 0)
        <b>Si</b> (dato1 != 0)
            res = dato1 / dato2;
    res = res + dato1 + dato2;
<b>FIN</b>
</pre>

#### 2.7)

Las instrucciones que, en este caso, evalúan la condición y controlan el flujo del programa, son las dos instruciones `beq` en las líneas siguientes a la etiqueta "Si". Ambas saltan a la etiqueta "finsi" si se da tanto que `$t1` = 0 ("dato1" = 0), o si `$t2` = 0 ("dato2" = 0), respectivamente.

De esta forma, las instrucciones que se encuentran a partir de la etiqueta "entonces", sólo se ejecutan si no se dan ninguna de las condiciones mencionadas. Esto se debe a que es necesario pasar ambas de largo (que no salten), para que se ejecuten las líneas siguientes a la etiqueta en cuestión, es decir, la división entre `$t0` y `$t1`. Para que suceda entonces, se tiene que dar que `$t1` != 0 **y** `$t2` != 0 (ambos datos con valores _distintos_ a 0).

En el pseudocódigo, estas instrucciones toman el rol de los dos _Si_ anidados que allí vemos.

Aclarar que más allá de que alguna de las condiciones se dé o no, las instrucciones partiendo desde la etiqueta "finsi" se ejecutarán incondicionalmente. Éstas se corresponden en el pseudocódigo de forma prácticamente idéntica a cómo fue descrito en la [Cuestión 2.1)](#21).

#### 2.8)

Con lo visto en la anterior Cuestión, podemos concluir que el conjunto de instrucciones que implementan la estructura condicional _if-then_ son las `beq` antes mencionadas, en conjunto con la etiqueta "finsi" (y opcionalmente, como punto de referencia pero sin un rol funcional, las etiquetas "Si" y "entonces").

Justamente, los `beq` cumplen la parte del _if_, mientras que lo que sigue a la etiqueta "entonces" cumple la parte del _then_. Además, "finsi" cumple el rol de delimitar las instrucciones por fuera del _if_, y proporcionar un punto de salto del cual continuar si las condiciones de la etiqueta "Si" **no** se cumplen.

A continuación, el diagrama de flujo del funcionamiento del programa, que demuestra la lógica detrás la estructura de control _if-then_ vista:

<div align="center">
    <img src="diagrama3.png"></img>
</div>

#### 2.9)

Al ejecutar el programa, vemos que de forma similar a la [Cuestión 2.1)](#21), se almacena el valor **`0x47`**, o en decimal, **71**.

Analizando el comportamiento del código, como también considerando el análisis previo del mismo, primero debemos tener en cuenta que siempre se suman los dos datos a lo que luego resulta en el valor de "res". Luego, sólo se le sumará también el valor de la división entre `$t0` y `$t1`, si es que tanto `$t0` _como_ `$t1` son **distintos** de cero (es decir, ambos datos son distintos de cero). Esto es porque, como ya dijimos, cuando ambos cumplan esta condición, las instrucciones `beq` no saltarán, y se ejecutarán las líneas siguientes a la etiqueta "entonces".

Esto lo diferencia del código visto en la Cuestión 2.1), en el cual se sumaba el resultado de la misma división, sólo si `$t1` != 0 ("dato2" != 0), sin restricciones sobre `$t0`.

Como tanto "dato1" y "dato2" son distintos de cero, se produce el mismo efecto visto en la Cuestión antes referenciada, almacenando el resultado de 40 + 30 + floor(40/30) = 70 + 1 = 71.

#### 2.10)

Probando correr el código con los valores indicados para "dato1" y "dato2", vemos que resulta en que el otro valor distinto sea almacenado en "res". Esto es muy similar a lo ya explicado en la [Cuestión 2.4)](#24).

En resumen, como sabemos que el valor de "res" contiene la suma de los dos datos, si alguno de ellos es igual a cero, en primera instancia implica que no va a afectar a la suma, efectivamente siendo equivalente a sumar directamente el otro número con un valor distinto de cero. Además de esto, dadas las condiciones establecidas para que se ejecute el código que le sigue a la etiqueta "entonces", si cualquiera de los datos es igual a cero, siquiera se suma el resultado de la división entre ellos, constribuyendo a que no haya ningún otro sumando para el valor a almacenar en "res".

De esta forma, si cualquiera de los datos tiene un valor = 0, el valor de "res" es igual al de la suma de los datos. Y sabiendo que al menos uno de los datos es 0, resulta prácticamente en copiar el valor del dato != 0. Por supuesto, si ambos datos fueran = 0, el valor de "res" también sería 0.

#### 2.11)

El programa descrito en pseudocódigo sólo se diferencia del ya visto en la [Cuestión 2.6](#26) por las condiciones en el if. Si bien en el caso citado usábamos dos ifs anidados para representar las dos condiciones, usar el operador lógico _and_ como lo es en este caso debería tener el mismo resultado. Por lo tanto, las diferencias yacen en la comparaciones que se hacen entre los datos y 0.

Mientras antes comparábamos por si los datos eran distintos de cero, ahora estas condiciones cambian. De todas formas, nos es relativamente sencillo cambiar las instrucciones para acomodar a estas discrepancias:

- Podemos cambiar la primera instrucción `beq` por `blt`, de forma que se salte cuando se cumpla que ("dato2" < 0). Es decir, **no** se saltaría (porque se cumple la condición deseada), si ("dato2" >= 0), según se lo describe en el pseudocódigo.
- También habría que cambiar la segunda instrucción `beq` por `ble`. En este caso, saltaría cuando se cumple que ("dato1" <= 0). Así, **no** se saltaría cuando ("dato1" > 0), tal como se indica en el pseudocódigo.

Con esto en cuenta, el código resultante es el siguiente:

```assembly
            .data
dato1:      .word 40
dato2:      .word 30
res:        .space 4
            .text
main:       lw $t0, dato1($0)
            lw $t1, dato2($0)
            and $t2, $t2, $0
Si:         blt $t1, $0, finsi
            ble $t0, $0, finsi
entonces:   div $t0, $t1
            mflo $t2
finsi:      add $t3, $t0, $t1
            add $t2, $t3, $t2
            sw $t2, res($0)
```

#### 2.12)

<pre>
<b>VARIABLES</b>
    <b>ENTERO</b>: dato1=30; dato2=40; res;
<b>INICIO</b>
    <b>Si</b> (dato1 < dato2)
        res = dato1;
    <b>Sino</b>
        res = dato2;
    <b>FinSi</b>
<b>FIN</b>
</pre>

#### 2.13)

Tras ejecutar el programa, el valor almacenado es "res" es **`0x1e`**, o en decimal, **30**.
En cambio, cuando "dato1" = 35, el valor almacenado en "res" es **`0x23`**, o en decimal, **35**.

Como podemos ver, en ambos casos se almacena el valor de "dato1" en la posición de memoria "res". Esto se debe a que, como ya vimos en el la Cuestión anterior, si "dato1" < "dato2", se almacena "dato1" en "res". Como tanto 30 < 40, y 35 < 40, entonces en ambos casos de guardó el valor de "dato1", dentro de la posición "res".

#### 2.14)

Analizando las instrucciones del panel de segmento de texto, tras haber ensamblado el programa, podemos identificar las instrucciones que implementan la pseudoinstrucción `bge`.

<div align="center">
    <img src="img1.png"></img>
</div>

Como se puede apreciar en la imagen, `bge` lo implementan las instrucciones `slt` y `beq`.

Primero, se almacena en el registro temporal del ensamblador `$at` (`$1`), el resultado de comprobar si (`$t0` < `$t1`). Luego, si este no es el caso, entonces claramente se cumple que (`$t0` >= `$t1`). Por lo tanto, con la instrucción `beq`, se verifica que el resultado de la comparación sea 0 (usando el registro `$0`), de forma tal que se salte a la etiqueta "sino", bajo la condición establecida por `bge`.

#### 2.15)

Debido a las diferencias entre el programa descrito y el código anteriormente visto, las modificaciones para adaptarlo al ejercicio son más significativas. Por lo tanto, nos tomaremos una mayor libertad para poder implementarlo:

```assembly
            .data
dato1:      .word 30
dato2:      .word 40
res:        .space 4
            .text
main:       lw $t0, dato1($0)
            lw $t1, dato2($0)
Si:         blt $t0, $t1, sino
entonces:   sub $t1, $0, $t1       # opposite of dato1
            j finsi
sino:       sub $t0, $0, $t0       # opposite of dato2
finsi:      add $t0, $t0, $t1
            sw $t0, res($0)
```

En resumen, primero debemos modificar la comparación del "Si", usando la instrucción `blt` que saltará cuando "dato1" < "dato2", es decir, el "entonces" se ejecutará cuando "dato1" >= "dato2".

Luego, como debemos almacenar la resta entre los números, podemos obtener el opuesto del número que reste en cada caso haciendo la cuenta 0 - "datoX" con la instrucción `sub`. Así, sumarlos luego con la instrucción `add` es equivalente a guardar la resta entre los datos, según corresponda.

#### 2.16)

<pre>
<b>VARIABLES</b>
    <b>ENTERO</b>: dato1=30; dato2=40; dato3=-1; res;
<b>INICIO</b>
    <b>Si</b> ((dato3 < dato1) or (dato3 > dato2))
        res = 1;
    <b>Sino</b>
        res = 0;
    <b>FinSi</b>
<b>FIN</b>
</pre>
