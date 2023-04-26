conn = Faraday.new(
    url: "https://api.themoviedb.org/3/",
    api_key: [ENV['TMDB_KEY']]
    params: {param: '1'},
    headers: {'Content-Type' => 'application/json'}
  )
  