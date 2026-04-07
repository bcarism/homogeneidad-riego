# Desafío SCI Codelco: Homogeneidad de Riego en Pilas de Lixiviación

## Problema
En la División Radomiro Tomic de Codelco, los goteros de riego en las pilas de lixiviación se tapan con el tiempo, generando zonas secas y pérdidas significativas en la recuperación de cobre. Actualmente no existe una solución comercial que permita monitorear y asegurar la homogeneidad del riego en tiempo real.

## Objetivo
Desarrollar una solución simulada que permita **medir, monitorear y asegurar** la homogeneidad del riego en las pilas de lixiviación, alcanzando un **Coeficiente de Uniformidad (DU) mínimo de 90%** en cualquier momento del tiempo en toda la pila.

## Meta concreta
DU ≥ 90% en todo momento

## Atributos de la solución (según bases Codelco)
- Medición en tiempo real de flujo y presión por gotero
- Alertas de goteros tapados
- Sistema de limpieza efectivo en tiempo acotado
- Históricos en base de datos manipulable
- Integridad de datos garantizada
- Reportes amigables para operadores
- Validación en entorno simulado → real
- Costo atractivo y modelo de negocio factible

## Tecnologías utilizadas
| Herramienta | Uso |
|-------------|-----|
| MATLAB | Simulación del proceso de lixiviación, cálculo de DU, implementación de estrategias de control |
| Simulink (futuro) | Modelamiento hidráulico de la red de goteros |
| GitHub | Control de versiones y documentación |

## Estructura del proyecto
