# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
def use_tinymce
    @content_for_tinymce = "" 
    content_for :tinymce do
      javascript_include_tag "tiny_mce/tiny_mce"
    end
    @content_for_tinymce_init = "" 
    content_for :tinymce_init do
      javascript_include_tag "mce_editor"
    end
end

def title(page_title)
  content_for(:title) { page_title }
end
end
