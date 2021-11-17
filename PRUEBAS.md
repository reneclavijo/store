# PRUEBAS CON Rspec

Pensar en una caja negra porque "no sabemos" el código que está por detrás para dar solución al problema

No olvidar qué las pruebas tenemos que tener claro las ENTRADAS y SALIDAS. Lo que se pruebas son las SALIDAS

Existen 3 pasos comunes para construir pruebas y es la AAA

- Arrange   |   Arreglar    ;   Preparar
- Act       |   Actuar      ;   Ejecutar
- Assert    |   Afirmar     ;   Validar

- Arrange.  Preparar los datos de entrada que necesito
- Act.      Ejecutar la acción que estoy probando
- Assert.   Validar salida de la acción realizada

## Tipos de pruebas

### Unit Test

    Es la que normalmente programamos, son baratas, cortas y no prueban dependencias externas

### Integration Test

    Pruebas con dependencias externas como BD, envío de correos, carga de imágenes, etc.

### End-to-End Test

    Pruebas de UI y flujos del software. Una herramienta utilizada es Capibara

## ¿QUÉ PROBAR Y QUE NO?

    Probar solo métodos públicos y flujos

## ¿ Cómo se utilizar Rspec?

```ruby
group :development, :test do
    gem 'rspec-rails', '~> 5.0.0'
end
```

`rails g rspec:install`

## Estructura de Rspec Core

    ```ruby
    Rspec.describe MiClase do # Comportamiento de clase

    end

    Rspec.describe MiClase do
        describe '#metodo' do
        end

        describe '#metodo2' do
        end
    end
    ```

Bloque `context` hace lo mismo que el describe anidado, solo que ayuda a tener un lenguaje más "humano"

    ```ruby
    Rspec.describe MiClase do
        context 'cuando tenemos una condición' do
        
        end
    end
    ```

Bloque `it` es el bloque de prueba concreta que recibe una descripción de la prueba y dentro va la AAA

    ```ruby
    Rspec.describe MiClase do
        describe '#metodo1' do
            it 'descripción de la prueba' do

            end
        end
    end
    ```

    Métodos *helper* que se ejecutan cuando son llamados

    ```ruby
    Rspec.describe MiClase do
        let(:metodo_ayudante) do
            # codigo
        end

        let(:metodo_ayudante_una_linea) { #codigo }
    end
    ```

## Estructua Rspec-Expectations

    - Se utiliza el método `expect()` para saber qué se va a evaluar y tiene que ser igual o diferente a un `matcher`

    ```ruby
    expect(actual).to matcher(expected)
    expect(actual).not_to matcher(expected)
    expect(actual).to_not matcher(expected) # es lo mismo que arriba
    ```

    [Lista de Matchers básicos](https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers)

## Probando cosas de rails

### Modelos

    ```ruby
    require 'rails_helper'

    RSpec.describe Product, type: :model do
    it 'should validate presence of attributes' do
        product = Product.new
        product.save
        expect(product).to_not be_persisted
    end

    it 'should validate uniqueness name' do
        product1 = Product.new(name: 'jueguete')
        product1.save
        product2 = Product.new(name: 'jueguete')
        product2.save
        expect(product2).to_not be_valid
    end
    end

    ```

### Controladores

> Deberíamos recordar qué vamos a probar que son peticiones HTTP entrantes y salidas en vistas, normalmente HTML
> Son conocidos como pruebas funcionales
> En Rspec son `rspec:controller` o `rspec:request`

Deberíamos tomar en cuenta para probar lo siguiente

1. ¿La petición fue exitosa?
2. ¿El usuario es redirigido a la página correcta?
3. ¿El usuario fue autenticado correctamente?
4. ¿El mensaje adecuado se mostró al usuario?
5. ¿Se mostró la vista adecuada en la respuesta?

Se puede probar lo siguiente:

    - rendered templates
    - redirects
    - instance variables assigned in the controller to be shared with the view
    - cookies sent back with the response

    ```ruby
    require 'rails_helper'

    RSpec.describe "/products", type: :request do
        describe "GET /index" do
            it 'should return index template' do
            get products_path
            #puts response.methods.sort
            expect(response).to have_http_status(200)
            expect(response).to be_successful
            end
        end

        describe "POST /products" do
            it 'should redirect to products_path' do
            post products_path, params: { product: { name: 'jueguete' } }
            expect(response).to be_redirect
            end
        end
    end
    ```

### Vistas

Tomar en cuenta para las vistas que se deben seguir la siguiente estructura

>assign(:widget, Widget.new)  # sets @widget = Widget.new in the view template
>render
>expect(rendered).to match(/text/)

### Rutas

[Documentación](https://relishapp.com/rspec/rspec-rails/v/5-0/docs/routing-specs)

Tomar como ejemplo lo siguiente:

    ```ruby
    require "rails_helper"

    RSpec.describe ProductsController, type: :routing do
        describe "routing" do
            it "routes to #index" do
                expect(get: "/products").to route_to("products#index")
            end

            it "routes to #new" do
                expect(get: "/products/new").to route_to("products#new")
            end

            it "routes to #show" do
                expect(get: "/products/1").to route_to("products#show", id: "1")
            end

            it "routes to #edit" do
                expect(get: "/products/1/edit").to route_to("products#edit", id: "1")
            end

            it "routes to #create" do
                expect(post: "/products").to route_to("products#create")
            end

            it "routes to #update via PUT" do
                expect(put: "/products/1").to route_to("products#update", id: "1")
            end

            it "routes to #update via PATCH" do
                expect(patch: "/products/1").to route_to("products#update", id: "1")
            end

            it "routes to #destroy" do
                expect(delete: "/products/1").to route_to("products#destroy", id: "1")
            end
        end
    end
    ```
