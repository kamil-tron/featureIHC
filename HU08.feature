Feature: US08 - Menciones en el chat
    Como usuario,
    Quiero poder mencionar a un vecino con @nombre en el chat,
    Para poder llamar su atención.

Scenario Outline: Enviar mención
    Dado que el <usuario> escribe <@> seguido del <nombre> en el <chat>
    When envía el <mensaje>
    Then la aplicación debe <resaltar> la mención y <notificar> al mencionado

    Examples: Datos de entrada
        | usuario | chat | @ | nombre | mensaje |
        | "vecino_A@mail.com" | "Chat General" | "@" | "vecino_B" | "Hola @vecino_B, reunión 1pm" |

    Examples: Datos de salida
        | resaltar (en el chat) | notificacion (para vecino_B) |
        | "Estilo_Mencion: @vecino_B" | "Alerta: 'vecino_A te mencionó...'" |

Scenario Outline: Ubicar la mención
    Dado que el <usuario> (mencionado) abre el <chat>
    When visualice la conversación
    Then el sistema debe destacar el <mensaje> donde fue mencionado para rápida identificación

    Examples: Datos de entrada (Quien recibe)
        | usuario | chat |
        | "vecino_B@mail.com" | "Chat General" |

    Examples: Datos de salida (Lo que ve)
        | mensaje | (Estado visual) |
        | "MsgID_123: Hola @vecino_B, reunión 1pm" | "background_destacado" |