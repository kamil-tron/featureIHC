Feature: US027 - Agrupar reportes similares de un mismo incidente
    Como usuario con rol importante en la junta vecinal,
    Quiero identificar y agrupar reportes duplicados o similares de un mismo incidente,
    Para consolidar la información en un solo informe grupal con resumen y acceso a los reportes individuales adjuntos.

Scenario Outline: Crear informe grupal
    Dado que existen varios <reportes> del mismo evento
    When el <usuario> con rol importante los seleccione y elija la acción <agrupar>
    Then el sistema debe crear un <informe_grupal> que contenga los reportes seleccionados con sus datos originales

    Examples: Datos de entrada
        | usuario | reportes | agrupar |
        | "lider@mail.com" | "[Rep_101, Rep_102, Rep_103]" | "Agrupar" |

    Examples: Datos de salida
        | informe_grupal |
        | "Informe_001: Título='Robo en Av. X', Ubicación='-12.05,-77.05', Rango='19:00-21:00', Resumen='3 reportes similares', Total=3" |

Scenario Outline: Revisar informe grupal
    Dado que el <informe_grupal> ya fue creado
    When un <usuario_autorizado> lo abra
    Then la aplicación debe mostrar el <resumen_consolidado> y el acceso a cada <reporte_individual> con fotos, videos y descripciones

    Examples: Datos de entrada
        | usuario_autorizado | informe_grupal |
        | "moderador@mail.com" | "Informe_001" |

    Examples: Datos de salida
        | resumen_consolidado | reporte_individual |
        | "3 reportes consolidados sobre el mismo evento" | "[Rep_101, Rep_102, Rep_103]" |
