Feature: US015 - Ver información de una casa desde el mapa
    Como usuario,
    Quiero tocar una casa en el mapa y ver su información pública,
    Para conocer su historial de incidentes y otros datos que el propietario permita mostrar.

Scenario Outline: Abrir perfil de casa
    Dado que el <usuario> selecciona una <casa> marcada
    When toque el <marcador>
    Then la aplicación debe abrir la vista del <perfil> de esa <casa>

    Examples: Datos de entrada
        | usuario | casa (ID) | marcador |
        | "vecino@mail.com" | "ID_Casa_123" | "pin_casa_123" |

    Examples: Datos de salida
        | perfil (vista) |
        | "Vista_Perfil_Casa_123" |

Scenario Outline: Ver reportes asociados 
    Dado que el <propietario> permite mostrar su <informacion>
    When el <usuario> abra el <perfil> de la casa
    Then el sistema debe visualizar los <reportes> de incidentes relacionados con esa <direccion>

    Examples: Datos de entrada 
        | propietario | direccion | informacion (permiso) | perfil (abierto) |
        | "dueño@mail.com" | "Av. Siempreviva 742" | "Publica" | "Vista_Perfil_Casa_123" |

    Examples: Datos de salida 
        | reportes (visibles) |
        | "[Reporte_ID_A, Reporte_ID_B]" |