SELECT 
  Date,
	Region,
	Small_Bags,
	Large_Bags,
	XLarge_Bags,
	Total_Bags,
	Small_Bags + Large_Bags + XLarge_Bags AS Total_Bags_Calc
FROM database