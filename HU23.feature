Feature: US023 - Cambiar ajustes generales de la aplicación
    Como usuario,
    Quiero modificar los ajustes generales de la app,
    Para personalizar mi experiencia de uso según mis preferencias.

Scenario Outline: Aplicar ajuste
    Dado que el <usuario> accede a la sección de <configuracion>
    When cambie un <ajuste> con el valor <nuevo_valor>
    Then la aplicación debe aplicar la modificación inmediatamente

    Examples: Datos de entrada
        | usuario | configuracion | ajuste | nuevo_valor |
        | "vecino@mail.com" | "Configuración" | "tema" | "oscuro" |
        | "vecino@mail.com" | "Configuración" | "idioma" | "inglés" |
        | "vecino@mail.com" | "Configuración" | "alertas"| "desactivadas" |

    Examples: Datos de salida
        | cambio_aplicado | interfaz_actualizada |
        | true | "Tema oscuro activo" |
        | true | "Idioma cambiado a inglés" |
        | true | "Alertas desactivadas" |

Scenario Outline: Persistencia de ajustes
    Dado que los <ajustes> han sido guardados
    When el <usuario> cierre y vuelva a abrir la app
    Then el sistema debe mantener los <ajustes> activos

    Examples: Datos de entrada
        | usuario | ajustes |
        | "vecino@mail.com" | "{tema: oscuro, idioma: inglés, alertas: desactivadas}" |

    Examples: Datos de salida
        | ajustes_activos |
        | "{tema: oscuro, idioma: inglés, alertas: desactivadas}" |
