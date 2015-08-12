class ArticlesController < ApplicationController
	#se Accede con:
	#GET /articles
	def index
	 #Obtiene todos los registros de la tabla del modelo	
	 @articles = Article.all
	end
	
	#GET article id
	def show
		#va encontrar un registro por su ID
		@article = Article.find(params[:id])
	end

	#GET /articules/:id
	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	#POST /article
	def create
		# Insert INTO
		@article = Article.new(article_params)
		if @article.save
		redirect_to @article
		else
			render :new
		end
	end

	# DELETE /article/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy # Destry elimina el objeto de la BD
		redirect_to @article		
	end

	#PUT /articles/id
	def update
		# UPDATE
		# @article.update_attributes({title: 'Nuevo titulo'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private
	def article_params
		params.require(:article).permit(:title,:body)
	end
end