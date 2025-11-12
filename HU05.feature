Feature: US05 - Opción de encuestas vecinales
    Como usuario,
    Quiero participar en encuestas comunitarias,
    Para que podamos decidir prioridades en seguridad y mejoras vecinales.

Scenario Outline: Responder encuesta
    Dado que el <usuario> abre la sección de <encuestas>
    When seleccione una <encuesta activa> y marca su <opcion>
    Then la aplicación debe registrar el <voto>

    Examples: Datos de entrada
        | usuario | encuestas | encuesta activa | opcion |
        | "vecino@mail.com" | "/seccion/encuestas" | "Encuesta_001_Prioridad" | "Más patrullaje" |

    Examples: Datos de salida
        | voto |
        | "Voto_Registrado_ID_XYZ" |

Scenario Outline: Ver resultados
    Dado que el <usuario> ya votó
    When finalice la <encuesta activa> o consulte su estado
    Then el sistema debe mostrar <resultados> en tiempo real o finales

    Examples: Datos de entrada
        | usuario | encuesta activa |
        | "vecino@mail.com" | "Encuesta_001_Prioridad" |

    Examples: Datos de salida
        | resultados |
        | "{'Más patrullaje': 150, 'Cámaras': 80, 'Alarmas': 45}" |