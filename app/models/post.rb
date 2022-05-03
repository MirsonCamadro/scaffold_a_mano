class Post < ApplicationRecord
    enum status: [:soltero, :en_pareja, :casado, :muerto]
end
