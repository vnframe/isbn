require "sinatra"
require_relative "isbnfunct.rb"
require_relative "awsfunc.rb"

get "/" do 
    erb :index
end

post "/index" do 
    id = params[:isbn]
    #p "ID is an #{id.class}"

    if choose_isbn_type(id) == false
        redirect "/invalid?isbn=" + id
    else 
         redirect "/valid?isbn=" + id
    end
    #puts "ID is #{id.class}"
    #connect_to_bucket(id)
end
get "/valid" do 
    id = params[:isbn]
    id = id + ", " + "valid" + "\n"
    connect_to_bucket(id)
    erb :valid, locals: {id: id}
end
get "/invalid" do 
    id = params[:isbn]
    id = id + ", " + "invalid" + "\n"
    connect_to_bucket(id)
    #id = get_file()
    erb :invalid, locals: {id: id}
end
get "/index" do
    erb :index
end
get "/results" do
    id = params[:isbn]

    erb :results
end 