Feature: US034W06 - Añadir vecino a la red vecinal
    Como administrador o líder de barrio,
    Quiero agregar a un vecino a la red vecinal para que pueda formar parte del vecindario, entrar al chat y registrar su vivienda en la aplicación,
    Para crecer de manera controlada y escalable, aumentando la red de vecinos.

Scenario Outline: Alta de vecino
    Dado que el <administrador> accede a “Gestión de vecinos”
    When complete los <datos_vecino> y confirme el registro
    Then el sistema debe registrar al vecino y añadirlo a la red vecinal

    Examples: Datos de entrada
        | administrador | datos_vecino |
        | "lider_barrio@mail.com" | "{nombre: 'Juan Pérez', dirección: 'Calle Lima 123', contacto: '999888777'}" |

    Examples: Datos de salida
        | registro_exitoso | vecino_agregado |
        | true | "Juan Pérez" |


Scenario Outline: Acceso al chat y mapa
    Dado que el <vecino> fue incorporado a la red
    When se confirme su registro
    Then la aplicación web debe habilitar su <acceso_chat> y marcar su <vivienda_en_mapa>

    Examples: Datos de entrada
        | vecino | registro_confirmado |
        | "Juan Pérez" | true |

    Examples: Datos de salida
        | acceso_chat | vivienda_en_mapa |
        | true | "Marcador visible en mapa vecinal" |
