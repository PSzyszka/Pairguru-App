class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    title = record.title
    if !is_valid?(title)
      record.errors.add(title, "brackets cannot be empty")
    end
  end

  def is_valid?(title)
    array_of_opening_brackets = []
    opening_brackets = ['[', '{', '(']
    closing_brackets = [']', '}', ')']

    title.split("").each_with_index do |val, index|
      if opening_brackets.include?(val)
        if title.split("")[index+1] =~ /[a-zA-Z0-9]/
          array_of_opening_brackets << val
        else
          return false
        end
      elsif closing_brackets.include?(val)
        bracket_value = opening_bracket(val)
        if bracket_value == array_of_opening_brackets.last
          array_of_opening_brackets.pop
        else
          return false
        end
      end
    end
    array_of_opening_brackets == []
  end

  def opening_bracket(bracket)
    if bracket == ']'
      '['
    elsif  bracket == '}'
      '{'
    elsif  bracket == ')'
      '('
    end
  end
end
