local get_python_venv_path = function(callback)
  local on_event = function(_, data, event)
    if event == 'stdout' then
      -- Here are gibberish leading and trailing whitespace elements.
      callback(data[1])
    end
  end
  vim.fn.jobstart(
    'python -m pipenv --venv',
    {
      on_exit = on_event,
      on_stdout = on_event,
      on_stderr = on_event,
      stdout_buffered = true,
      stderr_buffered = true,
    }
  )
end

return {
  get_python_venv_path = get_python_venv_path
}
