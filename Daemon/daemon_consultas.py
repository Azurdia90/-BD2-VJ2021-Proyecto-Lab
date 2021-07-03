from daemon_conexion import conexion

try:
    with conexion.cursor() as cursor_genre:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,name FROM Genre WHERE bandera = ?;"
        cursor_genre.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        genre_all = cursor_genre.fetchall()

        # Recorrer e imprimir
        for genre in genre_all:
            print(genre)

    with conexion.cursor() as cursor_title_type:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,name FROM TitleType WHERE bandera = ?;"
        cursor_title_type.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        title_type_all = cursor_title_type.fetchall()

        # Recorrer e imprimir
        for title_type in title_type_all:
            print(title_type)

    with conexion.cursor() as cursor_title_genre:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT titleId,genreId FROM TitleGenre WHERE bandera = ?;"
        cursor_title_genre.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        title_genre_all = cursor_title_genre.fetchall()

        # Recorrer e imprimir
        for title_genre in title_genre_all:
            print(title_genre)

    with conexion.cursor() as cursor_region:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,name FROM Region WHERE bandera = ?;"
        cursor_region.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        region_all = cursor_region.fetchall()

        # Recorrer e imprimir
        for region in region_all:
            print(region)
    
    with conexion.cursor() as cursor_language:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,name FROM Language WHERE bandera = ?;"
        cursor_language.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        language_all = cursor_language.fetchall()

        # Recorrer e imprimir
        for language in language_all:
            print(language)

    with conexion.cursor() as cursor_alternative_type:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,name FROM AlternativeType WHERE bandera = ?;"
        cursor_alternative_type.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        alternative_type_all = cursor_alternative_type.fetchall()

        # Recorrer e imprimir
        for alternative_type in alternative_type_all:
            print(alternative_type)
    
    with conexion.cursor() as cursor_title:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,titleTypeId,primaryTitle,originalTitle,isAdult,startYear,endYear,runtime FROM Title WHERE bandera = ?;"
        cursor_title.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        title_all = cursor_title.fetchall()

        # Recorrer e imprimir
        for title_type in title_all:
            print(title_type)

    with conexion.cursor() as cursor_alternative_title:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,titleId,regionId,languageId,alternativeTypeId,alternativeAttributeId,title,ordering,isOriginal FROM AlternativeTitle WHERE bandera = ?;"
        cursor_alternative_title.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        alternative_title_all = cursor_alternative_title.fetchall()

        # Recorrer e imprimir
        for alternative_title in alternative_title_all:
            print(alternative_title)
    
    with conexion.cursor() as cursor_episode:
        # En este caso no necesitamos limpiar ningún dato
        consulta = "SELECT id,titleId,parentId,season,episode FROM Episode WHERE bandera = ?;"
        cursor_episode.execute(consulta, (0))

        # Con fetchall traemos todas las filas
        episode_all = cursor_episode.fetchall()

        # Recorrer e imprimir
        for episode in episode_all:
            print(episode)

    print ("Finish")
except Exception as e:
    print("Ocurrió un error al consultar: ", e)
finally:
    conexion.close()