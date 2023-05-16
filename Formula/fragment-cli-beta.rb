require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2678.0.0-darwin-x64.tar.gz"
    sha256 "59c406ddef106f527de83ecf68560e46dd55b4c2e21ceb8424aa22b790c50818"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2678.0.0-darwin-arm64.tar.gz"
      sha256 "adc0c9dd1d793d709329aec559dcf210036aeb9a09cc8ea655387362385960d5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2678.0.0-linux-x64.tar.gz"
    sha256 "e14605af8f280f9654b7a0ec5aac0ff20ed8ba87bb846a139a3263a426b5fc77"
  end
  version "2678.0.0"
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
