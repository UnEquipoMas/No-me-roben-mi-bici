class Contact <MailForm::Base
    attribute :nombre, :validate => true
    attribute :correo, :validate => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    attribute :mensaje, :validate => true
    
    
    
   def headers 
       {
        :subject => "Formulario de Contacto",
        :to => "dahoyosr@unal.edu.co",
        :from => %("#{nombre}") 
       }
   end
    
end