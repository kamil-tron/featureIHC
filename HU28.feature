Feature: US028 - Asignación de roles en la app móvil
    Como líder de la junta vecinal con rol principal,
    Quiero asignar o revocar roles de importancia a los vecinos desde la aplicación móvil,
    Para asegurar que solo personas designadas tengan permisos especiales como validar, agrupar reportes o moderar la comunicación.

Scenario Outline: Asignar rol
    Dado que el <lider> accede a la sección <gestion_vecinos>
    When seleccione el <perfil_vecino> y toque “<accion>”
    Then el sistema debe actualizar los <permisos> y mostrar un <mensaje_confirmacion>

    Examples: Datos de entrada
        | lider | gestion_vecinos | perfil_vecino | accion |
        | "lider@mail.com" | "Gestión de vecinos"| "vecino1" | "Asignar rol de administrador"|

    Examples: Datos de salida
        | permisos_actualizados | mensaje_confirmacion |
        | "Administrador" | "Rol asignado correctamente." |

Scenario Outline: Revocar o cambiar rol
    Dado que un <vecino> ya tiene un rol importante
    When el <lider> abra su perfil y seleccione la acción <cambiar_rol>
    Then el sistema debe aplicar el cambio, registrar la <accion_historial> y reflejar el nuevo <rol>

    Examples: Datos de entrada
        | lider | vecino | cambiar_rol |
        | "lider@mail.com" | "vecino1"| "Cambiar a rol estándar"|

    Examples: Datos de salida
        | rol | accion_historial |
        | "Vecino" | "Cambio de rol realizado por lider@mail.com - 12/11/2025 10:30" |
