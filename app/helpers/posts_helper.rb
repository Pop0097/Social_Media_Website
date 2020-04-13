module PostsHelper
  def post_file_for(post, options = {size: 200})
    size = options[:size]
    if post.post_file?
      image_tag post.post_file.url(:thumb), width: size
    end
  end
end
