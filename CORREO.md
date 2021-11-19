# Correos

- Action Mailer son como controladores para crearlos se puede hacer con el siguiente comando:

  `rails g mailer Order`

- Hay que configurar los archivos según el ambiente en el que estámos, en el caso de desarrollo es el archivo de
  `config/environments/development.rb`

  Configuración en caso de correo Zoho

  ```ruby
  # config/environments/development.rb
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:               'smtp.zoho.com',
    port:                 587,
    user_name:            Rails.application.credentials.correo[:direccion],
    password:             Rails.application.credentials.correo[:password],
    authentication:       'plain',
    enable_starttls_auto: true
  }
  ```

  Configuración en caso de correo Outlook

  ```ruby
  # config/environments/development.rb
  config.action_mailer.smtp_settings = {
    address:               'smtp-mail.outlook.com',
    port:                 587,
    user_name:            Rails.application.credentials.correo[:direccion],
    password:             Rails.application.credentials.correo[:password],
    authentication:       'login',
    enable_starttls_auto: true
  }
  ```

  Configuración corrego de Gmail

  Tomar en cuenta que en Gmail hay que permitir el acceso de envío de correos por código

  [Permitir aplicación](https://myaccount.google.com/lesssecureapps)

  ```ruby
  # config/environments/development.rb
  config.action_mailer.smtp_settings = {
    address:               'smtp.gmail.com',
    port:                 587,
    user_name:            Rails.application.credentials.correo[:direccion],
    password:             Rails.application.credentials.correo[:password],
    authentication:       'login',
    enable_starttls_auto: true
  }    
  ```

- En el archivo `app/mailers/order_mailer.rb` crear el método para enviar un correo

  ```ruby
  class OrderMailer < ApplicationMailer

    # como controladores
    def enviar_correo
      @variable = params[:variable]                             # para recibir variables y pasarlas a las "vistas"
      mail(to: 'rene.clavijo@outlook.com', subjuect: 'prueba')  # este método es el que envía el correo 
    end
  end
  ```

- Crear la "vista" del correo que se va a enviar

  ```html
  <!-- app/views/send_mailer/send_order.html.erb -->
  bienvenido al correo con rails <%= @variable %>
  ```

- Para enviar el correo hay que llamarlo con el Mailer y el nombre del método

  ```ruby
  OrderMailer.with(variable: "valor").enviar_correo.deliver_later  # Enviar ya mismo con el servidor esperando
  ```
