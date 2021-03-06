-- Use Cinema
USE [Cinema];
GO

-- Check if sp_CreateGenre procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateGenre')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateGenre]
		AS
		BEGIN
			SELECT * FROM [Genre];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateGenre Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateGenre Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateGenre]
	-- Param as GenreName
	@GenreName VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [GenreName] FROM [Genre] WHERE [GenreName] = @GenreName)
		BEGIN
			IF @GenreName IS NOT NULL
			BEGIN
				INSERT INTO [Genre] ([GenreName])
				VALUES (@GenreName);
			END
			ELSE
			BEGIN
				--RAISERROR('Genre Name Should Not Be Null', 16, 1);
				PRINT 'Genre Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
				PRINT @GenreName + ' : Genre Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
				PRINT @GenreName + ' : Genre Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
			PRINT @GenreName + ' : Genre Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
			PRINT @GenreName + ' : Genre Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO





-- Check if sp_CreateCategory procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateCategory')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateCategory]
		AS
		BEGIN
			SELECT * FROM [Category];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateCategory Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateCategory Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateCategory]
	-- Params as Name, Description
	@CategoryName VARCHAR(255),
	@CategoryDescription VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [Name] FROM [Category] WHERE [Name] = @CategoryName)
		BEGIN
			IF @CategoryName IS NOT NULL
			BEGIN
				INSERT INTO [Category] ([Name], [Description])
				VALUES (@CategoryName, @CategoryDescription);
			END
			ELSE
			BEGIN
				--RAISERROR('Category Name Should Not Be Null', 16, 1);
				PRINT 'Category Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
				PRINT @CategoryName + ' : Category Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
				PRINT @CategoryName + ' : Category Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
			PRINT @CategoryName + ' : Category Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
			PRINT @CategoryName + ' : Category Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO





-- Check if sp_CreateRating procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateRating')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateRating]
		AS
		BEGIN
			SELECT * FROM [Rating];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateRating Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateRating Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateRating]
	-- Param as RatingName, RatingDescription
	@RatingName VARCHAR(255),
	@RatingDescription VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [RatingName] FROM [Rating] WHERE [RatingName] = @RatingName)
		BEGIN
			IF @RatingName IS NOT NULL
			BEGIN
				INSERT INTO [Rating] ([RatingName], [RatingDescription])
				VALUES (@RatingName, @RatingDescription);
			END
			ELSE
			BEGIN
				--RAISERROR('Rating Name Should Not Be Null', 16, 1);
				PRINT 'Rating Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
				PRINT @RatingName + ' : Rating Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
				PRINT @RatingName + ' : Rating Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
			PRINT @RatingName + ' : Rating Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
			PRINT @RatingName + ' : Rating Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateCustomer procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateCustomer')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateCustomer]
		AS
		BEGIN
			SELECT * FROM [Customer];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateCustomer Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateCustomer Already exists';
END
GO

-- Alter sp_CreateCustomer to what we want
ALTER PROCEDURE [sp_CreateCustomer]
	-- Param as FirstName, LastName, Gender, DOB, Email
	@FirstName VARCHAR(255),
	@LastName VARCHAR(255),
	@Gender CHAR(1),
	@DOB DATE,
	@Email VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [Email] FROM [Customer] WHERE [Email] = @Email)
		BEGIN
			IF @FirstName IS NOT NULL AND @Gender IS NOT NULL AND @DOB IS NOT NULL AND @Email IS NOT NULL
			BEGIN
				INSERT INTO [Customer] ([FirstName], [LastName], [Gender], [DOB], [Email])
				VALUES (@FirstName, @LastName, @Gender, @DOB, @Email);
			END
			ELSE
			BEGIN
				--RAISERROR('Values should not be Null', 16, 1);
				PRINT 'Values Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
				PRINT 'Customer with email "' + @Email + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
				PRINT 'Customer with email "' + @Email + '" Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
			PRINT 'Customer with email "' + @Email + '" Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
			PRINT 'Customer with email "' + @Email + '" Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateAuditorium procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateAuditorium')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateAuditorium]
		AS
		BEGIN
			SELECT * FROM [Auditorium];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateAuditorium Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateAuditorium Already exists';
END
GO

-- Alter sp_CreateAuditorium to what we want
ALTER PROCEDURE [sp_CreateAuditorium]
	-- Param as AuditoriumName, Available_Seats
	@AuditoriumName VARCHAR(255),
	@AvailableSeats INT
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [AuditoriumName] FROM [Auditorium] WHERE [AuditoriumName] = @AuditoriumName)
		BEGIN
			IF @AuditoriumName IS NOT NULL AND @AvailableSeats IS NOT NULL
			BEGIN
				INSERT INTO [Auditorium] ([AuditoriumName], [Available_Seats])
				VALUES (@AuditoriumName, @AvailableSeats);
			END
			ELSE
			BEGIN
				--RAISERROR('Values should not be Null', 16, 1);
				PRINT 'Values Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR('Auditorium Name "' + @AuditoriumName + '" Already Exists', 16, 1);
				PRINT 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR('Auditorium Name "' + @AuditoriumName + '" Already Exists', 16, 1);
				PRINT 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR('Auditorium Name "' + @AuditoriumName + '" Already Exists', 16, 1);
			PRINT 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR('Auditorium Name "' + @AuditoriumName + '" Already Exists', 16, 1);
			PRINT 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateMovie procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateMovie')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateMovie]
		AS
		BEGIN
			SELECT * FROM [Movie];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateMovie Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateMovie Already exists';
END
GO


-- Check if fn_MoveGenre function exists
IF NOT EXISTS (
		SELECT 1
		FROM [INFORMATION_SCHEMA].[ROUTINES]
		WHERE [SPECIFIC_SCHEMA] = 'dbo' AND
		[SPECIFIC_NAME] = 'fn_MoveGenre' AND
		[ROUTINE_TYPE] = 'FUNCTION'
	) 
BEGIN
	-- Function in blocks have to be in EXEC
	EXEC('
		CREATE FUNCTION fn_MoveGenre()
			RETURNS @table TABLE (
				[GenreItem] INT
			)
		AS
		BEGIN
			INSERT INTO @table VALUES(1)
			RETURN;
		END
	')
END
ELSE
BEGIN
	--RAISERROR('Function fn_MoveGenre Already exist', 16, 1);
	PRINT 'Function fn_MoveGenre Already exists';
END
GO
GO

-- Alter fn_MoveGenre to what we want
ALTER FUNCTION fn_MoveGenre(@String VARCHAR(255))
	-- Return genre names as table
	RETURNS @table TABLE (
		[GenreItem] VARCHAR(255)
	)
AS
BEGIN
	DECLARE @Item VARCHAR(255);
    DECLARE @ItemList VARCHAR(255);
	DECLARE @DelimIndex INT;

	SET @ItemList = @String;
	SET @DelimIndex = CHARINDEX(',', @ItemList, 0);
	WHILE (@DelimIndex != 0)
	BEGIN
		SET @Item = SUBSTRING(@ItemList, 0, @DelimIndex);
		INSERT INTO @table
		VALUES (@Item);

		SET @ItemList = SUBSTRING(@ItemList, @DelimIndex + 1, LEN(@ItemList) - @DelimIndex);
		SET @DelimIndex = CHARINDEX(',', @ItemList, 0);
	END

	IF @Item IS NOT NULL
	BEGIN
		SET @Item = @ItemList
		INSERT INTO @table VALUES (@Item);
	END
	ELSE
	BEGIN
		INSERT INTO @table VALUES (@String);
	END

    RETURN;
END;
GO

-- Alter sp_CreateMovie to what we want
ALTER PROCEDURE [sp_CreateMovie]
	-- Param as Title, ReleaseDate, Runtime, RatingID
	--RatingID will be varchar since a rating name is unique
	@MovieTitle VARCHAR(255),
	@MovieReleaseDate DATE,
	@MovieRuntime TIME,
	@MovieRating VARCHAR(255),
	@MovieGenre VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (
				SELECT [m].[Title], [m].[ReleaseDate], [m].[Runtime], [m].[RatingID]
				FROM [Movie] [m]
				JOIN [Rating] [r]
				ON [r].[RatingID] = [m].[RatingID]
				WHERE [m].[Title] = @MovieTitle AND
				[m].[ReleaseDate] = @MovieReleaseDate AND
				[m].[Runtime] = @MovieRuntime AND
				[r].[RatingName] = @MovieRating
			)
		BEGIN
			IF @MovieTitle IS NOT NULL AND @MovieRating IS NOT NULL
			BEGIN
				
				IF NOT EXISTS (
						SELECT [g].[GenreName]
						FROM [Genre] [g]
						JOIN ( SELECT * from dbo.fn_MoveGenre(@MovieGenre) ) [itb1]
						ON [itb1].[GenreItem] = [g].[GenreName]
					)
				BEGIN
					PRINT 'Use the appropriate Genre(s)';
				END
				ELSE
				BEGIN
					DECLARE @GenreTbl TABLE
                                                 (GenreName VARCHAR(100));
					insert into @GenreTbl
					SELECT * from [dbo].[fn_MoveGenre](@MovieGenre);

					DECLARE @RatingID INT
					SET @RatingID = (
							SELECT [r].[RatingID]
							FROM [Rating] [r]
							WHERE [r].[RatingName] = @MovieRating
						);
					INSERT INTO [Movie] ([Title], [ReleaseDate], [Runtime], [RatingID])
					VALUES (@MovieTitle, @MovieReleaseDate, @MovieRuntime, @RatingID);
					
					DECLARE @id INT;
					SET @id = @@IDENTITY;
					DECLARE @GenreID INT;
					WHILE (SELECT COUNT(*) FROM @GenreTbl) > 0
					BEGIN
						SELECT @GenreID = GenreID from Genre where GenreName = (SELECT TOP 1 GenreName from @GenreTbl);
						INSERT INTO [MovieGenre] ([MovieID], [GenreID])
						VALUES (@id, @GenreID);
						delete from @GenreTbl
						where GenreName = (SELECT TOP 1 GenreName from @GenreTbl);
					END
				END
			END
			ELSE
			BEGIN
				--RAISERROR('Values should not be Null', 16, 1);
				PRINT 'Values Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0
			BEGIN
				--RAISERROR('The Movie "' + @MovieTitle + '" Already Exists', 16, 1);
				PRINT 'The Movie "' + @MovieTitle + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR('The Movie "' + @MovieTitle + '" Already Exists', 16, 1);
				PRINT 'The Movie "' + @MovieTitle + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR('The Movie "' + @MovieTitle + '" Already Exists', 16, 1);
			PRINT 'The Movie "' + @MovieTitle + '" Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR('The Movie "' + @MovieTitle + '" Already Exists', 16, 1);
			PRINT 'The Movie "' + @MovieTitle + '" Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO

