In the csv file, daily bond yields in different countries. To to the different trading days across the countries, we must merge the data before furthur anylasis. In "merge_zoo.R" the data is readed and merged in such a manner that at least one bond is active on the day, the date is listed as a row. The value for inactive bond on this day is set as the value one day before.