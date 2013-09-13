require_relative '../config'

# "title"
# "firstname"
# "middlename"
# "lastname"
# "name_suffix"
# "nickname"
# "party"
# "state"
# "district"
# "in_office"
# "gender"
# "phone"
# "fax"
# "website"
# "webform"
# "congress_office"
# "bioguide_id"
# "votesmart_id"
# "fec_id"
# "govtrack_id"
# "crp_id"
# "twitter_id"
# "congresspedia_url"
# "youtube_url"
# "facebook_id"
# "official_rss"
# "senate_class"
# "birthdate"


class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :nickname
      t.string :district
      t.string :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :bioguide_id
      t.string :votesmart_id
      t.string :fec_id
      t.string :govtrack_id
      t.string :crp_id
      t.string :twitter_id
      t.string :congresspedia_url
      t.string :youtube_url
      t.string :facebook_id
      t.string :official_rss
      t.string :senate_class
      t.string :birthdate

      t.integer :state_id
      t.integer :party_id
      t.integer :title_id

      t.timestamps
    end

    create_table :states do |t|
      t.string :name

      t.timestamps
    end

    create_table :titles do |t|
      t.string :name

      t.timestamps
    end

    create_table :parties do |t|
      t.string :name

      t.timestamps
    end

  end
end