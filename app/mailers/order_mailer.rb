class OrderMailer < ApplicationMailer
  default from: "gregimbeau@gmail.com"

  def confirmation_order(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url = "http://monsite.fr/login"
     # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: "Bienvenue chez nous !")
    mail(to: "adminpcthp@yopmail.com", subject: "Bienvenue chez nous !")
  end
end
