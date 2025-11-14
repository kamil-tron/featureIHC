Feature: US031 - Configuración de botón de pánico
    Como vecino,
    Quiero poder configurar mi botón de pánico y seleccionar mis contactos de confianza y modificar de qué manera activarlo,
    Para tener una mejor personalización de mi botón de pánico y poder actualizar mis contactos.

Scenario Outline: Guardar configuración
    Dado que el <vecino> ingresa a la sección de <configuracion>
    When cambie <contactos> o el <metodo_activacion> y toque <guardar>
    Then la aplicación debe aplicar la modificación y confirmarla, validando que exista al menos un contacto

    Examples: Datos de entrada
        | vecino | configuracion | contactos | metodo_activacion | guardar |
        | "vecino@mail.com" | "Botón de pánico" | "[987654321, 999888777]" | "Presionar 4 veces botón de apagado" | "Guardar" |

    Examples: Datos de salida
        | confirmacion_mensaje | contactos_guardados | metodo_guardado |
        | "Configuración guardada con éxito." | "[987654321, 999888777]" | "Presionar 4 veces botón de apagado" |

Scenario Outline: Persistencia al reinicio
    Dado que los <ajustes> del <boton_panico> fueron guardados
    When el <vecino> cierre y reabra la aplicación
    Then el sistema debe mantener activos los <ajustes>

    Examples: Datos de entrada
        | vecino | boton_panico | ajustes |
        | "vecino@mail.com" | "Botón de pánico" | "{contactos: [987654321], metodo: '4x apagado'}" |

    Examples: Datos de salida
        | ajustes_mantenidos |
        | "{contactos: [987654321], metodo: '4x apagado'}" |

