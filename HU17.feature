Feature: US017 - Búsqueda de incidentes por nombre o palabra clave
    Como usuario,
    Quiero buscar incidentes por nombre o palabra clave,
    Para encontrar rápidamente reportes específicos dentro de mi zona.

Scenario Outline: Resultados por palabra clave
    Dado que el <usuario> escribe en el cuadro de búsqueda
    When ingrese una <palabra_clave> y confirme la búsqueda
    Then el sistema debe mostrar los <resultados> que coinciden

    Examples: Datos de entrada
        | usuario | palabra_clave |
        | "vecino@mail.com" | "Robo" |
        | "vecino@mail.com" | "Perro" |

    Examples: Datos de salida 
        | resultados |
        | "[Reporte_Robo_1, Reporte_Robo_2]" |
        | "[Reporte_Perro_Perdido_5]" |

Scenario Outline: Limpiar búsqueda
    Dado que el <usuario> elimina el <texto> del cuadro de búsqueda
    When el campo queda vacío
    Then el sistema debe volver a mostrar la <lista> completa 

    Examples: Datos de entrada
        | usuario | texto |
        | "vecino@mail.com" | "" |

    Examples: Datos de salida
        | lista |
        | "[Reporte_Robo_1, Reporte_Robo_2, Reporte_Perro_Perdido_5, ...]" |