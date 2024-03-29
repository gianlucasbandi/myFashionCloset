require "http"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Articolo

    def self.save_top_popular_articles

        capos = []
        semaphore = Mutex.new

        #woman main Forever 21
        t1 = Thread.new{
            begin
                response = HTTP.timeout(10).get("https://apidojo-forever21-v1.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&category=woman_main&pageSize=15&pageNumber=1&sortby=0")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        

            #nuovi Arrivi Forever 21
        
            begin
                response = HTTP.timeout(10).get("https://apidojo-forever21-v1.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&category=women_new_arrivals_clothing&pageSize=15&pageNumber=2&sortby=0")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        }

        #Nuovi Arrivi Asos
        t2 = Thread.new{
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=2623&categoryId=25423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end 
        


            #Accessori Asos
     
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=25423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end 
        }


        #Pants e leggins Asos
        t3 = Thread.new{
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27420&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end 
        

            #Shoes ASOS
        
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27416&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        }


        #Sweaters e cardigans ASOS
        t4 = Thread.new{
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27409&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        


            #Jeans ASOS
        
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27405&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        }

        #Hoodies & Sweatshirts ASOS
        t5 = Thread.new{
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27423&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        

            #Dresses ASOS
        
            begin
                response = HTTP.timeout(10).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=3dfed89925msh97b715da7689ea4p134ae2jsne04d3a93e2a5&store=US&offset=0&categoryId=27399&limit=8&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
                    semaphore.lock
                    capos.push(c)
                    semaphore.unlock
                    #c.save!
                end
            end
        }

        t1.join
        t2.join
        t3.join
        t4.join
        t5.join

        capos.each do |c|
            c.save!
        end
        
        return true
    end
end