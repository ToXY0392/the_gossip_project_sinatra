require 'csv'

class Gossip
  attr_accessor :author, :content

  # Constructeur : un gossip a un auteur et un contenu
  def initialize(author, content)
    @author  = author
    @content = content
  end

  # Sauvegarde un potin dans db/gossip.csv
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  # Retourne tous les potins sous forme d'objets Gossip
  def self.all
    all_gossips = []

    # Si le fichier n'existe pas encore, on renvoie un tableau vide
    return all_gossips unless File.exist?("./db/gossip.csv")

    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end

    all_gossips
  end

  # Trouve un gossip par son id (1-based)
  def self.find(id)
    all_gossips = self.all
    all_gossips[id - 1]   # id 1 → index 0
  end

  # Met à jour un gossip (auteur + contenu) en fonction de son id (1-based)
  def self.update(id, new_author, new_content)
    gossips_array = []

    if File.exist?("./db/gossip.csv")
      gossips_array = CSV.read("./db/gossip.csv")
    end

    index = id - 1
    if gossips_array[index]
      gossips_array[index][0] = new_author
      gossips_array[index][1] = new_content
    end

    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips_array.each do |row|
        csv << row
      end
    end
  end

  # Supprime un gossip en fonction de son id (1-based)
  def self.delete(id)
    return unless File.exist?("./db/gossip.csv")

    gossips_array = CSV.read("./db/gossip.csv")

    index = id - 1
    return unless gossips_array[index]

    gossips_array.delete_at(index)

    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips_array.each do |row|
        csv << row
      end
    end
  end
end
