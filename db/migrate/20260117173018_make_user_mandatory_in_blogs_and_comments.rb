class MakeUserMandatoryInBlogsAndComments < ActiveRecord::Migration[8.1]
  def change
    change_column_null :blogs, :user_id, false
    change_column_null :comments, :user_id, false
  end
end
