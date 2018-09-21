class UploadUserStoryController < ApplicationController
  def index
  end
  def upload
  	if params[:file].blank?
  		return redirect_to :back
  	end
  	@digital_number_patterns = [[" _ ", "| |", "|_|"],["   ","  |","  |"],[" _ ", " _|", "|_ "],[" _ ", " _|", " _|"],["   ","|_|", "  |"],[" _ ", "|_ ", " _|"],[" _ ", "|_ ", "|_|"],[" _ ", "  |", "  |"],[" _ ", "|_|", "|_|"],[" _ ", "|_|", " _|"]]
  	@list_of_coverted_numbers =[]
  	arrary_of_digital_number = []
  	ignore_line_number = 4 
  	File.open(params[:file].path).each_with_index do |line,i| 
    	if (i+1) % ignore_line_number == 0
    	else  
      	arrary_of_digital_number << line
    	end
  	end
  	arrary_of_digital_number_with_group_of_three_element = arrary_of_digital_number.each_slice(3).to_a
  	arrary_of_digital_number_with_group_of_three_element.each do |element|
    	print_digital(element)
  	end
  	@list_of_coverted_numbers.each_slice(9).to_a.each do |list_of_coverted_number|
  		File.open("output_user_story_1.txt", "a") do |f|
  			f.write(list_of_coverted_number.join()) 
  			f.write("\n")
  		end 
		end
		send_file(File.open('output_user_story_1.txt').path , :filename => 'output_user_story_1')
  end
  def print_digital(element)
    if  element.count == 1
      data_string = ""
      data_string_new = data_string.concat(' '*27)
      element[0] = data_string + element[0] 
      element[1] = data_string + element[0]
      element[2] = data_string + element[0]
    end
    if element[0].size == 1
      data_string = ""
      data_string_new = data_string.concat(' '*27)
      element[0] = data_string + element[0] 
    else
      element[0] = element[0]
    end 
    if element[1].size == 1
      data_string = ""
      data_string_new = data_string.concat(' '*27)
      element[1] = data_string + element[1] 
    else
      element[1] =element[1]
    end 
    if element[2].size == 1
      data_string = ""
      data_string_new = data_string.concat(' '*27)
      element[2] = data_string + element[2] 
    else
      element[2] = element[2]
    end 
    9.times.map do |t|
	    first_list = element[0].delete("\n").split('').each_slice(3).to_a[t] 
	    second_list = element[1].delete("\n").split('').each_slice(3).to_a[t] 
	    third_list = element[2].delete("\n").split('').each_slice(3).to_a[t] 
	    combine_list = []
	    combine_list << first_list.join() << second_list.join() << third_list.join()
	    if @digital_number_patterns.each_index.select{|i| @digital_number_patterns[i] == combine_list}
	      @list_of_coverted_numbers << @digital_number_patterns.each_index.select{|i| @digital_number_patterns[i] == combine_list}[0]
	    else
	      @list_of_coverted_numbers << "?"
	    end
  end
 end
end
