require './modules/shippable'
require './modules/payable'
require './modules/validatable'
require './modules/addressable'
require './classes/product'
require './classes/book'
require './classes/electronic'
require './classes/customer'
require './classes/cart'

address = {
    public_area: 'Dorival Bueno',
    number: '110',
    district: 'Morro do ouro',
    zip_code: '13801-114',
    city: 'Mogi-Guaçu',
    federal_state: 'SP'
}

customer = Customer.new({
    first_name: 'Danilo',
    last_name: 'Salvato',
    email: 'danilo_salvato@hotmail.com',
    document: '464.633.558-10',
    address: address
})

# cart = Cart.new(customer:, payment_method: 'bank_slip')
# cart = Cart.new(customer:, payment_method: 'Credit_card', card:)
cart = Cart.new({ customer: })

book = Book.new({ name: 'Harry potter', author: 'J.K.', pages: 500, price: 200 })

products = [book]
payment_method = [
    { reference: 'credit_card', label: 'Cartão de Crédito'},
    { reference: 'bank_slip', label: 'Boleto bancário'}
]



loop do
    puts "Olá, #{customer.name}"
    puts '-----'
    puts '1. Adicionar carrinho'
    puts '2. Vizualizar carrinho'
    puts '3. Comprar'
    puts '4. Vizualizar compras'
    puts '5. Sair'
    puts '-----'
    print 'Digite a opção desejada: '
    option = gets.chomp.to_i
    
    case option
    when 1
        puts '-----'
        puts 'Produtos disponíveis'

        products.each_with_index do | product, index |
            puts "#{index + 1}. #{product.name} - #{product.price}"
        end

        loop do
            puts 'Digite a opção desejada ou 0 para voltar ao menu: '
            chosen_product = gets.chomp

            break if chosen_product == '0'

            final_product = products[chosen_product.to_i - 1]

            if final_product
                puts 'Produto adicionado com sucesso'
                cart.add(final_product)
            else
                puts 'Produto Inválido'
            end
        end

        puts '-----'
    when 2
        puts '-----'
        cart.show
    when 3
        puts '-----'
        puts 'Selecione o metodo de pagamento: '

        payment_method.each_with_index do | payment_method, index |
            puts "#{index + 1} - #{payment_method[:label]}"
        end

        loop do
            print 'Digite a opção desejada ou 0 para voltar ao menu: '
            chosen_method = gets.chomp

            break if chosen_method == '0'

            normalized_chosen_method = chosen_method.to_i - 1
            final_method = payment_method[normalized_chosen_method]

            if final_method
                final_method_reference = final_method[:reference]
                cart.payment_method = final_method_reference

                if final_method_reference == 'credit_card'
                    puts 'Preencha com a informações do seu cartão'
                    
                    print 'Numero do cartão: '
                    number = gets.chomp

                    print 'CVV do cartão: '
                    cvv = gets.chomp

                    print 'Nome impresso do cartão: '
                    holder = gets.chomp

                    print 'Data de validade do cartão: '
                    expiry = gets.chomp

                    cart.card = { number:, cvv:, holder:, expiry: }
                end

                cart.checkout
                break
            else
                puts 'Metodo de pagamento inválido'
            end
        end

        puts '-----'
    when 4
        puts 'Opção 4'
        customer.show_invoice
    when 5
        puts 'Até mais!'
        break
    else
        puts 'Opção inválida'
    end
end