from tkinter import *

import conexion as cx
from conexion import *


def buscarArtist():
    def leerArtista():
        artista = entrada.get()
        ans = cx.buscarArtista(artista)
        t = Label(base, text='Nombre, Media de oyentes mensuales')
        t.pack()
        resultado = Label(base, text=ans)
        resultado.pack()

    base = Tk()
    base.title('Buscar Artista')
    subtitulo = Label(base, text='Ingrese el artista que desea buscar')
    subtitulo.pack()
    entrada = Entry(base)
    entrada.pack()

    buscar = Button(base, text='Buscar', command=leerArtista)
    buscar.pack()


    base.mainloop()


def entrada():
    def leerRegistro():
        USUARIO = usuarioRegistro.get()
        CLAVE = claveRegistro.get()
        NOMBRE = nombreC.get()
        FECHA_NACIMIENTO = fNacimiento.get()
        CORREO = cElectronico.get()
        crearUsuario(NOMBRE, CORREO, USUARIO, CLAVE, FECHA_NACIMIENTO)
        mensaje = Label(base, text='USUARIO CREADO CON ÉXITO')
        mensaje.pack()
        menu()

    def leerIngreso():
        USUARIO = usuarioIngreso.get()
        CLAVE = claveIngreso.get()
        if cx.buscarUsuario(USUARIO, CLAVE):
            mensaje = Label(base, text='INGRESO EXITOSO. BIENVENIDO')
            mensaje.pack()
            menu()
        else:
            mensaje = Label(base, text='CREDENCIALES INCORRECTOS. INTENTE NUEVAMENTE')
            mensaje.pack()
    base = Tk()
    base.geometry('800x800')
    base.title('entrada')

    tituloRegistro = Label(base, text='Registro:', font=('bold', 20))
    tituloRegistro.place(relx=0.2, rely=0.1)

    uRegistro = Label(base, text='Usuario: ', font=('bold', 20))
    uIngreso = Label(base, text='Usuario: ', font=('bold', 20))
    cRegistro = Label(base, text='Contraseña: ', font=('bold', 20))
    cIngreso = Label(base, text='Contraseña: ', font=('bold', 20))
    nombre = Label(base, text='Nombre: ', font=('bold', 20))
    correo = Label(base, text='Correo: ', font=('bold', 20))
    fechaNto = Label(base, text='Fecha Nacimiento: ', font=('bold', 20))

    tituloIngreso = Label(base, text='Ingreso:', font=('bold', 20))
    tituloIngreso.place(relx=0.6, rely=0.1)

    usuarioRegistro = Entry(base)
    usuarioIngreso = Entry(base)
    claveIngreso = Entry(base)
    claveRegistro = Entry(base)
    nombreC = Entry(base)
    cElectronico = Entry(base)
    fNacimiento = Entry(base)

    uRegistro.place(relx=0.1, rely=0.3)
    uIngreso.place(relx=0.6, rely=0.3)
    cRegistro.place(relx=0.1, rely=0.4)
    cIngreso.place(relx=0.6, rely=0.5)
    nombre.place(relx=0.1, rely=0.5)
    correo.place(relx=0.1, rely=0.6)
    fechaNto.place(relx=0.1, rely=0.7)

    usuarioRegistro.place(relx=0.3, rely=0.3)
    usuarioIngreso.place(relx=0.8, rely=0.3)
    claveRegistro.place(relx=0.3, rely=0.4)
    claveIngreso.place(relx=0.8, rely=0.5)
    nombreC.place(relx=0.3, rely=0.5)
    cElectronico.place(relx=0.3, rely=0.6)
    fNacimiento.place(relx=0.3, rely=0.7)

    botonRegistro = Button(base, text='Continuar', command=leerRegistro)
    botonIngreso = Button(base, text='Continuar', command=leerIngreso)

    botonRegistro.place(relx=0.3, rely=0.9)
    botonIngreso.place(relx=0.8, rely=0.7)

    base.mainloop()


def menu():
    base = Tk()
    base.geometry('500x500')
    base.title('menu')

    titulo = Label(base, text='Elija una opcion:', font=('bold', 20))
    titulo.pack()
    titulo.place(relx=0.4, rely=0.1)

    buscarArtista = Button(base, text='Buscar Artista', command=buscarArtist)
    buscarArtista.pack()
    buscarArtista.place(relx=0.1, rely=0.3)

    buscarCancion = Button(base, text='Buscar Cancion')
    buscarCancion.pack()
    buscarCancion.place(relx=0.1, rely=0.5)

    buscarAlbum = Button(base, text='Buscar Album')
    buscarAlbum.pack()
    buscarAlbum.place(relx=0.5, rely=0.3)

    buscarUsuario = Button(base, text='Buscar Usuario')
    buscarUsuario.pack()
    buscarUsuario.place(relx=0.5, rely=0.5)
    base.mainloop()


entrada()


