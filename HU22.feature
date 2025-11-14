Feature: US022 - Configurar visibilidad de datos personales
    Como usuario,
    Quiero decidir qué información personal o del hogar mostrar públicamente,
    Para proteger mi privacidad dentro de la comunidad.

Scenario Outline: Ver opciones de privacidad
    Dado que el <usuario> ingresa a <Configuracion>
    When seleccione <Privacidad>
    Then la aplicación debe mostrar las <opciones_visibilidad> disponibles

    Examples: Datos de entrada
        | usuario | Configuracion | Privacidad |
        | "vecino@mail.com" | "Menú Ajustes"| "Sección Privacidad" |

    Examples: Datos de salida
        | opciones_visibilidad |
        | "[Mostrar nombre, Mostrar dirección aproximada, Ocultar teléfono]" |

Scenario Outline: Guardar visibilidad
    Dado que el <usuario> modifique su <configuracion_privacidad>
    When toque <Guardar_cambios>
    Then el sistema debe aplicar la nueva visibilidad de inmediato en su <perfil_publico>

    Examples: Datos de entrada
        | usuario | configuracion_privacidad |
        | "vecino@mail.com" | "{nombre: visible, direccion: visible, telefono: oculto}" |

    Examples: Datos de salida
        | perfil_publico_actualizado |
        | "{nombre: visible, direccion: visible, telefono: oculto}" |