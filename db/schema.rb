# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140609150248) do

  create_table "druzynas", force: true do |t|
    t.string   "nazwa"
    t.string   "miasto_pochodzenia"
    t.string   "nazwisko_trenera"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meczs", force: true do |t|
    t.integer  "gospodarz_id"
    t.integer  "gosc_id"
    t.integer  "punkty_gospodarzy"
    t.integer  "punkty_gosci"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meczs", ["gosc_id"], name: "index_meczs_on_gosc_id"
  add_index "meczs", ["gospodarz_id"], name: "index_meczs_on_gospodarz_id"

  create_table "pilkarzs", force: true do |t|
    t.string   "imie"
    t.string   "nazwisko"
    t.integer  "ileGoli"
    t.integer  "ile_zoltych_kartek"
    t.integer  "ile_czerwonych"
    t.integer  "druzyna_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pilkarzs", ["druzyna_id"], name: "index_pilkarzs_on_druzyna_id"

  create_table "przebieg_meczus", force: true do |t|
    t.date     "data_meczu"
    t.string   "miejsce_meczu"
    t.string   "druzyna"
    t.integer  "w_ktorej_minucie_gol"
    t.integer  "wynik_meczu"
    t.integer  "rankingMeczy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "przebieg_meczus", ["rankingMeczy_id"], name: "index_przebieg_meczus_on_rankingMeczy_id"

  create_table "ranking_meczies", force: true do |t|
    t.date     "dataMeczu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "szczegoly_wydarzenia", force: true do |t|
    t.date     "data_wydarzenia"
    t.integer  "ile_goli"
    t.integer  "czerwone_kartki"
    t.integer  "zolte_kartki"
    t.integer  "pilkarz_id"
    t.integer  "mecz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "szczegoly_wydarzenia", ["mecz_id"], name: "index_szczegoly_wydarzenia_on_mecz_id"
  add_index "szczegoly_wydarzenia", ["pilkarz_id"], name: "index_szczegoly_wydarzenia_on_pilkarz_id"

  create_table "wydarzenies", force: true do |t|
    t.date     "data_meczu"
    t.string   "zawodnik_nazwisko"
    t.integer  "w_ktorej_minucie_gol"
    t.string   "czerwona_kartka"
    t.string   "zolta_kartka_string"
    t.integer  "pilkarz_id"
    t.integer  "mecz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wydarzenies", ["mecz_id"], name: "index_wydarzenies_on_mecz_id"
  add_index "wydarzenies", ["pilkarz_id"], name: "index_wydarzenies_on_pilkarz_id"

end
