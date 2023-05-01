require 'faraday'
require 'json'

class TmdbService
    #BASE_URL = 'https://api.themoviedb.org/3/'
    def get_show_by_title(query)
        response = Faraday.get("https://api.themoviedb.org/3/search/tv?api_key=#{ENV['TMDB_KEY']}&query=#{query}")
        if response.status == 200
            result = JSON.parse(response.body)['results']
            return result
            #return response
        else
            return nil
        end
        #parsed_response = JSON.parse(response)
       # parsed_response['Title']
    end

    def get_shows_by_streaming_service(query)
        response = Faraday.get("https://api.themoviedb.org/3/search/company?api_key=#{ENV['TMDB_KEY']}&query=#{query}")
        if response.status == 200
            return response
        else
            return nil
        end
    end

    #quick note, so the idea here is once you pull the show you then have the season number. I'll then create buttons that call the season list and THEN you can add that to your Seasons. You can then review the show or the season. THAT's IT
    def get_show_by_id(query)
        response = Faraday.get("https://api.themoviedb.org/3/tv/#{query}?api_key=#{ENV['TMDB_KEY']}")
        if response.status == 200
            result = JSON.parse(response.body)
            return result
            #return response
        else
            return nil
        end
    end

    def get_season_by_id(id)
        response = Faraday.get("https://api.themoviedb.org/3/tv/#{id}/seasons?api_key=#{ENV['TMDB_KEY']}")
        if response.status == 200
            result = JSON.parse(response.body)
            return result
            #return response
        else
            #eturn response
            return nil
        end
    end

end