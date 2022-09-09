require "http"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Articolo

    def self.save_top_popular_articles

        #woman main Forever 21
        begin
            response = HTTP.timeout(10).get("https://apidojo-forever21-v1.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&category=woman_main&pageSize=15&pageNumber=1&sortby=0")
        rescue => e
            return false
        end
        results = response.parse['CatalogProducts']

        results.each do |r|
            if Capo.where("nome = ?", r['DisplayName']).group(:nome).count == {}
                c = Capo.new
                c.sito = 'Forever 21'
                c.categoria = r['CategoryName']
                c.immagine = r['DefaultProductImage']
                c.nome = r['DisplayName']
                c.descrizione = r['ProductShareLinkUrl']
                c.save!
            end
        end

        #nuovi Arrivi Forever 21
        begin
            response = HTTP.timeout(10).get("https://apidojo-forever21-v1.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&category=women_new_arrivals_clothing&pageSize=15&pageNumber=2&sortby=0")
        rescue => e
            return false
        end
        results = response.parse['CatalogProducts']

        results.each do |r|
            if Capo.where("nome = ?", r['DisplayName']).group(:nome).count == {}
                c = Capo.new
                c.sito = 'Forever 21'
                #c.categoria = r['CategoryName']
                c.categoria = 'New in'
                c.immagine = r['DefaultProductImage']
                c.nome = r['DisplayName']
                c.descrizione = r['ProductShareLinkUrl']
                c.save!
            end
        end

        #Nuovi Arrivi Asos
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=2623&categoryId=25423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = 'New in'
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end 

        #Accessori Asos
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=25423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end 

        #Pants e leggins Asos
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27420&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end 

        #Shoes ASOS
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27416&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end

        #Sweaters e cardigans ASOS
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27409&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end

        #Jeans ASOS
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27405&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end

        #Hoodies & Sweatshirts ASOS
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end

        #Dresses ASOS
        begin
            response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=35a27c5c76mshb714784ccca50e1p1bb29bjsncfebb6da8fd0&store=US&offset=0&categoryId=27399&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
        rescue => e
            return false
        end
        results = response.parse['products']
        categ = response.parse['categoryName']

        results.each do |r|
            if Capo.where('nome = ?', r['name']).group(:nome).count == {} 
                c = Capo.new
                c.sito = 'Asos'
                c.categoria = categ
                c.immagine = 'https://'+r['imageUrl']
                c.nome = r['name']
                c.descrizione = 'https://asos.com/'+r['url']
                c.save!
            end
        end

        return true
    end
end