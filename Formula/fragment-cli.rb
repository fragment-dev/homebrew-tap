require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-darwin-x64.tar.gz"
    sha256 "6fff2e1e87d273c5e3f3beb0e59d9f26caf94c4609706f53362c08bebaf327fa"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-darwin-arm64.tar.gz"
      sha256 "394fa6a12af9914651834c2f3c5b8332129393294679b9bc71fd28a774011c83"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.22-linux-x64.tar.gz"
    sha256 "a5481a0baa2e4c071dd5370aeedf093b0506f576960d08b8ea0478489188de23"
  end
  version "2024.7.22"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
