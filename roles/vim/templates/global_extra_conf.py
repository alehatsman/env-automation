def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        'binary_path': client_data['g:ycm_python_binary_path'],
        'python_interpreter': client_data['g:ycm_server_python_interpreter']
    }
