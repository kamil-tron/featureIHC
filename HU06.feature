Feature: US06 - Sección “Sobre nosotros”
    Como vecino,
    quiero acceder a la sección “Sobre nosotros” desde la web o la app móvil
    para conocer la misión, visión, sentido de existencia, oferta de valor, equipo y cómo contactar soporte.

Scenario Outline: Acceso en web
    Dado que el <usuario> navega en el portal
    When selecciona <Sobre_nosotros> desde el encabezado o footer
    Then el sistema carga la sección con bloques de <Mision>, <Vision> y <Sentido_de_existencia> en primer pliegue

    Examples: Datos de entrada
        | usuario | Sobre_nosotros |
        | "visitante_web@mail.com" | "link_footer_sobre_nosotros" |

    Examples: Datos de salida
        | Mision | Vision | Sentido_de_existencia |
        | "Contenido Misión Urban Safe..." | "Contenido Visión Urban Safe..." | "Contenido Porqué Urban Safe..." |

Scenario Outline: Acceso en móvil
    Dado que el <usuario> está en la app
    When abre el menú y pulsa <Sobre_nosotros>
    Then la app muestra la <seccion_adaptada> a móvil con tarjetas apiladas y navegación interna

    Examples: Datos de entrada
        | usuario | Sobre_nosotros |
        | "usuario_app@mail.com" | "menu_item_sobre_nosotros" |

    Examples: Datos de salida
        | seccion_adaptada |
        | "Vista Movil 'Sobre Nosotros' renderizada" |

Scenario Outline: Visión del equipo y oferta
    Dado que el <usuario> se desplaza por la <seccion>
    When llega a <Que_ofrecemos> y <Equipo>
    Then se renderizan tarjetas con <iconos_fotos>, <nombre> y <rol>, manteniendo tap targets accesibles

    Examples: Datos de entrada
        | usuario | seccion |
        | "usuario_app@mail.com" | "/sobre-nosotros" |

    Examples: Datos de salida
        | Que_ofrecemos | Equipo | iconos_fotos | nombre | rol |
        | "Bloque 'Qué ofrecemos' visible" | "Bloque 'Equipo' visible" | ["img_juan.png", "img_maria.png"] | ["Juan Pérez", "Maria Gómez"] | ["CEO", "CTO"] |

Scenario Outline: Contacto y ayuda (vía Correo)
    Dado que el <usuario> requiere soporte
    When selecciona el <correo>
    Then el sistema abre el <cliente_de_correo>

    Examples: Datos de entrada
        | usuario | correo |
        | "usuario_soporte@mail.com" | "link_soporte@urbansafe.com" |

    Examples: Datos de salida
        | cliente_de_correo |
        | "mailto:soporte@urbansafe.com" |

Scenario Outline: Contacto y ayuda (vía Botón Ayuda)
    Dado que el <usuario> requiere soporte
    When selecciona el botón <Ayuda>
    Then el sistema navega a la <seccion_de_Ayuda> con números de emergencia y soporte 24/7

    Examples: Datos de entrada
        | usuario | Ayuda |
        | "usuario_emergencia@mail.com" | "boton_ayuda_soporte" |

    Examples: Datos de salida
        | seccion_de_Ayuda |
        | "Vista /ayuda renderizada" |