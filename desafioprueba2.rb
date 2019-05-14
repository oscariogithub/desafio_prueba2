def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
   end


def promedio_alumnos
    
    aux_arr = {}
    products = read_alum('calificaciones.csv')
    products.each do |value_line|
    acc = 0
    cont = 0
    value_line.each_with_index do |elem, index|

      acc += elem.to_i if index != 0
      cont += 1 if index != 0
      
    end
    puts "El alumno #{value_line[0]} tiene una nota promedio de #{acc/cont}"
    aux_arr[value_line[0]] = acc

    end
    return aux_arr

end

def faltas_alumnos
    
    aux_arr = {}
    products = read_alum('calificaciones.csv')
    products.each do |value_line|
    acc = 0
    cont = 0
    value_line.each_with_index do |elem, index|

      acc += elem.to_i if index != 0
      cont += 1 if elem == "A"
      
    end
    puts "El alumno #{value_line[0]} tiene un numero de inacistencias de #{cont}"
    aux_arr[value_line[0]] = acc

    end
    return aux_arr

end


def aprobacion_alumnos
    
    aux_arr = {}
    products = read_alum('calificaciones.csv')
    products.each do |value_line|
    acc = 0
    cont = 0
    value_line.each_with_index do |elem, index|

      acc += elem.to_i if index != 0
      cont += 1 if index != 0

    end

    promedio = acc/cont
    puts "El alumno #{value_line[0]} aprueba con una nota promedio de #{promedio}"if promedio >= 5
    aux_arr[value_line[0]] = acc

    end
    return aux_arr

end


   condition = 0
   while condition != 4
     puts "Elije una opción entre 1, 2 o 3 y 4 para salir"
     condition = gets.chomp.to_i
     case condition
     when 1
       promedio_alumnos
     when 2
       faltas_alumnos
     when 3
       aprobacion_alumnos
     when 4
       puts "Has Salido"
     else
       puts "Opción no válida"
     end
   
   end
   
