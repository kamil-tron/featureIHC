Feature: US014 - Buscar una dirección o zona
    Como usuario,
    Quiero buscar una dirección o zona en el mapa,
    Para ubicar fácilmente mi barrio o una zona de interés sin desplazarme manualmente.

Scenario Outline: Ir a una zona
    Dado que el <usuario> escribe una <ubicacion> en la barra de búsqueda
    When envíe la <consulta>
    Then la aplicación debe mover el <mapa> a esa <ubicacion>

    Examples: Datos de entrada
        | usuario | ubicacion | consulta |
        | "vecino@mail.com" | "Parque Kennedy, Miraflores" | "enter_o_btn_buscar" |

    Examples: Datos de salida
        | mapa | ubicacion  |
        | "Vista_Mapa_Actualizada" | "Centrado_en_Parque_Kennedy" |

Scenario Outline: Nueva búsqueda / limpiar
    Dado que el <usuario> borra el <texto> anterior o ingresa otro <texto>
    When confirme 
    Then el sistema debe actualizar el <mapa> con la <nueva_zona> buscada

    Examples: Datos de entrada (Nueva búsqueda)
        | usuario | texto  |
        | "vecino@mail.com" | "Plaza de Armas, Lima" |

    Examples: Datos de salida
        | mapa  | nueva_zona |
        | "Vista_Mapa_Actualizada" | "Centrado_en_Plaza_Armas_Lima" |