module Payable

    def pay(params = {})
        method = params[:method]
        amount = params[:amount] 
        options = params[:options]

        return puts 'O vamor do pagamento não foi informado' unless amount
        return puts 'O valor mínimo não foi atingido.' if amount <= 1

        options[:amount] = amount

        if method == 'credit_card'
            credit_card(options)
        elsif method == 'bank_slip'
            bank_slip(options)
        else    
            puts 'O metodo é invalido'
        end
    end

    private

    def credit_card(options = {})
        card_number = options[:number]
        card_cvv = options[:cvv]
        card_holder = options[:holder]
        card_expiry = options[:expiry]
        amount = options[:amount]


        if card_number && card_cvv && card_holder && card_expiry
            puts "Pago com cartão de crédito na quantida de #{amount}"
            generate_invoice(amount)
        else
            puts "Numero do cartão não enviado" unless card_number
            puts "Cvv do cartão não enviado" unless card_cvv
            puts "Nome do cartão não enviado" unless card_holder
            puts "Data de validade do cartão não enviado" unless card_expiry
            false
        end
    end

    def bank_slip(options = {})
        name = options[:name]
        document = options[:document]
        email = options[:email]
        amount = options[:amount]
        
        if name && document && email 
            puts "Boleto emitido e enviado por email para #{email}"
            generate_invoice(amount)
        else
            puts 'Nome não enviado' unless name
            puts 'documento não enviado' unless document
            puts 'email não enviado' unless email
            false
        end 
    end

    def generate_invoice(amount)
        { invoice: rand(5000..15000), amount: }
    end

end