class Cart
    include Shippable
    include Payable

    attr_accessor :customer, :items, :shipping_cost, :payment_method, :card

    def initialize(attributes = {})
      @customer = attributes[:customer]
      @items = []
      @shipping_cost = nil
      @payment_method = attributes[:payment_method]
      @card = attributes[:card] || {}
    end

    def show
        return puts 'Carrinho vazio' if items.empty?

        items.each do |item|
            puts "#{item.name} - #{item.price}"
        end

        partial_amount = items.sum(&:price)

        puts '-----'
        puts "Valor dos itens somados: #{partial_amount}"
        puts "Valor do frete: #{shipping_cost}"
        puts "Total da Compra: #{amount}"
        customer.show
    end

    def add(item)
        @items.push(item)
        #@items << item
        refresh_shipping_cost
    end

    def remove(item)
        @items.delete(item)
        refresh_shipping_cost    
    end

    def clear
        @items.clear
        @shipping_cost = nil
    end

    def checkout
        return puts validade_checkout if validade_checkout.any?
        invoice = pay({
            method: payment_method, 
            amount: amount, 
            options: payment_method == 'bank_slip' ? bank_slip_options : card 
        })

        if invoice
            puts 'Compra realizada com sucesso!'
            reset_after_purchase
            customer.add_invoice(invoice)
        else
            puts 'Erro no pagamento, tente noavmente'
        end
    end

    private

    def refresh_shipping_cost
        @shipping_cost = calculate_shipping(items.length)
    end

    def validade_checkout
        [].tap do | errors |
        errors.push('Cliente não enviado ou inválido') unless customer && customer.class == Customer
        errors.push('Carrinho vazio') if items.empty?
        errors.push('Frete ainda não calculado') if shipping_cost.nil?
        end
    end

    def partial_amount
        items.sum(&:price)
    end

    def amount 
        shipping_cost + partial_amount
    end

    def reset_after_purchase
        clear
        @payment_method = nil
        @card = {}
    end

    def bank_slip_options
        {name: customer.name, document: customer.document, email: customer.email}
    end
end