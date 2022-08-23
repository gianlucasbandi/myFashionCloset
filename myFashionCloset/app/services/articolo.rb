require "http"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Articolo

    def self.save_top_popular_articles
        begin
            response = HTTP.timeout(10).get("https://apidojo-forever21-v1.p.rapidapi.com/products/v2/list?rapidapi-key=be7855dbfdmsh78d21456e4171a3p1258ddjsnf92a8521672f&category=women_main&pageSize=100&pageNumber=2&sortby=0")
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

        begin
            response = HTTP.timeout(3).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=be7855dbfdmsh78d21456e4171a3p1258ddjsnf92a8521672f&store=US&offset=0&categoryId=2623&categoryId=25423&limit=48&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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

        begin
            response = HTTP.timeout(3).get("https://asos2.p.rapidapi.com/products/v2/list?rapidapi-key=be7855dbfdmsh78d21456e4171a3p1258ddjsnf92a8521672f&store=US&offset=0&categoryId=25423&limit=48&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US")
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
        