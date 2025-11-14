 Feature: US035W07 - Panel de estadísticas de incidentes
    Como administrador,
    Quiero visualizar gráficos y estadísticas de incidentes en mi comunidad,
    Para analizar tendencias y tomar mejores decisiones de seguridad.

Scenario Outline: Visualización general de estadísticas
    Dado que el <usuario> accede al <panel_web>
    When selecciona la opción de <estadisticas>
    Then el sistema muestra <graficos> de incidentes por <tipo> y <fecha> de <ubicacion>

    Examples: Datos de entrada
        | usuario | panel_web | estadisticas |
        | "admin@mail.com" | "Panel_Admin" | "Estadísticas" |

    Examples: Datos de salida
        | graficos | tipo | fecha | ubicacion |
        | "[Grafico_Barras, Grafico_Lineas]" | "Robo, Accidente, Incendio" | "01/11/2025-10/11/2025" | "Comunidad_A" |

Scenario Outline: Actualización con filtros
    Dado que el <usuario> aplica <filtros> en el panel
    When cambia los <criterios> de búsqueda
    Then los <graficos> deben actualizarse en tiempo real mostrando los <nuevos_datos>

    Examples: Datos de entrada
        | usuario | filtros | criterios |
        | "admin@mail.com" | "tipo=Robo; fecha=últimos_7_días"| "fecha" |

    Examples: Datos de salida
        | graficos_actualizados | nuevos_datos |
        | "[Grafico_Barras_Actualizado, Grafico_Lineas]"| "[Robo_11, Robo_12, Robo_13]" |