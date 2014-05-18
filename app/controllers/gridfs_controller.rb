require 'mongo'
class GridfsController < ApplicationController
before_filter :authenticate_user!
  def serve
    gridfs_path = env["PATH_INFO"].gsub("/gridfs/", "")
    begin
      gridfs_file = Mongo::GridFileSystem.new(Mongo::DB.new('ruby_learn_development', Mongo::MongoClient.new)).open(gridfs_path, 'r')
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = current_user.image.url
    end
  end
end
