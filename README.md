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

```bash
rails g controller Admin::Categories index show new edit
```