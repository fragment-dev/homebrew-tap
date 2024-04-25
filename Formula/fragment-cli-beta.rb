require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4940.0.0-darwin-x64.tar.gz"
    sha256 "50004db6a933a22f152401ce096e4490d3bfefbb4a52dfed52bcdb67439c9a29"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4940.0.0-darwin-arm64.tar.gz"
      sha256 "3c57e2aba156908655955570e690ec030b694ec507e06da71065d33efe34a8be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4940.0.0-linux-x64.tar.gz"
    sha256 "ba512daca897d4fc5a8d33be3ce8bb7a86e548a0a49f186c17101cd8b7d9a7f9"
  end
  version "4940.0.0"
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
