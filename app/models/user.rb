# frozen_string_literal: true

# == Schema Information

# Table name: users

# id                   :integer
# email                :sting
# created_at           :datetime
# updated_at           :datetime


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
