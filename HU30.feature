Feature: US030 - Botón de pánico
    Como vecino,
    Quiero una opción de botón de pánico que mande una señal de alerta con mi información (ubicación actual, nivel de batería, última ubicación),
    Para pedir auxilio cuando lo necesite a mis contactos de confianza.

Scenario Outline: Envío de alerta
    Dado que el <vecino> activa el <boton_panico>
    When presione el <modo_activacion> (virtual o físico)
    Then el sistema debe enviar una <alerta> a los <contactos_emergencia> asignados

    Examples: Datos de entrada
        | vecino | boton_panico | modo_activacion | ubicacion_actual | ultima_ubicacion | nivel_bateria | contactos_emergencia |
        | "vecino@mail.com" | "btn_panico" | "virtual" | "-12.05, -77.03"   | "-12.04, -77.02" | "85%" | "[Juan, María]" |
        | "vecino@mail.com" | "btn_panico" | "fisico" | "-12.06, -77.01" | "-12.05, -77.03" | "60%" | "[Juan, María]" |

    Examples: Datos de salida
        | alerta_enviada | mensaje_confirmacion | log_evento |
        | true | "Alerta enviada a contactos" | "12/11/2025 14:30 - Alerta enviada a [Juan, María]" |
        | true | "Alerta enviada a contactos" | "12/11/2025 14:31 - Alerta enviada a [Juan, María]" |

Scenario Outline: Cancelación por error
    Dado que el <vecino> presionó el <boton_panico> por accidente
    When presione <cancelar> dentro de los <segundos_cancelacion>
    Then la aplicación debe abortar el envío de la <alerta>

    Examples: Datos de entrada
        | vecino | boton_panico | cancelar | segundos_cancelacion |
        | "vecino@mail.com" | "btn_panico" | "Sí" | 5 |

    Examples: Datos de salida
        | alerta_enviada | mensaje_sistema | log_evento |
        | false | "Envío cancelado correctamente" | "12/11/2025 14:32 - Vecino canceló alerta antes del envío" |
