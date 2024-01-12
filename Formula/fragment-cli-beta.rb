require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4323.0.0-darwin-x64.tar.gz"
    sha256 "bd6e0cee0ca9aea1d96bc94eba6b61640da3c1ecd024b619b70a9026887d2f52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4323.0.0-darwin-arm64.tar.gz"
      sha256 "e36b01ac511a04385411e4d8613a846922cb55854d1aac9a58680ab9835d72af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4323.0.0-linux-x64.tar.gz"
    sha256 "d347f6086ad1a0396a0b2082dfd810d691e55d579cbfb7d0596ebd8fc8f23e56"
  end
  version "4323.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
