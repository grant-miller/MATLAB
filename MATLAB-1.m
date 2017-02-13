% =====================================================================================
%	Author		: Grant Miller
%	Date		: 01/19/2017
%	Project		: Simple MATLAB Functions
%	README		:
%	Run the program in MATLAB R2016b.
%	Use the Display Menu provided in the below program to execute the required
%	functionality by entering the corresponding number next to each menu item.
%	Before executing the program, please ensure that the 'Balloon.tif' image file
%	is located within the same folder as the Source Code file.
% =====================================================================================

% -------------------------------------------------------------------------------------
%	Clearing the Command Window, Removing Previous Items from the Workspace, and
%	Closing Figure Windows
% -------------------------------------------------------------------------------------

clc;		% Clear Command Window
clear;		% Remove Previous Items from the Workspace ( freeing up system memory )
close all;	% Close Figure Windows

% -------------------------------------------------------------------------------------
%	Initial Variable Declarations
% -------------------------------------------------------------------------------------

image_name = 'Balloon.tif';

% -------------------------------------------------------------------------------------
%	Displaying Program Introduction
% -------------------------------------------------------------------------------------

disp( '+ ---------------------------------------------------------------------- +' );
disp( '|                   Welcome to Grant Miller''s Project                    |' );
disp( '+ ---------------------------------------------------------------------- +' );

% -------------------------------------------------------------------------------------
%	Begin Program
% -------------------------------------------------------------------------------------

while 1
	
	% -------------------------------------------------------------------------------------
	%	Display Menu
	% -------------------------------------------------------------------------------------
	
	disp( [ char(10) 'Choose an option from the menu below:' char(10) ] );
	
	disp( [ char(9) '1. Read the image into the workspace using the function `imread`' ] );
	disp( [ char(9) '2. Display the image using the function `imshow`' ] );
	disp( [ char(9) '3. Convert the color image into grayscale using function `rgb2gray`' ] );
	disp( [ char(9) '4. Display the histogram of the grayscale version using function `imhist`' ] );
	disp( [ char(9) '5. Enlarge the grayscale image by four times using function `imresize`' ] );
	disp( [ char(9) '6. Crop the enlarged image to its original size using function `imcrop`' ] );
	disp( [ char(9) '7. Display the image size, average intensity, maximum and minimum intensity' ] );
	disp( [ char(9) '8. Save the image into a file named ''output.jpg'' using function `imwrite`' ] );
	disp( [ char(9) '9. Exit the program' char(10) ] );
	
	menu_option = input( 'input > ', 's' );
	
	switch menu_option
		
		case '1'
			
			% -------------------------------------------------------------------------------------
			%	Read the image into the workspace using the function `imread`
			% -------------------------------------------------------------------------------------
			
			if exist( image_name, 'file' )
				balloon = imread( image_name );
				[ original_height, original_width, ~ ] = size( balloon );
				disp( [ char(10) 'Success: The image ''' image_name ''' has been read into the workspace.' ] );
			else
				disp( [ char(10) 'Error: Unable to locate ''' image_name '.''' ] );
			end
			
		case '2'
			
			% -------------------------------------------------------------------------------------
			%	Display the image using the function `imshow`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				imshow( balloon );
				disp( [ char(10) 'Success: The image has been displayed.' ] );
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '3'
			
			% -------------------------------------------------------------------------------------
			%	Convert the color image into grayscale using function `rgb2gray`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				
				if size( balloon, 3 ) > 1
					balloon = rgb2gray( balloon );
					disp( [ char(10) 'Success: The image has been converted to grayscale.' ] );
				else
					disp( [ char(10) 'Error: The image has already been converted to grayscale.' ] );
				end
				
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '4'
			
			% -------------------------------------------------------------------------------------
			%	Display the histogram of the grayscale version using function `imhist`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				
				if size( balloon, 3 ) <= 1
					imhist( balloon );
					disp( [ char(10) 'Success: The histogram of the grayscale image has been displayed.' ] );
				else
					disp( [ char(10) 'Error: Please convert the image to grayscale first.' ] );
				end
				
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '5'
			
			% -------------------------------------------------------------------------------------
			%	Enlarge the grayscale image by four times using function `imresize`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				
				if size( balloon, 3 ) <= 1
					balloon = imresize( balloon, 4 );
					disp( [ char(10) 'Success: The grayscale image has been enlarged by four times.' ] );
				else
					disp( [ char(10) 'Error: Please convert the image to grayscale first.' ] );
				end
				
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '6'
			
			% -------------------------------------------------------------------------------------
			%	Crop the enlarged image to its original size using function `imcrop`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				
				[ height, width, ~ ] = size( balloon );
				
				if width > original_width & height > original_height
					balloon = imcrop( balloon, [ 0 0 original_width original_height ] );
					disp( [ char(10) 'Success: The grayscale image has been cropped to its original size.' ] );
				else
					disp( [ char(10) 'Error: Please enlarge the image before cropping to its original size.' ] );
				end
				
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '7'
			
			% -------------------------------------------------------------------------------------
			%	Display the image size, average intensity, maximum and minimum intensity
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				
				[ height, width, ~ ] = size( balloon );
				
				average_intensity = mean( mean( balloon( : ) ) );
				maximum_intensity = max( balloon( : ) );
				minimum_intensity = min( balloon( : ) );
				
				disp( [ char(10) 'Width: ' num2str( width ) ] );
				disp( [ 'Height: ' num2str( height ) ] );
				disp( [ 'Average Intensity: ' num2str( average_intensity ) ] );
				disp( [ 'Maximum Intensity: ' num2str( maximum_intensity ) ] );
				disp( [ 'Minimum Intensity: ' num2str( minimum_intensity ) ] );
				
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '8'
			
			% -------------------------------------------------------------------------------------
			%	Save the image into a file named 'output.jpg' using function `imwrite`
			% -------------------------------------------------------------------------------------
			
			if exist( 'balloon', 'var' )
				imwrite( balloon, 'output.jpg' )
				disp( [ char(10) 'Success: The image has been saved into a file named ''output.jpg''.' ] );
			else
				disp( [ char(10) 'Error: Please read the image into the workspace first.' ] );
			end
			
		case '9'
			
			% -------------------------------------------------------------------------------------
			%	Exit Program
			% -------------------------------------------------------------------------------------
			
			disp( [ char(10) 'Thank you for using Grant Miller''s Project... Have a blessed day!' ] );
			break
			
		otherwise
			
			% -------------------------------------------------------------------------------------
			%	Error Check for Invalid Input
			% -------------------------------------------------------------------------------------
			
			disp( [ char(10) 'Error: You have entered invalid input... Try again!' ] );
		
	end
end
