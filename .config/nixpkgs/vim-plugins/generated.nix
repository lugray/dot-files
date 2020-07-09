# This file has been generated by ./pkgs/misc/vim-plugins/update.py. Do not edit!
{ lib, buildVimPluginFrom2Nix, fetchFromGitHub, overrides ? (self: super: {}) }:
let
  packages = ( self:
{
  ctrlp-modified-vim = buildVimPluginFrom2Nix {
    pname = "ctrlp-modified-vim";
    version = "2019-02-03";
    src = fetchFromGitHub {
      owner = "jasoncodes";
      repo = "ctrlp-modified.vim";
      rev = "1d51d0422b20bc61434959f5d76e60c5141ca3f8";
      sha256 = "11453ahb5x5m7nix6gwayvcvwzsggblji6rlyp5qk7avbrmd8m24";
    };
    meta.homepage = "https://github.com/jasoncodes/ctrlp-modified.vim/";
  };

  dracula-vim = buildVimPluginFrom2Nix {
    pname = "dracula-vim";
    version = "2020-05-06";
    src = fetchFromGitHub {
      owner = "dracula";
      repo = "vim";
      rev = "bb34458c42a06f1a65df22de2ea6432e17a3944a";
      sha256 = "1jj5f89a36mag0k6anj3pbyzka8gk2ysf5syqiz95f2m2lq07h3b";
    };
    meta.homepage = "https://github.com/dracula/vim/";
  };

  godoctor-vim = buildVimPluginFrom2Nix {
    pname = "godoctor-vim";
    version = "2018-03-29";
    src = fetchFromGitHub {
      owner = "godoctor";
      repo = "godoctor.vim";
      rev = "17973331d1ea88bad082fba406c1690f17943b52";
      sha256 = "0si65xlgfq5rdshk0y2v7wq72zyxp7c9ckr0xljx65raa9l5dgil";
    };
    meta.homepage = "https://github.com/godoctor/godoctor.vim/";
  };

  ReplaceWithRegister = buildVimPluginFrom2Nix {
    pname = "ReplaceWithRegister";
    version = "2014-10-31";
    src = fetchFromGitHub {
      owner = "vim-scripts";
      repo = "ReplaceWithRegister";
      rev = "832efc23111d19591d495dc72286de2fb0b09345";
      sha256 = "0mb0sx85j1k59b1zz95r4vkq4kxlb4krhncq70mq7fxrs5bnhq8g";
    };
    meta.homepage = "https://github.com/vim-scripts/ReplaceWithRegister/";
  };

  splitjoin-vim = buildVimPluginFrom2Nix {
    pname = "splitjoin-vim";
    version = "2020-04-20";
    src = fetchFromGitHub {
      owner = "AndrewRadev";
      repo = "splitjoin.vim";
      rev = "62d42e1ac5dcf8f3c70bd344d31300ee39d0e580";
      sha256 = "1d0ik668lhkrd972brh99lizrfl249srj6y8i1ag4ykr99nmydqg";
    };
    meta.homepage = "https://github.com/AndrewRadev/splitjoin.vim/";
  };

  vim-case-change = buildVimPluginFrom2Nix {
    pname = "vim-case-change";
    version = "2018-05-14";
    src = fetchFromGitHub {
      owner = "icatalina";
      repo = "vim-case-change";
      rev = "e9b30040b6c81f8361154e121fd5936a4d26f5a8";
      sha256 = "191509759yzx6jwzrs7vrxr2ivb8vxpifbxyaidqnskdqkjizhgy";
    };
    meta.homepage = "https://github.com/icatalina/vim-case-change/";
  };

  vim-textobj-rubyblock = buildVimPluginFrom2Nix {
    pname = "vim-textobj-rubyblock";
    version = "2016-09-13";
    src = fetchFromGitHub {
      owner = "nelstrom";
      repo = "vim-textobj-rubyblock";
      rev = "2b882e2cc2599078f75e6e88cd268192bf7b27bf";
      sha256 = "197m0a45ywdpq2iqng6mi5qjal2qggjjww1k95iz2s7wvh8ng9yr";
    };
    meta.homepage = "https://github.com/nelstrom/vim-textobj-rubyblock/";
  };

});
in lib.fix' (lib.extends overrides packages)