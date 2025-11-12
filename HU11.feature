Feature: US011 - Realizar un reporte de incidente desde formulario guiado
    Como vecino,
    quiero crear un incidente mediante un formulario paso a paso (con geolocalización automática y opción de ajustar en mapa),
    para reportar de forma clara aun cuando no inicie el flujo desde el mapa.

Scenario Outline: Apertura del panel de creación
    Dado que el <usuario> pulsa el <boton_de_alerta> en el mapa que funciona para hacer un <Nuevo_incidente>
    When se abra el panel
    Then la aplicación debe mostrar el <formulario> multistep iniciando en Tipo

    Examples: Datos de entrada
        | usuario | boton_de_alerta | Nuevo_incidente |
        | "vecino@mail.com" | "btn_alerta_principal" | "flujo_crear_incidente" |

    Examples: Datos de salida
        | formulario |
        | "Panel_Multistep_Paso_1_Tipo" |

Scenario Outline: Validación de campos obligatorios
    Dado que el <usuario> avanza sin completar un <campo> requerido
    When intente pasar al siguiente paso
    Then el sistema debe impedir la acción y mostrar un <mensaje_de_error> bajo el campo

    Examples: Datos de entrada
        | usuario | campo  |
        | "vecino@mail.com" | "campo_tipo_incidente" |

    Examples: Datos de salida
        | mensaje_de_error |
        | "Error: 'Debe seleccionar un tipo de incidente'" |

Scenario Outline: Selección de ubicación por texto
    Dado que el <usuario> está en el paso Ubicación
    When escriba en <ubicacion> y elija una <sugerencia>
    Then la aplicación debe fijar la <coordenada> correspondiente y mostrarla en el <resumen>

    Examples: Datos de entrada
        | usuario | ubicacion | sugerencia  |
        | "vecino@mail.com" | "Av. Arequipa" | "Av. Arequipa 123, Miraflores" |

    Examples: Datos de salida
        | coordenada  | resumen  |
        | "-12.112, -77.031" | "Ubicación: Av. Arequipa 123, Miraflores" |

Scenario Outline: Selección de ubicación en el mapa (botón anexo)
    Dado que el <usuario> está en el paso Ubicación
    When toque el <boton_de_mapa> al lado del campo de dirección
    Then la aplicación debe abrir el <mapa>, centrar en su <ubicacion> y permitir fijar el pin manualmente

    Examples: Datos de entrada
        | usuario | boton_de_mapa | ubicacion |
        | "vecino@mail.com" | "icono_seleccionar_mapa" | "-12.110, -77.030" |

    Examples: Datos de salida
        | mapa |
        | "Vista_Mapa_Interactiva_Centrada_en_-12.110" |

Scenario Outline: Ajuste fino de pin en mapa
    Dado que el <usuario> abrió el mapa
    When arrastre el pin a la <posicion> exacta y confirme
    Then el sistema debe guardar esa <coordenada> como <ubicacion_del_incidente>

    Examples: Datos de entrada
        | usuario | posicion  |
        | "vecino@mail.com" | "{-12.111, -77.032}" |

    Examples: Datos de salida
        | coordenada | ubicacion_del_incidente |
        | "-12.111, -77.032" | "Dato_Formulario_Ubicacion: -12.111, -77.032" |

Scenario Outline: Vista previa y confirmación
    Dado que el <usuario> completó todos los pasos
    When acceda a Revisión y toque <Confirmar>
    Then la aplicación debe crear el <incidente> y mostrar un <mensaje_de_exito>, reflejándolo en el <mapa> y <lista>

    Examples: Datos de entrada
        | Confirmar |
        | "boton_confirmar_y_enviar" |

    Examples: Datos de salida
        | incidente | mensaje_de_exito | mapa  | lista  |
        | "Reporte_ID_101_Creado" | "¡Reporte enviado con éxito!" | "Mapa_Muestra_Pin_ID_101" | "Lista_Muestra_Item_ID_101" |