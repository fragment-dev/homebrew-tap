require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-darwin-x64.tar.gz"
    sha256 "ae5e14fe2c67e5ef079e7c60162767a952b428678039ac10504e42cbfe277e01"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-darwin-arm64.tar.gz"
      sha256 "59e8721d17cbfab28e57c19e204d16b1453a891f4e778ce52c607079d9565830"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.19-linux-x64.tar.gz"
    sha256 "c7373ac25a6409c427fe196db45520bde7b43c40925294204122f47f8f8108c6"
  end
  version "2023.7.19"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
