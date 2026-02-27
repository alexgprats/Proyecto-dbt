{% macro categorizar_importe(columna) %}
    case 
        when {{ columna }} >= 150000 then 'Prioridad Alta'
        when {{ columna }} >= 50000 then 'Prioridad Media'
        else 'Prioridad Baja'
    end
{% endmacro %}