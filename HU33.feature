Feature: US033W05 - Ver capas en el mapa web
    Como usuario,
    Quiero ver las diferentes capas del mapa dependiendo de mi gusto (mapa de límites vecinales, estaciones de policía, mapa de calor de incidentes, cámaras de seguridad),
    Para poder ver de forma visual dónde queda cada cosa y agregar por capas.

Scenario Outline: Activar capas
    Dado que el <usuario> abre el mapa en la aplicación web
    When marque las <capas_seleccionadas>
    Then la aplicación web debe mostrar las <capas_visibles> superpuestas

    Examples: Datos de entrada
        | usuario | capas_seleccionadas |
        | "vecino@mail.com" | "[Límites vecinales, Estaciones de policía]" |

    Examples: Datos de salida
        | capas_visibles |
        | "[Límites vecinales, Estaciones de policía]" |

Scenario Outline: Mapa de calor filtrado
    Dado que el <usuario> activa la capa <capa>
    When aplique un <filtro_fechas> y un <filtro_tipo_incidente>
    Then el sistema debe actualizar el <mapa_de_calor> según el filtro aplicado

    Examples: Datos de entrada
        | usuario | capa | filtro_fechas | filtro_tipo_incidente |
        | "vecino@mail.com" | "Mapa de calor" | "01/11/2025 - 10/11/2025" | "Robo" |

    Examples: Datos de salida
        | mapa_de_calor |
        | "Heatmap actualizado con incidentes tipo 'Robo' del 01 al 10/11/2025" |
