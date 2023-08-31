require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3451.0.0-darwin-x64.tar.gz"
    sha256 "3460438cd033424f1eedf2a5c20847222fd54f11ba26dbe83a224ff0569ca17a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3451.0.0-darwin-arm64.tar.gz"
      sha256 "f32ae859cfe410c9c81502001edc0621a33b43a9f2a88df860dca2d32b8c7017"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3451.0.0-linux-x64.tar.gz"
    sha256 "a46d4b7c5a9ed5414ab72fb5b017942eea157ce0965a40bdd28e3ffde4a1c7f7"
  end
  version "3451.0.0"
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
