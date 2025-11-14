Feature: US019 - Ver informe grupal de incidentes
    Como miembro de la junta vecinal,
    Quiero visualizar los incidentes agrupados en un informe,
    Para revisar los reportes combinados de un mismo evento comunitario.

Scenario Outline: Generar informe
    Dado que varios <usuarios> reportaron el mismo <evento>
    When se agrupen los <reportes>
    Then el sistema debe crear un <informe> con información consolidada

    Examples: Datos de entrada
        | usuarios | evento | reportes |
        | "[usuario1@mail.com, usuario2@mail.com]" | "Incendio en parque" | "[Rep_101, Rep_102, Rep_103]" |

    Examples: Datos de salida
        | informe |
        | "Informe_Grupo_01 con resumen, ubicación, rango temporal y enlaces a cada reporte" |

Scenario Outline: Navegar reportes del grupo
    Dado que el <usuario> abre el <informe_grupal>
    When lo revise
    Then la aplicación debe permitir visualizar los <reportes_individuales> que forman parte del grupo

    Examples: Datos de entrada
        | usuario | informe_grupal |
        | "junta@mail.com" | "Informe_Grupo_01" |

    Examples: Datos de salida
        | reportes_individuales |
        | "[Rep_101, Rep_102, Rep_103]" |
