function varargout = GUI_key_example(varargin)
% GUI_KEY_EXAMPLE MATLAB code for GUI_key_example.fig
%      GUI_KEY_EXAMPLE, by itself, creates a new GUI_KEY_EXAMPLE or raises the existing
%      singleton*.
%
%      H = GUI_KEY_EXAMPLE returns the handle to a new GUI_KEY_EXAMPLE or the handle to
%      the existing singleton*.
%
%      GUI_KEY_EXAMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KEY_EXAMPLE.M with the given input arguments.
%
%      GUI_KEY_EXAMPLE('Property','Value',...) creates a new GUI_KEY_EXAMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_key_example_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_key_example_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_key_example

% Last Modified by GUIDE v2.5 09-Aug-2018 22:51:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_key_example_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_key_example_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_key_example is made visible.
function GUI_key_example_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_key_example (see VARARGIN)

% Choose default command line output for GUI_key_example
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_key_example wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% add function to handle key press
set(handles.figure1, 'WindowKeyPressFcn', @key_down)


% --- Outputs from this function are returned to the command line.
function varargout = GUI_key_example_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function key_down(hObject, event)

fprintf('key pressed: %s\n',event.Key)

switch event.Key
    case 'space'
        % do something
    case 'leftarrow'
        % do another thing
    case 'rightarrow'
        % ...
end
