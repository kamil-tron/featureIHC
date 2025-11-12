Feature: US012 - Adjuntar fotos o videos en un reporte
    Como usuario,
    Quiero adjuntar imágenes o videos al crear un reporte,
    Para evidenciar el incidente ocurrido y facilitar su verificación.

Scenario Outline: Adjuntar archivo
    Dado que el <usuario> está registrando un <incidente> 
    When seleccione <Adjuntar_archivo>
    Then la aplicación debe mostrar opciones para tomar <foto> o subir <video>

    Examples: Datos de entrada
        | usuario | incidente | Adjuntar_archivo |
        | "vecino@mail.com" | "Formulario_Reporte_En_Curso" | "boton_adjuntar" |

    Examples: Datos de salida (Las opciones que se le presentan)
        | foto | video |
        | "opcion_tomar_foto" | "opcion_subir_video_galeria" |

Scenario Outline: Confirmar con evidencia
    Dado que el <archivo> se adjuntó correctamente
    When el <usuario> confirme el <reporte>
    Then el sistema debe asociar el <archivo> al <incidente> y mostrarlo en el <detalle>

    Examples: Datos de entrada
        | usuario | reporte | archivo |
        | "vecino@mail.com" | "Formulario_ID_123" | "IMG_456.jpg" |

    Examples: Datos de salida (El resultado final)
        | incidente | detalle |
        | "Reporte_ID_987" | "Vista_Detalle_987 (incluye IMG_456.jpg)" |