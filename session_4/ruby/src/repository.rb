class Repository
  @@data = []

  def self.all
    @@data
  end

  def self.store(something)
    something.merge!('id' => SecureRandom.hex)
    @@data << something
    something
  end

  def self.delete(id)
    @@data.delete_if { |entry| entry['id'] == id }
  end

  def self.update(something)
    found = @@data.find { |entry| entry['id'] = something['id'] }
    found.merge!('review' => something['review'])

    @@data.delete_if { |entry| entry['id'] == something['id'] }
    @@data << found
    found
  end
end
