Feature: US03 - Notificaciones de mensajes nuevos
    Como usuario,
    Quiero recibir notificaciones cuando haya nuevos mensajes en mi chat vecinal,
    Para que no me pierda información importante.

Scenario Outline: Recepción de notificación
    Dado que el <usuario> forma parte de un <grupo>
    When otro <vecino> envía un <mensaje>
    Then el sistema envía una <notificacion> al <usuario>

    Examples: Datos de entrada
        | usuario | grupo | vecino | mensaje |
        | "usuario_A@vecinos.com" | "Chat Zona 5" | "usuario_B@vecinos.com" | "Reunión hoy 7pm" |

    Examples: Datos de salida
        | notificacion |
        | "Alerta: Nuevo mensaje en 'Chat Zona 5'" |

Scenario Outline: Acceso al chat desde la notificación
    Dado que el <usuario> abre la app desde la <notificacion>
    When accede al <chat>
    Then el <mensaje nuevo> aparece resaltado

    Examples: Datos de entrada
        | usuario | notificacion | chat |
        | "usuario_A@vecinos.com" | "NotificacionID_123" | "Chat Zona 5" |

    Examples: Datos de salida
        | mensaje nuevo |
        | "MensajeID_ABC" |