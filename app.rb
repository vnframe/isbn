require "sinatra"
require_relative "isbnfunct.rb"

get "/" do 
    erb :index
end

post "/index" do 
    id = params[:isbn]
    if choose_isbn_type(id) == false
        redirect "/invalid?isbn=" + id
    else 
         redirect "/valid?isbn=" + id
    end
end
get "/valid" do 
    id = params[:isbn]
    erb :valid, locals: {id: id}
end
get "/invalid" do 
    id = params[:isbn]
    erb :invalid, locals: {id: id}
end