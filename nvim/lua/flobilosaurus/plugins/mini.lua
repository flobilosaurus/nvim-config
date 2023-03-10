return {
  {
   -- commenting
    'echasnovski/mini.comment',
    version = false,
    config = function()
      require('mini.comment').setup()
    end
  },
  {
   -- indent scope
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup()
    end
  },
  {
   -- auto pairs
    'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
   -- surround
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup()
    end
  },
  {
   -- bracket navigation
    'echasnovski/mini.bracketed',
    version = false,
    config = function()
      require('mini.bracketed').setup()
    end
  }
}
