Feature: US016 - Ver listado de incidentes en mi zona
    Como usuario,
    Quiero ver un listado de los incidentes de mi zona,
    Para estar al tanto de la actividad reciente.

Scenario Outline: Carga inicial de lista
    Dado que el <usuario> accede a la sección de <incidentes>
    When se cargue la <lista>
    Then la aplicación debe ordenarla del más reciente al más antiguo

    Examples: Datos de entrada
        | usuario | incidentes (sección) |
        | "vecino@mail.com" | "/incidentes/lista" |

    Examples: Datos de salida
        | lista (ordenada) |
        | "[Reporte_Reciente, Reporte_Medio, Reporte_Antiguo]" |

Scenario Outline: Carga progresiva 
    Dado que existen varios <reportes> 
    When el <usuario> <desplace> hacia abajo 
    Then el sistema debe cargar más <reportes> conforme avanza

    Examples: Datos de entrada
        | usuario | desplace | reportes (actuales) |
        | "vecino@mail.com" | "scroll_down_end" | "[Item_1...Item_20]" |

    Examples: Datos de salida
        | reportes (cargados) |
        | "[Item_21...Item_40]" |