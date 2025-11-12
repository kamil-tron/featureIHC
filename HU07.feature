Feature: US07 - Anclar mensajes en el chat
    Como administrador de un grupo vecinal,
    Quiero anclar mensajes importantes en el chat,
    Para que todos los vecinos puedan revisarlos fácilmente.

Scenario Outline: Anclar un mensaje
    Dado que el <administrador> mantiene presionado un <mensaje>
    When seleccione la opción <Anclar>
    Then el <mensaje> debe quedar <destacado> arriba del chat

    Examples: Datos de entrada
        | administrador | mensaje | Anclar |
        | "admin@vecinos.com" | "MsgID_456: Junta General 8pm" | "opcion_anclar" |

    Examples: Datos de salida
        | destacado |
        | "Banner_Anclado: MsgID_456" |

Scenario Outline: Ver mensaje anclado
    Dado que el <usuario> abre el <chat>
    When exista un <mensaje anclado>
    Then la aplicación debe mostrarlo arriba como <destacado>

    Examples: Datos de entrada
        | usuario | chat | mensaje anclado |
        | "vecino@mail.com" | "Chat Zona 5" | "MsgID_456" |

    Examples: Datos de salida
        | destacado |
        | "Banner_Anclado: 'Junta General 8pm'" |

Scenario Outline: Ir al mensaje original desde el anclado
    Dado que el <usuario> presiona el <destacado> 
    When lo seleccione
    Then el sistema debe llevarlo al <mensaje original> en el historial

    Examples: Datos de entrada
        | usuario | destacado |
        | "vecino@mail.com" | "Banner_Anclado: MsgID_456" |

    Examples: Datos de salida
        | mensaje original |
        | "focus_en_MsgID_456_en_historial" |