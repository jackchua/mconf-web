# Copyright 2008-2010 Universidad Politécnica de Madrid and Agora Systems S.A.
#
# This file is part of VCC (Virtual Conference Center).
#
# VCC is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# VCC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with VCC.  If not, see <http://www.gnu.org/licenses/>.

class VideosController < ApplicationController
  before_filter :space!
  
  authorization_filter [:create, :content ], :space, :only => [ :new, :create ]
  authorization_filter [:read, :content ],   :space, :only => [ :show, :index ]
  authorization_filter [:update, :content ], :space, :only => [ :edit, :update ]
  authorization_filter [:delete, :content ], :space, :only => [ :destroy ]
  
  def index
      if space.videos[0]
        @display_entry = space.videos[0];
      else
        @display_entry = nil
      end 
   
    respond_to do |format|
      format.html
    end
  end  
  
  
  def show    
    if params[:id].class == String
      @display_entry = AgendaEntry.find(params[:id].to_i)
    end
  end
   
   
  def edit
    if params[:id].class == String
      @display_entry = AgendaEntry.find(params[:id].to_i)
    end
    
    
    
  end
   
end