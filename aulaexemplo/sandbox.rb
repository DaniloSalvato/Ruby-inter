require './modules/shippable'
require './modules/payable'
require './modules/validatable'
require './modules/addressable'
require './classes/product'
require './classes/book'
require './classes/electronic'
require './classes/customer'
require './classes/cart'

# product = Product.new(name: 'Psp', price: 500)
# product.display

book = Book.new(
    name: 'Harry potter', 
    author: 'J.K.',
    pages: 500,
    price: 200)

# card = {
#     card_number: '123',
#     card_cvv: '123',
#     card_holder: 'Danilo', 
#     card_expiry: '23-10-2030'
#     }
    
# bank_slip = {
#     name: 'Danilo',
#     document: '46463355810',
#     email: 'danilo_salvato@hotmail.com'
# }

# book.pay({
#     method: 'bank_slip', 
#     amount: 0,
#     options: bank_slip
# })

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

card = {
    number: '4444 4444 4444 4444',
    cvv: '123',
    holder: 'Danilo Salvato',
    expiry: '2023-10-10'

}

cart = Cart.new(customer:, payment_method: 'bank_slip')
# cart = Cart.new(customer:, payment_method: 'Credit_card', card:)

cart.add(book)
cart.checkout
customer.show