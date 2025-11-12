Feature: US018 - Ver detalles de un incidente individual
    Como usuario,
    Quiero ver todos los detalles de un incidente,
    Para conocer la descripción completa, imágenes y otros datos relacionados.

Scenario Outline: Abrir detalle
    Dado que el <usuario> selecciona un <incidente> 
    When lo abra
    Then la aplicación debe mostrar la pantalla con <titulo>, <descripcion>, <fecha> y <archivos_adjuntos>

    Examples: Datos de entrada
        | usuario | incidente  |
        | "vecino@mail.com" | "ID_Reporte_555" |

    Examples: Datos de salida 
        | titulo | descripcion | fecha | archivos_adjuntos |
        | "Auto sospechoso" | "Un auto rojo sin placas..." | "10/11/2025 20:00" | "[IMG_1.jpg, VID_2.mp4]" |

Scenario Outline: Ver incidente en el mapa 
    Dado que el <reporte> de incidente  tiene una <ubicacion>
    When el <usuario> presione el botón de <Ver_en_mapa>
    Then el sistema debe mostrar dónde se indicó que ocurrió el incidente en el <mapa>

    Examples: Datos de entrada
        | usuario | reporte  | Ver_en_mapa  | ubicacion |
        | "vecino@mail.com" | "ID_Reporte_555" | "btn_ver_mapa_detalle" | "-12.10, -77.05" |

    Examples: Datos de salida
        | mapa |
        | "Vista_Mapa centrada en -12.10, -77.05 con pin 555" |