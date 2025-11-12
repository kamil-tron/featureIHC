Feature: US010 - Ver advertencias o alertas en el mapa
    Como usuario,
    Quiero visualizar advertencias o alertas visuales en el mapa,
    Para estar informado sobre incidentes recientes o peligros cerca de mi zona.

Scenario Outline: Cargar alertas en mapa
    Dado que existen <incidentes> recientes
    When el <usuario> abra el <mapa>
    Then la aplicación debe mostrar <notificaciones visuales> en las zonas afectadas

    Examples: Datos de entrada
        | usuario | mapa | incidentes |
        | "vecino@mail.com" | "/seccion/mapa" | ["ID_Incidente_Robo_001", "ID_Incidente_Sospecha_002"] |

    Examples: Datos de salida
        | notificaciones visuales |
        | ["Icono_Alerta_Robo_Zona_A", "Icono_Alerta_Sospecha_Zona_B"] |

Scenario Outline: Ver resumen de alerta
    Dado que el <usuario> selecciona un <incidente> en el mapa
    When toque el <icono>
    Then la aplicación debe mostrar un <resumen> del incidente

    Examples: Datos de entrada
        | usuario | icono (del incidente) |
        | "vecino@mail.com" | "Icono_Alerta_Robo_Zona_A" |

    Examples: Datos de salida
        | resumen |
        | "Popup: 'Robo reportado hace 5 min. - Calle Sol 123'" |