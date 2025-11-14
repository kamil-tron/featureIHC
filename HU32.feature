Feature: US032W04 - Creación de eventos (reuniones) web
    Como administrador,
    Quiero poder crear eventos o reuniones comunitarias, indicando título, fecha, hora, descripción y lugar en el mapa,
    Para coordinar con otros vecinos y fortalecer la organización del vecindario.

Scenario Outline: Crear evento
    Dado que el <administrador> accede a la opción <crear_evento>
    When ingrese <titulo>, <descripcion>, <fecha_hora> y <lugar_mapa> y toque <guardar>
    Then la aplicación web debe publicar el evento en la sección de <proximos_eventos> y notificar al grupo

    Examples: Datos de entrada
        | administrador | crear_evento | titulo | descripcion | fecha_hora | lugar_mapa | guardar |
        | "admin@vecindario.pe" | "Crear evento" | "Reunión de seguridad" | "Revisión de medidas y patrullas" | "15/11/2025 18:00" | "-12.08, -77.03 (Parque)" | "Guardar" |

    Examples: Datos de salida
        | proximos_eventos | notificacion_grupo |
        | "[Reunión de seguridad]" | "Notificación enviada al grupo" |

Scenario Outline: Ver confirmaciones
    Dado que el <evento> fue creado correctamente
    When el <administrador> abra la vista <ver_info_evento>
    Then el sistema debe mostrar la lista de <confirmaciones> de los vecinos con sus respuestas

    Examples: Datos de entrada
        | administrador | evento | ver_info_evento |
        | "admin@vecindario.pe" | "Reunión de seguridad" | "Ver info evento" |

    Examples: Datos de salida
        | confirmaciones |
        | "[Juan: Asistiré, María: Tal vez, Pedro: No asistiré]" |
