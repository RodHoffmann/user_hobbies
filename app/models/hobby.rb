class Hobby < ApplicationRecord
  has_many :user_hobbys, dependent: :destroy
  has_many :users, through: :user_hobbys

  HOBBY_NAMEN = %w[Malen Wandern Lesen Tanzen Fotografieren
    Schreiben Schwimmen Gartenarbeit Kochen Angeln Singen Basteln
    Radfahren Reisen Musizieren Yoga Klettern Stricken Segeln
    Skifahren Tauchen Sammeln Brettspiele Modellbau Volleyball
    Surfen Theater Geocaching Handarbeit Fernsehen Rätseln Pilze
    sammeln Meditieren Skaten Zeichnen Billardspielen Gärtnern Tennis
    Tischtennis Laufen Jagen Golfen Fotobearbeitung Kajakfahren Segelfliegen
    Bogenschießen Drachenfliegen Schach Schnitzen Puzzeln Drachensteigen
    Einradfahren Fallschirmspringen Windsurfen Stand-up-Paddeln].freeze

  validates :name, presence: true, uniqueness: true, inclusion: { in: HOBBY_NAMEN }
end
