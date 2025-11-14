Feature: US029-W03 - Asignación de roles en la web
    Como líder o administrador principal de la junta vecinal,
    Quiero asignar distintos roles de importancia a los miembros de la comunidad,
    Para controlar quiénes tienen permisos especiales, como agrupar reportes, validar incidentes o gestionar la información comunitaria.

Scenario Outline: Asignar rol
    Dado que el <administrador> ingresa al <panel_usuarios>
    When seleccione a un <vecino> y elija <accion_asignar>
    Then la web debe guardar el cambio y reflejar el <nuevo_rol> en la lista

    Examples: Datos de entrada
        | administrador | panel_usuarios | vecino | accion_asignar | nuevo_rol |
        | "admin@junta.com" | "Panel de usuarios" | "Carlos Pérez" | "Asignar rol" | "Moderador" |

    Examples: Datos de salida
        | mensaje_exito | rol_actualizado | registro_log |
        | "Rol asignado correctamente" | "Moderador" | "admin@junta.com asignó 'Moderador' a Carlos Pérez - 12/11/2025 14:20" |

Scenario Outline: Modificar o revocar rol
    Dado que un <vecino> tiene un <rol_importante>
    When el <administrador> edite su registro y seleccione <accion_revocar>
    Then el sistema debe devolverlo a <rol_estandar> y registrar la modificación

    Examples: Datos de entrada
        | administrador | vecino | rol_importante | accion_revocar | rol_estandar |
        | "admin@junta.com" | "Carlos Pérez" | "Moderador" | "Revocar rol" | "Vecino" |

    Examples: Datos de salida
        | mensaje_exito | rol_actualizado | registro_log |
        | "Rol revocado correctamente" | "Vecino" | "admin@junta.com revocó 'Moderador' a Carlos Pérez - 12/11/2025 14:25" |
