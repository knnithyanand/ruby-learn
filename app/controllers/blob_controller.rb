require 'mongo'
class BlobController < ApplicationController
  def serve
    blob_path = env["PATH_INFO"].gsub("/blob/", "")
    begin
      blob_obj = Mongo::GridFileSystem.new(Mongo::DB.new('ruby_learn_development', Mongo::MongoClient.new)).open(blob_path, 'r')
      self.response_body = blob_obj.read
      self.content_type = blob_obj.content_type
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = blob_path
    end
  end
end
