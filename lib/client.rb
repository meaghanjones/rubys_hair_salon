class Client
  attr_reader(:name, :id)

  define_method(:intialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attibutes[:id]
  end

end
