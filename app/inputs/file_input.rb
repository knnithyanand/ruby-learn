# app/inputs/ozi_inputs/file_input
  class FileInput < SimpleForm::Inputs::FileInput
    def input_html_classes
      super.push('filestyle')
    end
  end
