# STORE 🛒

> Desarrollar un software web que permita recibir pedidos por internet.

## FUNCIONALIDADES

1. Definir una aplicación que permita tener un administrador
 - CRUD Categories
 - CRUD Products
 - CRUD Role
 - CRUD Users (OPT)

2. Mostrar los productos como si fuera un catálogo:
 - Crear carritos de compras
 - Crear un pedido desde el cliente
 - Enviar un correo de confirmación al cliente sobre el pedido realizado

## Creando los modelos y las migraciones según el diagrama ER

```bash
rails g model Category name:string
rails g model Product name:string price:integer description:string category:references
rails g model Cart total:integer
rails g model CartProduct cart:references product:references quantity:integer
rails g model Status description:string
rails g model Role name:string
rails g model User username:string password_digest:string role:references
rails g model Order number:string total:integer user:references status:references
rails g model OrderDetail order:references product:references quantity:integer
```



## Instalar bootstrap con yarn

1. Agregar los paquetes con Yarn

    ```bash
    yarn add bootstrap
    yarn add @popperjs/core
    ```

2. Crear el directorio `app/javascript/css`
3. Crear el archivo `main.sass` o `main.scss`

    ```sass
    @import '~bootstrap/scss/bootstrap'
    ```
4. Importar los paquetes

    ```javascript
    // app/javascript/packs/application.js
    import 'bootstrap'
    import 'css/main'
    ```

## CRUD de Categories

```bash
rails g controller Admin::Categories index show new edit
```

1. Definir las rutas del controlador
2. Verficiar el controlador
3. Vistas del controlador

## CRUD de Roles

```bash
rails g controller Admin::Roles index show new edit
```

1. Definir las rutas del controlador
2. Verificar lógica en el controlador
3. Vistar

# CRUD de Statutes

```bash
rails g controller Admin::Statuses index show new edit
```

1. Definir las rutas del controlador
2. Verificar lógica en el controlador
3. Vistar
