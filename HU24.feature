Feature: US024 - Recibir notificaciones de nuevos incidentes
    Como usuario,
    Quiero recibir notificaciones cuando se reporten incidentes cerca,
    Para mantenerme informado y tomar precauciones oportunas.

Scenario Outline: Notificación en tiempo real
    Dado que se registra un <nuevo_reporte> en la <zona_usuario>
    When el sistema procese el evento
    Then la aplicación debe enviar una <notificacion_push> al usuario

    Examples: Datos de entrada
        | nuevo_reporte | zona_usuario |
        | "Incendio en Av. Grau" | "Miraflores" |
        | "Robo de vehículo" | "Barranco" |

    Examples: Datos de salida
        | notificacion_push |
        | "Alerta: Incendio en Av. Grau, Miraflores" |
        | "Alerta: Robo de vehículo en Barranco" |

Scenario Outline: Abrir desde la notificación
    Dado que el <usuario> toca la <notificacion>
    When se abra la app
    Then el sistema debe redirigir al <detalle_incidente>

    Examples: Datos de entrada
        | usuario | notificacion |
        | "vecino@mail.com" | "Alerta: Robo de vehículo en Barranco" |

    Examples: Datos de salida
        | detalle_incidente |
        | "Pantalla_Detalle_Incidente_ID_Reporte_455" |
