Feature: US04 - Chat vecinal
    Como usuario,
    Quiero acceder a un chat con mis vecinos,
    Para poder coordinar acciones y compartir información de seguridad.

Scenario Outline: Acceder al chat
    Dado que el <usuario> abre la sección de <chat>
    When seleccione su <grupo vecinal>
    Then la aplicación debe permitir <enviar mensaje> y ver <mensaje recibido> en tiempo real

    Examples: Datos de entrada
        | usuario | chat | grupo vecinal | enviar mensaje |
        | "user_A@vecinos.com" | "/seccion/chat" | "Grupo Zona 5" | "Hola, ¿todo bien?" |

    Examples: Datos de salida
        | mensaje recibido |
        | "Todo bien por aquí, user_A" |

Scenario Outline: Adjuntar imagen
    Dado que el <usuario> está en el <chat>
    When toque <Adjuntar> y seleccione una <imagen>
    Then el sistema debe enviarla y mostrarla en la <conversacion>

    Examples: Datos de entrada
        | usuario | chat | Adjuntar | imagen |
        | "user_A@vecinos.com" | "Grupo Zona 5" | "boton_adjuntar" | "auto_sospechoso.png" |

    Examples: Datos de salida
        | conversacion |
        | "Chat actualizado mostrando 'auto_sospechoso.png'" |