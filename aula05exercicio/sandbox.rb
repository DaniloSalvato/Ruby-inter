@contacts = [
    { name: 'Danilo', tel: '19 99999-9999'},
    { name: 'Adal', tel: '19 12345-6789'},
    { name: 'alguém', tel: '19 11111-1111'}
]

def add_contact(name, tel)
    new_contact = Hash[name: name, tel: tel]
    @contacts.push(new_contact)
    puts 'Contato adicionado'
end

def remove_contact
    puts 'remover'

        show
        puts '-----'

        print 'Escolha um contato que deseja remover: '
        chosen_name = gets.chomp
        
        if @contacts.any?{ |element| element[:name] == chosen_name }

            @contacts.each_with_index do | contact, index |
                contact_find = contact[:name] == chosen_name 

                if contact_find
                    @contacts.delete_at(index) 
                    puts 'Contato deletado com sucesso!'
                    puts '-----'
                    break
                end

            end        
        else
            puts 'Contato não existe'
            puts '-----'
        end 
end

def edit_contact
    show
    print 'Escolha o contato que deseja atualizar: '
    chosen_name = gets.chomp
    
    if @contacts.any?{ |element| element[:name] == chosen_name }

        @contacts.each_with_index do | contact, index |
            contact_find = contact[:name] == chosen_name 

            if contact_find
                print 'Digite o novo número de telefone: '
                new_number = gets.chomp

                @contacts[index][:tel] = new_number
                
                puts 'Contato Atualizado com sucesso!'
                puts '-----'
                break
            end

        end        
    else
        puts 'Contato não existe'
        puts '-----'
    end 
end

def show
    puts '-----'
    @contacts.each_with_index do | contact, index |
        puts "#{index + 1} - #{contact[:name]} - #{contact[:tel]}"
    end
end 

loop do 
    puts '1. Adicionar'
    puts '2. Remover '
    puts '3. Atualizar'
    puts '4. Visualizar'
    puts '5. Sair'
    puts '-----'
    print 'Digite a opção desejada: '
    option = gets.chomp.to_i
    
    case option
    when 1
        puts '-----'
        puts 'adicionar'
        puts 'Digite o nome do novo contato'
        name = gets.chomp

        puts 'Digite o número do novo contato' 
        tel = gets.chomp

        add_contact(name, tel)

    when 2
        remove_contact
    when 3
        edit_contact
    when 4
        puts 'Lista de contatos'
        show
        puts '-----'
    when 5
        puts 'sair'
        break
    else
        puts 'Opção inválida'
    end
end 