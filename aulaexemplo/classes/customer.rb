class Customer
    include Validatable
    include Adressable
    attr_accessor :first_name, :last_name, :email, :document, :address, :credit_card, :invoices
    
    def initialize(attributes  = {})
      @first_name = attributes[:first_name]&.capitalize
      @last_name = attributes[:last_name]&.capitalize
      @email = attributes[:email]
      @document = attributes[:document]
      @address = attributes[:address] || {}
      @credit_card = attributes[:credit_card] || {}
      @invoices = []

      validate_address
      validate_attributes
    end

    def name 
        "#{first_name} #{last_name}"
    end
    
    def add_invoice(invoice)
        @invoices.push(invoice)
    end

    def show
        puts "Nome: #{first_name}"
        puts "Sobrenome #{last_name}"
        puts "Email: #{email}"
        puts "Documento: #{document}"
        puts "CEP: #{zip_code}"
        puts "Endereço completo#{full_address}"
        puts '---'

        show_invoice
    end

    def show_invoice
        
        puts 'Nenhuma compra realizada' if invoices.empty?

        @invoices.each do |invoice|
            puts 'Compras: '
            puts "código: #{invoice[:invoice]} "
            puts "Valor: #{invoice[:amount]} "
        end
    end

    private

    def validate_attributes
        puts "Nome não foi enviado" unless first_name
        puts "Sobre nome não foi enviado" unless last_name
        puts "Email não foi enviado" unless email
        puts "Documento não foi enviado" unless document
        puts "CPF é valido" if document && invalid_document?(document)
        puts "Email é valido" if email && invalid_email?(email)
    end 
end 