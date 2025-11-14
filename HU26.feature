Feature: US026 - Visualizar cantidad de personas que reportaron un incidente
    Como usuario,
    Quiero saber cuántas personas reportaron el mismo incidente,
    Para entender la magnitud o relevancia del evento en mi comunidad.

Scenario Outline: Ver conteo en reporte agrupado
    Dado que el <usuario> visualiza un <reporte_agrupado>
    When abra el <detalle_incidente>
    Then la aplicación debe mostrar el <conteo_total> de reportes que lo conforman y las fechas del primer y último reporte

    Examples: Datos de entrada
        | usuario | reporte_agrupado | detalle_incidente |
        | "vecino@mail.com" | "Inc_350" | "Detalle" |

    Examples: Datos de salida
        | conteo_total | primer_reporte | ultimo_reporte |
        | 5 | "10/11/2025 08:10" | "10/11/2025 14:35" |

Scenario Outline: Ver listado de reportantes (según permisos)
    Dado que el <usuario> selecciona el <conteo> de reportes en un <reporte_agrupado>
    When toque el <numero> correspondiente
    Then la aplicación debe mostrar la <lista_reportantes> según los permisos de privacidad

    Examples: Datos de entrada
        | usuario | reporte_agrupado | conteo | numero |
        | "vecino@mail.com" | "Inc_350" | 5 | "5" |
        | "anonimo@mail.com" | "Inc_350" | 5 | "5" |

    Examples: Datos de salida
        | lista_reportantes |
        | "[JuanP, Carla_22, Vecino_Norte, Usuario_004, Usuario_005]" |
        | "[Usuario_001, Usuario_002, Usuario_003, Usuario_004, Usuario_005]" |
