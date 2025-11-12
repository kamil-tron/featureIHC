Feature: US02 - Filtro por tipo de incidente
    Como usuario,
    Quiero filtrar los reportes en el mapa por tipo de incidente,
    Para poder visualizar únicamente los que me interesan.

Scenario Outline: Aplicar filtro por un tipo de incidente
    Dado que el <usuario> está en la sección de <listado de incidentes> visualizando los <reportes activos>
    When el <usuario> selecciona un <Tipo de incidente> específico en el <Menu de filtros>
    Then el sistema actualiza el <listado de incidentes> para mostrar únicamente los <Reportes filtrados> que corresponden al <Tipo de incidente> seleccionado

    Examples: Datos de entrada
        | usuario | listado de incidentes | Menu de filtros | Tipo de incidente | reportes activos |
        | user@example.com | /incidentes/lista | seccion_filtros | "Robo" | [Reporte_A, Reporte_B, Reporte_C] |
        | user@example.com | /incidentes/lista | seccion_filtros | "Incendio" | [Reporte_A, Reporte_B, Reporte_C] |

    Examples: Datos de salida 
        | Reportes filtrados |
        | [Reporte_A] |
        | [Reporte_C] |

Scenario Outline: Quitar filtros
    Dado que el <usuario> está en la sección de <listado de incidentes> visualizando <Reportes filtrados>
    When el <usuario> selecciona la opción de <quitar filtros>
    Then el sistema actualiza el <listado de incidentes> para mostrar nuevamente todos los <reportes activos>

    Examples: Datos de entrada
        | usuario | listado de incidentes | Reportes filtrados | quitar filtros |
        | user@example.com | /incidentes/lista | [Reporte_A] | boton_quitar_filtro |

    Examples: Datos de salida 
        | reportes activos |
        | [Reporte_A, Reporte_B, Reporte_C] |