Feature: HU01 - Visualización de reportes en el mapa
    Como usuario,
    Quiero visualizar en un mapa los reportes de mi zona,
    Para poder identificar los problemas de mi comunidad en tiempo real

Scenario Outline: Visualización inicial de reportes
    Dado que el <usuario> ha iniciado sesión en la plataforma
    Cuando el <usuario> accede a la sección de <mapa>
    Entonces el sistema le muestra al <usuario> los <reportes activos> en su zona en tiempo real

    Examples: Datos de entrada
        | usuario | mapa |
        | ThekingOfDarkness43@gmail.com | /seccion/mapa |

    Examples: Datos de salida
        | reportes activos |
        | [ReporteID_A, ReporteID_B, ReporteID_C] |

Scenario Outline: Filtro de reportes
    Dado que el <usuario> está en la sección de <mapa> visualizando los reportes activos
    When el <usuario> selecciona la sección de <Menu de filtros> y selecciona un <Tipo de incidente>
    Then el sistema actualiza el <mapa> para mostrar únicamente los <Reportes filtrados> que corresponden al <Tipo de incidente> seleccionado

    Examples: Datos de entrada
        | usuario | mapa | Menu de filtros | Tipo de incidente |
        | pedropascal23@gmail.com | /seccion/mapa | boton_filtros | "Robo" |
        | SanMiguelUPC@gmail.com | /seccion/mapa | boton_filtros | "Accidente" |
        | ThekingOfDarkness43@gmail.com | /seccion/mapa | boton_filtros | "Incendio" |

    Examples: Datos de salida
        | Reportes filtrados |
        | [ReporteID_Robo_1, ReporteID_Robo_2] |
        | [ReporteID_Accidente_1] |
        | [ReporteID_Incendio_1] |