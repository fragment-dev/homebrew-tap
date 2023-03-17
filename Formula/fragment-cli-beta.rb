require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2232.0.0-darwin-x64.tar.gz"
    sha256 "1df2cb2018c1a7f1dba2286d96efececb785db059d4bbae7fd09b3240a1843e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2232.0.0-darwin-arm64.tar.gz"
      sha256 "3ebb8748ce05b45f7fcbb709eca34e9c8b9c967f4328d66f7013926dad058c81"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2232.0.0-linux-x64.tar.gz"
    sha256 "83c4899dc956026cc767d1f155c6d1dcda4c9950203107e15c4b6559b8d5016b"
  end
  version "2232.0.0"
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
