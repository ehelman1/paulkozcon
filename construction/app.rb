require "sinatra" 
require "pony"

load "./local_env.rb" if File.exist?("./local_env.rb")

get '/' do

	erb :index 

end

get '/about' do

	erb :about 

end

get '/contact' do

	erb :contact 

end

get '/portfolio-1-col' do

    erb :portfolio-1-col

end

get '/portfolio-2-col' do

    erb :portfolio-2-col
    
end

get '/portfolio-3-col' do

    erb :portfolio-3-col
    
end

get '/events' do

	erb :events

end

get '/members' do

    erb :members

end

post '/contact-form' do
  name = params[:name]
  from = params[:email]
  to = "#{from}"                   
  comments = params[:message]
  subject= params[:subject]

    Pony.mail(
        :to => to,
        :bcc => 'eddhelman@gmail.com', 
        :from => 'eddhelman@gmail.com',
        :subject => "Nemacolin vfd ", 
        :content_type => 'text/html', 
        :body => erb(:email2,:layout=>false),
        :via => :smtp, 
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
           :user_name           => ENV['user_email'],
           :password            => ENV['user_email_pass'],
           :authentication       => :plain, 
           :domain               => "nemacolinvfd.herokuapp.com" 
        }
      )

  erb :contact 
end 