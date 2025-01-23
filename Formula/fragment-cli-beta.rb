require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6124.0.0-darwin-x64.tar.gz"
    sha256 "6a19f978a3b077b2c8d59d3674477a1865923e9b1bb03a834c59c770e8e9345d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6124.0.0-darwin-arm64.tar.gz"
      sha256 "4abe0d952fc37c209e03c105cb426a6ffdf37ef66c4ac6b62b243ec4f309c087"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6124.0.0-linux-x64.tar.gz"
    sha256 "888496d712bdb8e0be44a2bae26e43a7b8906acb9a33588ef9cba6706a0ad9c6"
  end
  version "6124.0.0"
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
