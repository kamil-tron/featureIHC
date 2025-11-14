Feature: US020 - Modificar un reporte propio
    Como usuario,
    Quiero editar los detalles de un reporte que hice,
    Para agregar información adicional o corregir errores.

Scenario Outline: Ver opción Editar
    Dado que el <reporte> pertenece al <usuario>
    When abra el detalle del reporte
    Then la aplicación debe mostrar el botón <Editar>

    Examples: Datos de entrada
        | usuario | reporte |
        | "vecino@mail.com" | "Rep_210" |

    Examples: Datos de salida
        | Editar |
        | true |

Scenario Outline: Cambiar texto del reporte
    Dado que el <usuario> se equivocó en alguna información del <reporte>
    When le dé al botón <Editar>
    Then podrá modificar el <texto> correspondiente

    Examples: Datos de entrada
        | usuario | reporte | texto_original |
        | "vecino@mail.com" | "Rep_210" | "Incendio en calle Lima Norte" |

    Examples: Datos de salida
        | texto_editado |
        | "Incendio en calle Lima Sur" |

Scenario Outline: Cambiar tipo de incidente
    Dado que el <usuario> se equivocó en el tipo de <incidente>
    When le dé al botón <Editar>
    Then podrá añadir o quitar las <etiquetas_tipo> del incidente

    Examples: Datos de entrada
        | usuario | incidente | etiquetas_tipo_original |
        | "vecino@mail.com" | "Rep_210" | "[Incendio]" |

    Examples: Datos de salida
        | etiquetas_tipo_editadas |
        | "[Incendio, Fuga de gas]"|

Scenario Outline: Guardar edición
    Dado que el <usuario> modifica campos del <reporte>
    When toque <Guardar>
    Then el sistema debe aplicar los cambios al informe del incidente y actualizarlo en el mapa y la lista

    Examples: Datos de entrada
        | usuario | reporte | campos_editados |
        | "vecino@mail.com" | "Rep_210" | "[texto, tipo, multimedia]" |

    Examples: Datos de salida
        | reporte_actualizado_en |
        | "[Mapa, Lista de incidentes]" |
