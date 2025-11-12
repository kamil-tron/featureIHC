Feature: US013 - Proceso de inicio de sesión
    Como usuario,
    Quiero ingresar mi nombre de usuario y contraseña en el formulario de inicio de sesión,
    Para acceder a mi cuenta y utilizar las funciones personalizadas de la aplicación.

Scenario Outline: Inicio de sesión exitoso
    Dado que el <usuario> ingresa su <nombre_de_usuario> y <contrasena> correctamente
    When presiona el botón <Iniciar_sesion>
    Then la aplicación debe autenticarlo y redirigirlo a su <panel_principal>

    Examples: Datos de entrada
        | nombre_de_usuario | contrasena | Iniciar_sesion |
        | "vecino_A@mail.com" | "clave123" | "btn_login" |

    Examples: Datos de salida
        | panel_principal |
        | "/dashboard" |

Scenario Outline: Campos vacíos
    Dado que el <usuario> no ha ingresado <nombre_de_usuario> o <contrasena>
    When intenta presionar <Iniciar_sesion> 
    Then el <Iniciar_sesion> debe estar deshabilitado
    And no debe enviarse la <solicitud>

    Examples: Datos de entrada 
        | nombre_de_usuario | contrasena |
        | "" | "" |

    Examples: Datos de salida 
        | Iniciar_sesion  | solicitud |
        | "deshabilitado" | "no_enviada" |

Scenario Outline: Credenciales incorrectas
    Dado que el <usuario> ingresa un <nombre_de_usuario> o <contrasena> incorrectos
    When presiona <Iniciar_sesion>
    Then el sistema debe mostrar un <mensaje_de_error>

    Examples: Datos de entrada
        | nombre_de_usuario | contrasena | Iniciar_sesion |
        | "vecino_A@mail.com" | "clave_incorrecta" | "btn_login" |

    Examples: Datos de salida
        | mensaje_de_error |
        | "Nombre o contraseña incorrectos" |

Scenario Outline: Recuperar contraseña
    Dado que el <usuario> olvidó su contraseña
    When presiona el enlace <Olvidaste_tu_contrasena>
    Then la aplicación debe redirigir al <flujo_de_recuperacion>

    Examples: Datos de entrada
        | Olvidaste_tu_contrasena |
        | "link_recuperar_pass" |

    Examples: Datos de salida
        | flujo_de_recuperacion |
        | "/recuperar-password" |

Scenario Outline: Crear cuenta
    Dado que el <usuario> no tiene una cuenta
    When presiona el botón <Crear_cuenta>
    Then la aplicación debe redirigirlo al <formulario_de_registro>

    Examples: Datos de entrada
        | Crear_cuenta |
        | "btn_link_registro" |

    Examples: Datos de salida
        | formulario_de_registro |
        | "/registro" |