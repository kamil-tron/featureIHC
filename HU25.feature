Feature: US025W002 - Ver historial de incidentes en una zona específica
    Como usuario,
    Quiero ver el historial de incidentes ocurridos en mi zona específica,
    Para conocer la frecuencia de eventos en ese lugar.

Scenario Outline: Listado de historial
    Dado que el <usuario> abra el perfil de una <casa> o <zona>
    When desplace hacia abajo
    Then la aplicación debe mostrar el <listado> de reportes ocurridos ahí en orden cronológico

    Examples: Datos de entrada
        | usuario | casa | zona |
        | "vecino@mail.com" | "Casa_102" | "Zona_Norte" |

    Examples: Datos de salida
        | listado |
        | "[Inc_201: 'Robo 12/08/2025', Inc_214: 'Incendio 22/09/2025', Inc_229: 'Asalto 10/11/2025']" |

Scenario Outline: Ir al detalle
    Dado que el <usuario> seleccione un <reporte> del listado
    When presione en <boton_ver_mas>
    Then el sistema debe abrir el detalle del <incidente> correspondiente

    Examples: Datos de entrada
        | usuario | reporte | boton_ver_mas |
        | "vecino@mail.com" | "Inc_214" | "Ver más" |

    Examples: Datos de salida
        | incidente_detalle |
        | "Detalle: Incendio en almacén - Fecha: 22/09/2025 - Estado: Resuelto" |