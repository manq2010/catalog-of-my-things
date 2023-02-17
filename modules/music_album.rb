class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, published_date, archived: true)
    super(published_date, archived: archived)
    @on_spotify = on_spotify
  end

  def to_json(*_args)
    { 'on_spotify' => @on_spotify, 'published_date' => @published_date }
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
