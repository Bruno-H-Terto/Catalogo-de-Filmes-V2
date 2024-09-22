class Director < ApplicationRecord
  belongs_to :gender
  validates :name, :nationality, :birthday, presence: true
  validate :must_be_adult
  before_save :format_name

  def format_name
    self.name = name.split(' ').map{ |p| p.capitalize}.join( ' ') 
  end

  def self.nationalities
     [
      "Afegã", "Albanesa", "Alemã", "Andorrana", "Angolana", "Antiguana", "Árabe", "Argentina",
      "Armênia", "Australiana", "Austríaca", "Azerbaijana", "Bahamenha", "Bahrainita", "Bangladeshiana", 
      "Barbadiana", "Belga", "Belizenha", "Beninense", "Bielo-russa", "Boliviana", "Bósnia", "Botsuanesa", 
      "Brasileira", "Britânica", "Bruneiana", "Búlgara", "Burquinense", "Burundiana", "Butanesa", 
      "Cabo-verdiana", "Camaronesa", "Canadense", "Cazaque", "Chadiana", "Chilena", "Chinesa", "Cingapuriana", 
      "Colombiana", "Comorense", "Congolesa", "Costarriquenha", "Croata", "Cubana", "Dinamarquesa", "Djibutiana", 
      "Dominicana", "Egípcia", "Equatoriana", "Eritreia", "Escocesa", "Eslovaca", "Eslovena", "Espanhola", 
      "Estadunidense", "Estoniana", "Etíope", "Fijiana", "Filipina", "Finlandesa", "Francesa", "Gabonesa", 
      "Gambiana", "Ganesa", "Georgiana", "Grega", "Grenadiana", "Guadalupense", "Guatemalteca", "Guianense", 
      "Guineense", "Haitiana", "Holandesa", "Hondurenha", "Húngara", "Islandesa", "Indiana", "Indonésia", 
      "Iraquiana", "Iraniana", "Irlandesa", "Israelense", "Italiana", "Jamaicana", "Japonesa", "Jordana", 
      "Letã", "Libanesa", "Liberiana", "Líbia", "Lituana", "Luxemburguesa", "Macedônia", "Madagascarense", 
      "Malaia", "Malauiana", "Maldiva", "Mali", "Maltesa", "Marroquina", "Mexicana", "Moçambicana", "Moldávia", 
      "Mongol", "Montenegrina", "Namíbia", "Nepalesa", "Neozelandesa", "Níger", "Nigeriana", "Norueguesa", 
      "Paquistanesa", "Panamenha", "Paraguaia", "Peruana", "Polonesa", "Porto-riquenha", "Portuguesa", 
      "Queniana", "Romena", "Russa", "Salvadorenha", "Samoana", "Senegalesa", "Sérvia", "Síria", "Somali", 
      "Sul-africana", "Sueca", "Suíça", "Surinamesa", "Tailandesa", "Tanzaniana", "Tcheca", "Timorense", 
      "Trinidense", "Tunisiana", "Turca", "Ucraniana", "Ugandense", "Uruguaia", "Venezuelana", "Vietnã", 
      "Zambiana", "Zimbabuense"
    ]
end

def must_be_adult
  if self.birthday.nil? || self.birthday > 18.years.ago.to_date
    return errors.add(:birthday, "O usuário deve ter pelo menos 18 anos.")
  end
end


end
