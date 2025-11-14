Feature: US021 - Ver perfil del usuario
    Como usuario,
    Quiero acceder a mi perfil,
    Para ver y gestionar mi información personal y mi historial de reportes.

Scenario Outline: Ver datos de perfil
    Dado que el <usuario> toca el ícono de perfil
    When se abra la <pantalla_perfil>
    Then la aplicación debe mostrar el <nombre>, <foto> y <datos_basicos> del usuario autenticado

    Examples: Datos de entrada
        | usuario | pantalla_perfil |
        | "vecino@mail.com" | "Perfil" |

    Examples: Datos de salida
        | nombre | foto | datos_basicos |
        | "Juan Pérez" | "juan_perfil.jpg" | "Dirección, correo, teléfono" |

Scenario Outline: Ver historial de reportes
    Dado que el <usuario> tiene <reportes_registrados>
    When entre a su perfil
    Then el sistema debe listar sus <reportes> anteriores con <fecha> y <estado>

    Examples: Datos de entrada
        | usuario | reportes_registrados |
        | "vecino@mail.com" | true |

    Examples: Datos de salida
        | reportes |
        | "[Rep_301: 'Robo', 12/11/2025, 'Resuelto'; Rep_302: 'Incendio', 05/11/2025, 'En curso']" |