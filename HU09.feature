Feature: US09 - Reacciones a mensajes
    Como usuario,
    Quiero reaccionar a los mensajes del chat,
    Para expresar mi opinión rápidamente sin escribir un mensaje nuevo.

Scenario Outline: Añadir reacción
    Dado que el <usuario> mantiene presionado un <mensaje>
    When seleccione una <reaccion> del menú emergente
    Then el sistema debe mostrar la <reaccion> debajo del <mensaje>

    Examples: Datos de entrada
        | usuario | mensaje | reaccion |
        | "user_A@mail.com" | "MsgID_789" | "👍" |
        | "user_B@mail.com" | "MsgID_789" | "😂" |

    Examples: Datos de salida (lo que se ve en el mensaje)
        | mensaje | reaccion (mostrada) |
        | "MsgID_789" | ["👍"] |
        | "MsgID_789" | ["👍", "😂"] |

Scenario Outline: Contar reacciones
    Dado que varios <usuarios> reaccionan al mismo <mensaje>
    When otro <usuario> revise el <mensaje>
    Then la aplicación debe mostrar el total de <reacciones> por <mensaje>

    Examples: Datos de entrada
        | mensaje | usuarios | reacciones (totales) |
        | "MsgID_ABC" | ["user_A", "user_B", "user_C"] | {"👍": 2, "😂": 1} |

    Examples: Datos de salida 
        | mensaje | reacciones (conteo mostrado) |
        | "MsgID_ABC" | "[ 👍 2 ] [ 😂 1 ]" |