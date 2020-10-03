class NodesController < ApplicationController

  def index
    if params[:id].present?
      @node = Node.find(params[:id])
    else
      @node = Node.find_by(parent_id: nil)
    end
  end

  def create
    @node = Node.new(create_params)
    @node.save
    redirect_to nodes_path(id: @node.parent_id)
  end

  def show
    @node = Node.find(params[:id])
  end

  def update
    @node = Node.find(params[:id])
    @node.update(update_params)
    if @node.file?
      redirect_to node_path(id: @node.id)
    else
      redirect_to nodes_path(id: @node.id)
    end
  end

  def destroy
  end

  private

  def create_params
    params.require(:node).permit(:name, :parent_id).tap do |v|
      v[:node_type] = params[:button]
    end
  end

  def update_params
    params.require(:node).permit(:name, :content).tap do |v|
      v[:content] = v[:content].gsub(/\r\n/, "\n")
    end
  end
end