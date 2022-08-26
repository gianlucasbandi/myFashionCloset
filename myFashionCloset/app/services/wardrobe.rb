class Wardrobe
    def self.add_to_wardrobe(id, user)
        if Guardaroba.where("nome_capo = ?", id.nome).group(:nome).count == {}
            g = Guardaroba.new
            g.user_id = user
            g.immagine_capo = id.immagine
            g.nome_capo = id.nome
            g.url = id.descrizione
            g.sito = id.sito
            g.save!
        end
    end
end